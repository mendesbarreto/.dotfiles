return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    table.insert(opts.ensure_installed, "prettierd")
    table.insert(opts.ensure_installed, "pyright")
    table.insert(opts.ensure_installed, "clangd")
    table.insert(opts.ensure_installed, "clang-format")
    table.insert(opts.ensure_installed, "gopls")
    table.insert(opts.ensure_installed, "rust-analyzer")
    table.insert(opts.ensure_installed, "cmake-language-server")
    table.insert(opts.ensure_installed, "omnisharp")
    table.insert(opts.ensure_installed, "biome")
    table.insert(opts.ensure_installed, "zls")
    table.insert(opts.ensure_installed, "rubocop")
    opts.ui = {
      border = "rounded",
    }
  end,
}
