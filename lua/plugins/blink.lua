return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    fuzzy = { implementation = "rust" },
    keymap = {
      preset = "default",
    },
    signature = { enabled = true },
    snippets = { preset = "default" },
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
