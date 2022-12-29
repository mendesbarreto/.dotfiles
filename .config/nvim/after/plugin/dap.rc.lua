require('telescope').load_extension('dap')

local dapui = require("dapui")
local dapgo = require('dap-go')
local dap = require('dap')

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue Debbug session' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Setp over Debbug session' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into Debbug session' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Step Out Debbug session' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })

dapgo.setup()
dapui.setup()

vim.keymap.set('n', '<leader>da', dapui.toggle, { desc = 'Toggle Debug UI to see debug sesion details' })
