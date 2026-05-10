return {
  "SmiteshP/nvim-navic",
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
