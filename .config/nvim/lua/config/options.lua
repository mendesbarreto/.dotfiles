local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Save changes from vim to the system clipboard
opt.clipboard = "unnamed"

-- The scroll offse will be 15 lines
opt.scrolloff = 15
opt.showmode = false

vim.o.cmdheight = 0
vim.o.showcmdloc = "statusline"
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.g.OmniSharp_server_use_net6 = 1
vim.g.lazyvim_prettier_needs_config = true
vim.g.snacks_animate = false
vim.g.neovide_input_macos_option_key_is_meta = "only_left"
vim.opt.laststatus = 3

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.py", "*.go" },
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.expandtab = true
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.js", "*.ts" },
--   callback = function()
--     vim.opt_local.tabstop = 2
--     vim.opt_local.shiftwidth = 2
--     vim.opt_local.expandtab = true
--   end,
-- })
