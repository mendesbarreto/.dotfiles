local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Save changes from vim to the system clipboard
opt.clipboard = "unnamed"

-- The scroll offse will be 15 lines
opt.scrolloff = 15

vim.o.cmdheight = 0
vim.o.showcmdloc = "statusline"
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
