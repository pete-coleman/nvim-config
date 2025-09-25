return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio",
    { "rcarriga/nvim-dap-ui", opts = {} },
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
  },
  keys = function()
    local dap = require "dap"
    local dapui = require "dapui"
    return {
      {
        "<F1>",
        function()
          dap.step_into()
        end,
        desc = "Debug: Step Into",
      },
      {
        "<F2>",
        function()
          dap.step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<F3>",
        function()
          dap.step_out()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<F4>",
        function()
          dap.step_back()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<F5>",
        function()
          dap.continue()
        end,
        desc = "Debug: Start/Continue",
      },
      {
        "<S-F5>",
        function()
          dap.run_to_cursor()
        end,
        desc = "Debug: Run To Cursor",
      },
      {
        "<F7>",
        function()
          dapui.toggle()
        end,
        desc = "Debug: See last session result.",
      },
      {
        "<leader>b",
        function()
          dap.toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
      {
        "<leader>k",
        function()
          dapui.eval()
        end,
        desc = "Debug: Evaluate Cursor",
        mode = { "n", "v" },
      },
    }
  end,
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    local adapters = require "plugins.dap.adapters"

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    adapters.setup()
  end,
}
