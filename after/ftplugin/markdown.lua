-- Indentation and wrapping
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.textwidth = 120
vim.opt_local.spell = true
vim.opt_local.wrap = true

-- Visual guide at 80 chars
vim.opt_local.colorcolumn = "+0"

-- Disable autoformat if needed
vim.b.autoformat_enabled = false

-- Undo safety
vim.b.undo_ftplugin = [[
  setlocal shiftwidth< tabstop< textwidth< spell< wrap< colorcolumn<
  let b:autoformat_enabled = v:null
]]
