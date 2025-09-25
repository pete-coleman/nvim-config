return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lsp_indicator = {
      function()
        local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }
        clients = vim.tbl_filter(function(c)
          return c.name ~= "copilot"
        end, clients)
        if #clients == 0 then
          return "  No LSP"
        end
        return "  " .. table.concat(
          vim.tbl_map(function(c)
            return c.name
          end, clients),
          ", "
        )
      end,
      color = { fg = "#5fafef", gui = "bold" },
    }
    local lsp_location = {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return require("nvim-navic").is_available()
      end,
    }
    local pin_indicator = {
      function()
        local hbac = require "hbac"
        return hbac.is_pinned(vim.api.nvim_get_current_buf()) and "" or ""
      end,
      color = { fg = "#ef5f6b", gui = "bold" },
    }
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
        },
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {

          {
            "filename",
            path = 0,
            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
            },
          },
          lsp_location,
        },
        lualine_x = { "filetype", lsp_indicator },
        lualine_y = { pin_indicator },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
