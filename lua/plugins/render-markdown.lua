return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = vim.fn.has "win32" == 0,
  ft = { "gitcommit", "markdown" },
  opts = {
    render_modes = { "n", "c", "t" },
    anti_conceal = {
      enabled = true,
      disabled_modes = false,
      above = 0,
      below = 0,
    },
  },
}
