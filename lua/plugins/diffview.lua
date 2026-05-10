return {
  "sindrets/diffview.nvim",
  opts = {
    keymaps = {
      view = {
        { "n", "<Esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
      },
      file_panel = {
        { "n", "<Esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
      },
      file_history_panel = {
        { "n", "<Esc>", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
      },
    },
  },
  keys = {
    {
      "<leader>dh",
      "<cmd>DiffviewFileHistory %<CR>",
      desc = "File history for current file",
    },
    {
      "<leader>do",
      "<cmd>DiffviewOpen<CR>",
      desc = "Working tree diff",
    },
    {
      "<leader>db",
      function()
        local snacks = require "snacks"
        snacks.picker.git_branches {
          confirm = function(picker, item)
            picker:norm(function()
              if item then
                vim.cmd("DiffviewOpen " .. item.branch)
                picker:close()
              end
            end)
          end,
        }
      end,
      desc = "Branch diff",
    },
  },
}
