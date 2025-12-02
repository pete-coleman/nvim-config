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
  desc = "Underline diagnostics",
  pattern = "*",
  callback = function()
    local function get_hl_color(group, fallback)
      local color = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "gui")
      if color == "" or not color:match "^#%x%x%x%x%x%x$" then
        return fallback
      end
      return color
    end

    local error_color = get_hl_color("DiagnosticError", "#e67e80")
    local warn_color = get_hl_color("DiagnosticWarn", "#dbbc7f")
    local info_color = get_hl_color("DiagnosticInfo", "#7fbbb3")
    local hint_color = get_hl_color("DiagnosticHint", "#a7c080")

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = error_color })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, sp = warn_color })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, sp = info_color })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, sp = hint_color })
  end,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  desc = "Save fold state when leaving buffer",
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      vim.cmd "silent! mkview"
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Restore fold state when entering buffer",
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      vim.cmd "silent! loadview"
    end
  end,
})
