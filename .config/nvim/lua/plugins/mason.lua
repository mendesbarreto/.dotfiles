return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettierd")
    table.insert(opts.ensure_installed, "pyright")
    table.insert(opts.ensure_installed, "clangd")
    table.insert(opts.ensure_installed, "clang-format")
    table.insert(opts.ensure_installed, "gopls")
    table.insert(opts.ensure_installed, "rust-analyzer")
    table.insert(opts.ensure_installed, "cmake-language-server")

    opts.ui = {
      border = "rounded",
    }
  end,
}
