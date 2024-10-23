-- clangd
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
  opts = function(_, opts)
    table.insert(opts.inlay_hints, { enabled = false })
    table.insert(opts.codelens, { enabled = true })

    opts.diagnostics = {
      float = {
        border = "rounded",
      },
    }

    local servers = {
      pyright = {
        enabled = true,
      },
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
    }

    for _, value in ipairs(servers) do
      table.insert(opts.servers, { value })
    end
  end,
  setup = {
    eslint = function()
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "biome" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = false
        elseif client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end)
    end,

    jsonls = function()
      require("lazyvim.util").lsp.on_attach(function(client)
        if client.name == "biome" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "prettier" then
          client.server_capabilities.documentFormattingProvider = false
        elseif client.name == "jsonls" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end)
    end,
  },
}
