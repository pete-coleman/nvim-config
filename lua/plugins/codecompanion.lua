return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = false, -- No setup; just want the auth command
    },
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "VeryLazy",
  opts = {
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
      agent = { adapter = "copilot" },
    },
  },
  keys = {
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<CR>",
      desc = "AI: Actions",
    },
    {
      "<leader>ai",
      "<cmd>CodeCompanion<CR>",
      desc = "AI: Inline",
      mode = "v",
    },
    {
      "<leader>aca",
      "<cmd>CodeCompanionChat Add<CR>",
      desc = "AI: Add to chat",
      mode = "v",
    },
    {
      "<leader>acn",
      "<cmd>CodeCompanionChat<CR>",
      desc = "AI: New chat",
      mode = { "n", "v" },
    },
    {
      "<leader>act",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "AI: Toggle chat",
      mode = { "n", "v" },
    },
  },
}
