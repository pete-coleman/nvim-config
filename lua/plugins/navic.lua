return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  event = "LspAttach",
  opts = {
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    icons = {
      Class = "󰠱 ",
      Method = "󰆧 ",
      Namespace = "󰌗 ",
    },
  },
}
