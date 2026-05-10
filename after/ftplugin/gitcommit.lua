-- Git commit conventions
vim.opt_local.textwidth = 72
vim.opt_local.colorcolumn = "+0"
vim.opt_local.spell = true
vim.opt_local.wrap = true

-- Undo safety
vim.b.undo_ftplugin = [[
  setlocal textwidth< colorcolumn< spell< wrap<
]]
