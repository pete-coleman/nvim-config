vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  desc = "Lint on save",
  group = vim.api.nvim_create_augroup("lint", { clear = true }),
  callback = function()
    local lint = require "lint"
    if vim.opt_local.modifiable:get() then
      lint.try_lint()
    end
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  desc = "Auto reload files when their contents are change by an external source e.g. git",
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open dashboard if nvim is opened with a directory instead of a file",
  callback = function()
    local arg = vim.fn.argv()
    if #arg == 1 and vim.fn.isdirectory(arg[1]) == 1 then
      require("snacks").dashboard()
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Add netrw keybinds",
  pattern = "netrw",
  callback = function()
    local snacks = require "snacks"
    vim.keymap.set("n", "<Esc>", snacks.bufdelete.delete, {
      buffer = true,
      desc = "Close netrw",
    })
    vim.keymap.set("n", "\\", snacks.bufdelete.delete, {
      buffer = true,
      desc = "Close netrw",
    })
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  desc = "Add diffview keybinds",
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)

    if bufname:match "diffview" then
      vim.keymap.set("n", "<Esc>", "<cmd>DiffviewClose<CR>", {
        buffer = true,
        desc = "Close Diffview",
      })
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", ctermbg = "none" })
  end,
})
