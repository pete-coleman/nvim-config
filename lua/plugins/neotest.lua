return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("neotest").setup {
        adapters = {
          require "neotest-dotnet" {
            dap = {
              adapter_name = "coreclr",
            },
          },
        },
      }
    end,
    keys = function()
      local neotest = require "neotest"
      return {
        {
          "<leader>tr",
          function()
            neotest.run.run()
          end,
          desc = "Run test",
        },
        {
          "<leader>tR",
          function()
            neotest.run.run(vim.fn.expand "%")
          end,
          desc = "Run tests (file)",
        },
        {
          "<leader>ut",
          function()
            neotest.summary.toggle()
          end,
          desc = "Toggle test explorer",
        },
        {
          "<leader>td",
          function()
            neotest.run.run { vim.fn.expand "%", strategy = "dap" }
          end,
          desc = "Debug test",
        },
      }
    end,
  },
}
