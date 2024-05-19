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
    table.insert(opts.inlay_hints, { enabled = true })
    table.insert(opts, {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    })
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
}
