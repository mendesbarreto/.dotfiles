local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager for Nvim
    use 'tpope/vim-fugitive' -- Git command in nvim
    use 'tpope/vim-rhubarb' -- GitHub integration with nvim
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add relate sign to show git history modification
    use 'numToStr/Comment.nvim' -- add comments on the code
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        branch = 'master'
    }
    use 'neovim/nvim-lspconfig' -- Collection of configuration for built-in lsp client
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' }, branch = 'master' }
    use 'williamboman/mason.nvim' -- Manage external editor tooling i.e LSP servers
    use 'williamboman/mason-lspconfig.nvim' -- Automatically install language servers to stdpath
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
        }
    } -- Auto completion
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } } -- Snippet Engine and Snippet Expansion

    -- Themes
    use { 'joshdick/onedark.vim' } -- Theme inspired by Atom
    use { 'marko-cerovac/material.nvim' } -- Theme inspired by Atom

    -- Auto close brackets, parens, quotes and etc.
    use { 'windwp/nvim-autopairs' }

    --use { 'rakr/vim-one', branch = 'master' }
    use 'nvim-lualine/lualine.nvim' -- Fancier status line
    use 'lukas-reineke/indent-blankline.nvim' -- Add identatnion lines
    -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    -- Fuzzy  Finder Algorithm which requires local dependencies to be built.
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/eslint.nvim'
    use 'MunifTanjim/prettier.nvim'
    use { "glepnir/lspsaga.nvim", branch = "main" }

    -- Terminal on neovim
    use { 'akinsho/toggleterm.nvim', tag = '*' }

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
    if is_bootstrap then
        require('packer').sync()
    end
end)
