-- clangd

return {
  "neovim/nvim-lspconfig",
  keys = {
    -- toggle inlay hints
    {
      "<leader>uh",
      function()
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint(0, nil)
        end
      end,
      desc = "toggle inlay hints",
    },
  },
  opts = {
    inlay_hints = { enabled = true },
    servers = {
      ocamllsp = {
        mason = false,
      },
      clangd = {
        cmd = { "clangd", "--background-index", "--offset-encoding=utf-16", "--inlay-hints=true" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      },
      hdl_checker = {
        cmd = { "hdl_checker", "--lsp" },
        mason = false,
        filetypes = { "verilog", "systemverilog", "vhdl", "hdl" },
      },
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
            inlay_hints = { enabled = true },
            hint = { enable = true },
          },
        },
      },
      gopls = {
        settings = {
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
      tsserver = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              quotePreference = "auto",
            },
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              quotePreference = "auto",
            },
          },
        },
      },
    },
  },
}
