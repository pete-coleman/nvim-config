-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {})

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Execute Lua
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute line (Lua)" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute selection (Lua)" })

-- QOL
vim.keymap.set("n", "<leader><CR>", "a<CR><Esc>", { desc = "Insert carriage return here" })
vim.keymap.set("v", "<leader>p", [["_dP]], { desc = "Paste and discard selection" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [[:keepjumps normal! mzgg"+yG`z<CR>]], { desc = "Yank entire buffer to system clipboard" })

-- Quickfix
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open qflist" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close qflist" })
vim.keymap.set("n", "<leader>qe", function()
  vim.diagnostic.setqflist { severity = vim.diagnostic.severity.ERROR }
end, { desc = "Show errors in qflist" })
vim.keymap.set("n", "<leader>qw", function()
  vim.diagnostic.setqflist { severity = vim.diagnostic.severity.WARN }
end, { desc = "Show warnings in qflist" })

-- Netrw
vim.keymap.set("n", "\\", "<cmd>Ex<CR>", { desc = "Open netrw" })
vim.keymap.set("n", "<C-\\>", function()
  vim.cmd("Ex " .. vim.fn.getcwd())
end, { desc = "Open netrw at cwd" })
