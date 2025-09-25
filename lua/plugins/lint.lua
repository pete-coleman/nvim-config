return {
  "mfussenegger/nvim-lint",
  event = "BufWritePre",
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      markdown = { "markdownlint" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }
  end,
  keys = function()
    local lint = require "lint"
    return { {
      "<leader>rl",
      lint.try_lint,
      desc = "Run lint",
    } }
  end,
}
