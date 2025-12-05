return {
  "neovim/nvim-lspconfig",
  keys = {
    -- toggle inlay hints
    {
      "<leader>uh",
      function()
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      end,
      desc = "toggle inlay hints",
    },
  },
  opts = {
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
    servers = {
      codebook = {},
      ruby_lsp = {
        filetypes = { "ruby", "Fastfile", "Appfile", "MatchFile", "Pluginfile" },
      },
      rubocop = {
        filetypes = { "ruby", "Fastfile", "Appfile", "MatchFile", "Pluginfile" },
      },
      vtsls = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
                -- entriesLimit = 50,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            tsserver = {
              maxTsServerMemory = 12288,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      },
    },
  },
}
