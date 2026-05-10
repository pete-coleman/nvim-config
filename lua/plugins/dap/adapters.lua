local M = {}

local function netcoredbg()
  local dap = require "dap"
  dap.adapters.coreclr = {
    type = "executable",
    command = vim.fn.exepath "netcoredbg",
    args = { "--interpreter=vscode" },
    options = {
      detached = false,
    },
  }
  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "Launch file",
      request = "launch",
      program = function()
        return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/", "file")
      end,
      env = {
        ASPNETCORE_ENVIRONMENT = "Development",
      },
    },
  }
end

function M.setup()
  netcoredbg()
end

return M
