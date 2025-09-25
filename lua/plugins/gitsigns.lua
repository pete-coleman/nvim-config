return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
  keys = function()
    local gitsigns = require "gitsigns"
    return {
      {
        "<leader>gb",
        gitsigns.blame_line,
        desc = "Blame line",
      },
      {
        "<leader>gB",
        gitsigns.blame,
        desc = "Blame buffer",
      },
      {
        "<leader>gp",
        gitsigns.preview_hunk,
        desc = "Preview hunk",
      },
      {
        "<leader>ub",
        gitsigns.toggle_current_line_blame,
        desc = "Toggle blame line",
      },
      {
        "]c",
        function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk { direction = "next" }
          end
        end,
        desc = "next change",
      },
      {
        "[c",
        function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk { direction = "prev" }
          end
        end,
        desc = "prev change",
      },
    }
  end,
}
