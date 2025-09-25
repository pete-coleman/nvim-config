return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  build = "cargo build --release",
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      preset = "default",
    },
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
    sources = {
      default = {
        "lsp",
        "buffer",
        "path",
        "snippets",
      },
    },
  },
}
