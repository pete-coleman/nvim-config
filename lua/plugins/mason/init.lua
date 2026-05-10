local config = require "plugins.mason.config"

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      } },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      { "jay-babu/mason-nvim-dap.nvim", opts = {} },
    },
    opts = {
      ensure_installed = config.ensure_installed,
      run_on_start = true,
    },
  },
}
