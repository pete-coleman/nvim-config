return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "codecompanion", "gitcommit", "markdown" },
  opts = {
    completions = { lsp = { enabled = true } },
    render_modes = { "n", "c", "t" },
    anti_conceal = {
      enabled = true, -- Prevent conceal on cursor line
      disabled_modes = false,
      above = 0,
      below = 0,
    },
  },
}
