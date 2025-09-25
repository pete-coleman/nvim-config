return {
  "NeogitOrg/neogit",
  dependencies = {
    "folke/snacks.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neogit",
  opts = {
    integrations = { diffview = true },
  },
  keys = function()
    local neogit = require "neogit"
    return {
      {
        "<leader>go",
        neogit.open,
        desc = "Open neogit",
      },
    }
  end,
}
