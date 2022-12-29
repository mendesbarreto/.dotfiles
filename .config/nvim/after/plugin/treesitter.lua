-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
    -- Specify the languages that should be installed
    ensure_installed = {
        'c',
        'go',
        'lua',
        'python',
        'rust',
        'typescript',
        'javascript',
        'cmake',
        'css',
        'dart',
        'bash',
        'graphql',
        'kotlin',
        'markdown',
        'json',
        'ruby',
        'regex',
        'swift',
        'tsx',
        'yaml',
        'dockerfile'
    },
    auto_install = true,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<c-backspace>',
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.iner',
            },
        },
    },
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
        },
        goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
        },
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
        },
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
            ['<leader>A'] = '@parameter.inner',
        },
    },
}
