return {
  {
    "neovim/nvim-lspconfig",
    depdendencies = {
      "SmiteshP/nvim-navic",
    },
    opts = function()
      return {
        diagnostics = {
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN] = "",
              [vim.diagnostic.severity.HINT] = "",
              [vim.diagnostic.severity.INFO] = "",
            },
          },
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
        },
        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },
        codelens = {
          enabled = true,
        },
        folds = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
      }
    end,
    config = vim.schedule_wrap(function(_, opts)
      local features = {}

      -- Navic
      features["documentSymbolProvider"] = function(client, bufnr)
        local navic = require "nvim-navic"
        navic.attach(client, bufnr)
      end

      --Semantic tokens
      features["semanticTokensProvider"] = function(client, bufnr)
        vim.lsp.semantic_tokens.start(bufnr, client.id)
      end

      -- Inlay hints
      if opts.inlay_hints.enabled then
        features["inlayHintProvider"] = function(_, bufnr)
          if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buftype == "" and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[bufnr].filetype) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            vim.keymap.set("n", "<leader>ui", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
            end, { buffer = bufnr, desc = "Toggle inlay hints" })
          end
        end
      end

      -- Folds
      if opts.folds.enabled then
        features["foldingRangeProvider"] = function(_, _)
          vim.o.foldmethod = "expr"
          vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
        end
      end

      -- Code lens
      if opts.codelens.enabled and vim.lsp.codelens then
        features["codeLensProvider"] = function(client, bufnr)
          vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = bufnr,
            callback = function()
              if vim.g.codelens_enabled then
                vim.lsp.codelens.refresh { bufnr }
              else
                vim.lsp.codelens.clear(client.id, bufnr)
              end
            end,
          })
          vim.keymap.set("n", "<leader>uc", function()
            vim.g.codelens_enabled = not vim.g.codelens_enabled
          end, { buffer = bufnr, desc = "Toggle codelens" })
        end
      end

      -- Diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      if opts.capabilities then
        vim.lsp.config("*", { capabilities = opts.capabilities })
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Unified LSP setup",
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client or client.name == "copilot" then
            return
          end

          -- Disable legacy completion
          vim.bo[bufnr].formatexpr = nil
          vim.bo[bufnr].omnifunc = nil

          -- Signature help
          vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr })
          -- Features
          for key, setup in pairs(features) do
            if client.server_capabilities[key] then
              setup(client, bufnr)
            end
          end
        end,
      })
    end),
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    keys = {
      {
        "ged",
        function()
          require("omnisharp_extended").lsp_definition()
        end,
        desc = "Goto external definition",
      },
    },
  },
}
