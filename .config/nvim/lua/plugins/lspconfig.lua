-- clangd

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = true },
    servers = {
      clangd = {
        cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      },
    },
  },
}
