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
        local dll_info = require("easy-dotnet").get_debug_dll()
        print(vim.inspect(dll_info))
        if not dll_info or not dll_info.dll_path then
          vim.notify("No debug DLL found", vim.log.levels.WARN)
          return vim.fn.tempname()
        end
        vim.notify("Starting debugger using " .. dll_info.dll_path, 1)

        return dll_info.dll_path
      end,
      env = {
        ASPNETCORE_ENVIRONMENT = "Development",
      },
      preLaunchTask = function()
        -- local dotnet = require "easy-dotnet"
        -- dotnet.build_solution()
      end,
    },
  }
end

function M.setup()
  netcoredbg()
end

return M
