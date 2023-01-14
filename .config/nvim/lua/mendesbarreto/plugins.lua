local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Lazy require setup the leader key before setup lazy
-- Set <space> as the leader key
-- see `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require('lazy').setup({
    -- Package manager for Nvim
    { 'wbthomason/packer.nvim' },
    -- Git command in nvim,
    { 'tpope/vim-fugitive' },
    -- GitHub integration with nvim

    { 'tpope/vim-rhubarb' },
    -- add comments on the code

    { 'numToStr/Comment.nvim' },
    -- Add relate sign to show git history modification
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update({ with_sync = true }))
        end,
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        branch = 'master',
    },
    -- Collection of configuration for built-in lsp client
    { 'neovim/nvim-lspconfig' },

    -- Manage external editor tooling i.e LSP servers
    { 'williamboman/mason.nvim' },
    -- Automatically install language servers to stdpath
    { 'williamboman/mason-lspconfig.nvim' },
    { 'ray-x/go.nvim' },
    -- recommanded if need floating window support
    { 'ray-x/guihua.lua' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
        },
    }, -- Auto completion
    { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = { 'hrsh7th/nvim-cmp' } },
    -- Snippet Engine and Snippet Expansion
    { 'L3MON4D3/LuaSnip', dependencies = { 'saadparwaiz1/cmp_luasnip' } },

    -- ========= [[ THEMES ]] ===========
    -- Theme inspired by Atom
    { 'joshdick/onedark.vim' },
    -- Theme inspired by Atom
    { 'marko-cerovac/material.nvim' },
    { "catppuccin/nvim", name = "catppuccin" },

    -- Auto close brackets, parens, quotes and etc.
    { 'windwp/nvim-autopairs' },

    --use { 'rakr/vim-one', branch = 'master' }
    -- Fancier status line
    { 'nvim-lualine/lualine.nvim' },
    -- Add identatnion lines
    { 'lukas-reineke/indent-blankline.nvim' },
    -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- Fuzzy  Finder Algorithm which requires local dependencies to be built.
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'MunifTanjim/eslint.nvim' },
    { 'MunifTanjim/prettier.nvim' },
    { "glepnir/lspsaga.nvim", event = 'BufRead' },

    -- Terminal on neovim
    { 'akinsho/toggleterm.nvim', version = '*' },

    -- DAP
    { 'mfussenegger/nvim-dap' },
    { 'leoluz/nvim-dap-go' },
    { 'theHamsta/nvim-dap-virtual-text' },
    { 'nvim-telescope/telescope-dap.nvim' },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
})
