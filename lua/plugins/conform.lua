return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    format_on_save = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
    },
  },
  keys = function()
    local conform = require "conform"
    return {
      {
        "<leader>rf",
        conform.format,
        desc = "Run format",
      },
    }
  end,
}
