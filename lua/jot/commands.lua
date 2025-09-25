local config = require "jot.config"
local pickers = require "jot.pickers"
local M = {}

function M.new_note()
  local timestamp = os.date "%Y-%m-%d_%H-%M-%S"

  vim.ui.input({ prompt = "Enter filename: " }, function(name)
    if name == nil then
      return
    end

    name = name ~= "" and name or timestamp

    vim.ui.input({ prompt = "Enter filetype: " }, function(ft)
      if ft == nil then
        return
      end

      ft = ft ~= "" and ft or config.opts.default_ft

      local filename = string.format("%s.%s", name, ft)
      local path = config.opts.notes_dir .. filename

      vim.cmd("edit " .. path)
      vim.cmd "filetype detect"
    end)
  end)
end

function M.pick_note()
  if pickers[config.opts.picker] then
    pickers[config.opts.picker]()
  else
    vim.notify("Unsupported picker: " .. config.opts.picker, vim.log.levels.ERROR)
  end
end

return M
