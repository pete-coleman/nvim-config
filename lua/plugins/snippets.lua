return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "InsertEnter",
  version = "v2.*",
  config = function()
    local luasnip = require "luasnip"
    luasnip.setup { enable_autosnippets = true }

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/lua/snippets" },
    }
  end,
}
