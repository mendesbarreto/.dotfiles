-- Enable toggle term
require('toggleterm').setup({ autochdir = true })

local terminal = require('toggleterm.terminal').Terminal

local lazygit = terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

vim.keymap.set('n', '<leader>gt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal on the current window' })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])

function lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>git', lazygit_toggle, { silent = true, desc = 'Toggle lazzygit on the current window'})

