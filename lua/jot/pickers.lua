local config = require "jot.config"
local M = {}

function M.telescope()
  if vim.fn.exists ":Telescope" == 1 then
    require("telescope.builtin").find_files {
      prompt_title = "📓 Jot Notes",
      cwd = config.opts.notes_dir,
      hidden = true,
    }
  else
    vim.notify("Telescope not found", vim.log.levels.ERROR)
  end
end

function M.snacks()
  local ok, snacks = pcall(require, "snacks")
  if ok then
    snacks.picker.files { cwd = config.opts.notes_dir }
  else
    vim.notify("Snacks not found", vim.log.levels.ERROR)
  end
end

function M.minipick()
  local ok, minifiles = pcall(require, "mini.files")
  if ok then
    minifiles.start { source = { items = vim.fn.readdir(config.opts.notes_dir) } }
  else
    vim.notify("Minifiles not found", vim.log.levels.ERROR)
  end
end

return M
