local M = {}

M.opts = {
  default_ft = "md",
  notes_dir = vim.fn.stdpath "data" .. "/jot/",
  picker = "snacks",
}

function M.setup(user_opts)
  M.opts = vim.tbl_deep_extend("force", M.opts, user_opts or {})
  vim.fn.mkdir(M.opts.notes_dir, "p")
end

return M
