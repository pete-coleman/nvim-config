return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      bufdelete = {},
      dashboard = {
        enabled = true,
        preset = {
          header = [[
██████╗ ███████╗████████╗███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔══██╗██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔══██╗████╗  ██║
██████╔╝█████╗     ██║   █████╗  ██╔████╔██║███████║██╔██╗ ██║
██╔═══╝ ██╔══╝     ██║   ██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
██║     ███████╗   ██║   ███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
╚═╝     ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
          ]],
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "M", desc = "Mason", action = ":Mason" },
            { icon = "󰒍", key = "C", desc = "Checkhealth", action = ":checkhealth" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      indent = { animate = { enabled = false } },
      notifier = {},
      picker = {},
    },
    keys = function()
      local snacks = require "snacks"
      return {
        {
          "<leader>u.",
          function()
            snacks.scratch()
          end,
          desc = "Toggle scratch buffer",
        },
        {
          "<leader>s.",
          function()
            snacks.scratch.select()
          end,
          desc = "Select scratch buffer",
        },
        {
          "<leader>sb",
          function()
            snacks.picker.buffers()
          end,
          desc = "Search buffers",
        },
        {
          "<leader>s:",
          function()
            snacks.picker.command_history()
          end,
          desc = "Search command history",
        },
        {
          "<leader>sn",
          function()
            snacks.picker.notifications()
          end,
          desc = "Search notification history",
        },
        {
          "<leader>sc",
          function()
            snacks.picker.files { cwd = vim.fn.stdpath "config" }
          end,
          desc = "Search config",
        },
        {
          "<leader>sf",
          function()
            snacks.picker.files()
          end,
          desc = "Search files",
        },
        {
          "<leader>sR",
          function()
            snacks.picker.recent()
          end,
          desc = "Search recent",
        },
        {
          "<leader>sgl",
          function()
            snacks.picker.git_log()
          end,
          desc = "Search git log",
        },
        {
          "<leader>sgL",
          function()
            snacks.picker.git_log_line()
          end,
          desc = "Search git log (line)",
        },
        {
          "<leader>sgs",
          function()
            snacks.picker.git_status()
          end,
          desc = "Search git status",
        },
        {
          "<leader>sgd",
          function()
            snacks.picker.git_diff()
          end,
          desc = "Search git diff (hunks)",
        },
        {
          "<leader>sgf",
          function()
            snacks.picker.git_log_file()
          end,
          desc = "Search git log (file)",
        },
        {
          "<leader>/",
          function()
            snacks.picker.lines()
          end,
          desc = "Search buffer",
        },
        {
          "<leader>sG",
          function()
            snacks.picker.grep()
          end,
          desc = "Search files (grep)",
        },
        {
          "<leader>sw",
          function()
            snacks.picker.grep_word()
          end,
          desc = "Search word",
          mode = { "n", "x" },
        },
        {
          '<leader>s"',
          function()
            snacks.picker.registers()
          end,
          desc = "Search registers",
        },
        {
          "<leader>s/",
          function()
            snacks.picker.search_history()
          end,
          desc = "Search history",
        },
        {
          "<leader>sa",
          function()
            snacks.picker.autocmds()
          end,
          desc = "Search autocmds",
        },
        {
          "<leader>sd",
          function()
            snacks.picker.diagnostics()
          end,
          desc = "Search diagnostics",
        },
        {
          "<leader>sD",
          function()
            snacks.picker.diagnostics_buffer()
          end,
          desc = "Search diagnostics (buffer)",
        },
        {
          "<leader>sh",
          function()
            snacks.picker.help()
          end,
          desc = "Search help",
        },
        {
          "<leader>sH",
          function()
            snacks.picker.highlights()
          end,
          desc = "Search highlights",
        },
        {
          "<leader>sj",
          function()
            snacks.picker.jumps()
          end,
          desc = "Search jumps",
        },
        {
          "<leader>sk",
          function()
            snacks.picker.keymaps()
          end,
          desc = "Search keymaps",
        },
        {
          "<leader>sl",
          function()
            snacks.picker.loclist()
          end,
          desc = "Search location list",
        },
        {
          "<leader>sm",
          function()
            snacks.picker.marks()
          end,
          desc = "Search marks",
        },
        {
          "<leader>sp",
          function()
            snacks.picker.lazy()
          end,
          desc = "Search plugins",
        },
        {
          "<leader>sq",
          function()
            snacks.picker.qflist()
          end,
          desc = "Search quickfix list",
        },
        {
          "<leader>sr",
          function()
            snacks.picker.resume()
          end,
          desc = "Resume search",
        },
        {
          "<leader>su",
          function()
            snacks.picker.undo()
          end,
          desc = "Search undo history",
        },
        {
          "<leader>sC",
          function()
            snacks.picker.colorschemes()
          end,
          desc = "Search colorschemes",
        },
        {
          "gd",
          function()
            snacks.picker.lsp_definitions()
          end,
          desc = "Goto definition",
        },
        {
          "gD",
          function()
            snacks.picker.lsp_declarations()
          end,
          desc = "Goto declaration",
        },
        {
          "grr",
          function()
            snacks.picker.lsp_references()
          end,
          desc = "Goto references",
        },
        {
          "gri",
          function()
            snacks.picker.lsp_implementations()
          end,
          desc = "Goto implementation",
        },
        {
          "gy",
          function()
            snacks.picker.lsp_type_definitions()
          end,
          desc = "Goto type definition",
        },
        {
          "<leader>ssd",
          function()
            snacks.picker.lsp_symbols()
          end,
          desc = "Document symbols",
        },
        {
          "<leader>ssw",
          function()
            snacks.picker.lsp_workspace_symbols()
          end,
          desc = "Workspace symbols",
        },
      }
    end,
  },
}
