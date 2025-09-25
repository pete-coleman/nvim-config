return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require "harpoon"
    local keys = {
      {
        "<leader>h",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon file",
      },
      {
        "<leader>uh",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Toggle harpoon menu",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "Jump to file " .. i,
      })
    end
    return keys
  end,
}
