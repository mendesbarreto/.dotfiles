-- [[ Configure Telescope ]]
-- see `:help telescope` and `:help telescope.setup()z`
local telescope = require('telescope')

telescope.setup {
    defaults = {
        prompt_prefix = '$ ',
        color_devicons = true,
        file_ignore_patterns = { 'node_modules', 'dist', '.git', 'tmp', 'temp', '.vim/undodir' },
        vimgrep_arguments = { 'rg', '--hidden', '--no-heading', '--with-filename', '--line-number', '--column',
            '--smart-case' },
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    extension = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
            follow = true,
            --find_command = { 'rg', '--ignore', '--hidden', '--files' }
        }
    },
}


-- Enable telescop fzf native, if installed
telescope.load_extension('fzf')
telescope.load_extension('flutter')

local builtin = require('telescope.builtin')

--[[ Configure Key mappings for Telescope ]]
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing bufferes' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

--vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>', { desc = '[S]earch [F]iles'})
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch by [D]iagnostics' })
vim.keymap.set('n', '<leader>fc', telescope.extensions.flutter.commands, { desc = '[F]luter [C]ommands' })
