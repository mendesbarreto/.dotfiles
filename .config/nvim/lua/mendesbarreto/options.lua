print("Loading Options")

vim.scriptencoding = 'utf-8'

-- Make line number default
vim.wo.number = true

local opt = vim.o
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.title = true

-- Set highlight on search
opt.hlsearch = false
opt.incsearch = true

-- Show relative number
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = 'a'

-- Save undo history
opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Set no writen buffer to hidden
opt.hidden = true

-- Save changes from vim to the system clipboard
opt.clipboard = 'unnamed'

-- Add column to avoid write a lot on the horizontal
opt.colorcolumn = 80

-- The scroll offset will be 10 lines
opt.scrolloff = 15

-- Set undo dir to support undo even after file closes
opt.undodir = '~/.vim/undodir'

-- Remove support for backup files
vim.noswapfile = true
vim.nobackup = true

-- Enable hightlight on the line the cursor is
opt.cursorline = true

-- Add two line to output from commands on neovim
opt.cmdheight = 1

opt.laststatus = 2

vim.cmd [[syntax on]]

-- Set identation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true
vim.nowrap = true
opt.breakindent = true


-- Decrease update time
opt.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.g.material_style = "deep ocean"

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- see `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Keymaps for better defaul experience
-- See `:help vimkeymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Set colorscheme
opt.termguicolors = true
vim.cmd [[colorscheme material]]
-- vim.cmd [[set background=dark]]
