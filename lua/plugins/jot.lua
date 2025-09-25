return {
  dir = vim.fn.stdpath "config" .. "/lua/jot",
  main = "jot",
  opts = {
    picker = "snacks",
  },
  keys = function()
    local jot = require "jot.commands"
    return {
      {
        "<leader>jn",
        jot.new_note,
        desc = "Jot: New note",
      },
      {
        "<leader>jp",
        jot.pick_note,
        desc = "Jot: Pick note",
      },
    }
  end,
}
