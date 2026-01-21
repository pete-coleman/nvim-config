local config = {
  debuggers = {
    "netcoredbg",
  },
  formatters = {
    "prettierd",
    "stylua",
  },
  linters = {
    "eslint_d",
    "markdownlint",
  },
  lsp_servers = {
    "clangd",
    -- "copilot",
    "gopls",
    "lua_ls",
    "omnisharp",
    "phpactor",
    "powershell_es",
    "sqlls",
    "ts_ls",
  },
}

config.ensure_installed = vim.iter({ config.debuggers, config.formatters, config.linters, config.lsp_servers }):flatten():totable()

return config
