return {
  "axkirillov/hbac.nvim",
  event = "BufEnter",
  opts = {
    autoclose = true,
    threshold = 3,
    close_command = function(bufnr)
      local snacks = require "snacks"
      snacks.bufdelete(bufnr)
    end,
    close_buffers_with_windows = false,
  },
  keys = function()
    local hbac = require "hbac"
    local lualine = require "lualine"
    return {
      {
        "<leader>up",
        function()
          hbac.toggle_pin()
          lualine.refresh()
        end,
        desc = "Toggle buffer pin",
      },
      {
        "<leader>P",
        function()
          hbac.unpin_all()
          hbac.close_unpinned()
        end,
        desc = "Close all buffers",
      },
    }
  end,
}
