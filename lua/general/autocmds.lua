-- Roslyn only supports pull diagnostics; Neovim doesn't pull often enough
-- so diagnostics can go stale after fixing errors. Force a refresh on common events.
vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
  desc = "Refresh Roslyn pull diagnostics",
  group = vim.api.nvim_create_augroup("roslyn-diagnostics", { clear = true }),
  pattern = "*.cs",
  callback = function()
    local clients = vim.lsp.get_clients({ name = "roslyn" })
    if #clients == 0 then
      return
    end

    local client = clients[1]
    for buf in pairs(client.attached_buffers) do
      local params = { textDocument = vim.lsp.util.make_text_document_params(buf) }
      client:request("textDocument/diagnostic", params, nil, buf)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable treesitter highlighting and indentation",
  group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
  callback = function(args)
    local buf = args.buf
    -- Schedule to avoid timing issues when the event fires during startup
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(buf) then return end
      pcall(vim.treesitter.start, buf)
      if pcall(require, "nvim-treesitter") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end)
  end,
})

-- LspTokenUpdate fires after nvim has actually applied semantic tokens to the buffer,
-- so this is the correct moment to flush (unlike LspProgress which fires too early).
vim.api.nvim_create_autocmd("LspTokenUpdate", {
  desc = "Flush display after semantic tokens are applied to a buffer",
  group = vim.api.nvim_create_augroup("lsp-token-redraw", { clear = true }),
  callback = function()
    vim.cmd("redraw!")
  end,
})

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
  desc = "Auto reload files when their contents are changed by an external source e.g. git",
  group = vim.api.nvim_create_augroup("auto-reload", { clear = true }),
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open dashboard if nvim is opened with a directory instead of a file",
  group = vim.api.nvim_create_augroup("dashboard-dir", { clear = true }),
  callback = function()
    local arg = vim.fn.argv()
    if #arg == 1 and vim.fn.isdirectory(arg[1]) == 1 then
      require("snacks").dashboard()
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Underline diagnostics",
  group = vim.api.nvim_create_augroup("diagnostic-underlines", { clear = true }),
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
  group = vim.api.nvim_create_augroup("save-folds", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      vim.cmd "silent! mkview"
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Restore fold state when entering buffer",
  group = vim.api.nvim_create_augroup("load-folds", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      vim.cmd "silent! loadview"
    end
  end,
})
