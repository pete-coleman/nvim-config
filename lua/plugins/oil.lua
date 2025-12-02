return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
    },
    keymaps = {
      ["<Esc>"] = "actions.close",
      ["\\"] = "actions.close",
    },
  },
  keys = function()
    return {
      {
        "\\",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
      {
        "<C-\\>",
        function()
          require("oil").open(vim.fn.getcwd())
        end,
        desc = "Open cwd",
      },
    }
  end,
}
