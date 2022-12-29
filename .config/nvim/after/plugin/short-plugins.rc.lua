-- Enable Ident blanckline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blackline_indent = false,
}

-- Enable toggle term
require('toggleterm').setup()

-- Enable Comment
require('Comment').setup()

-- Enable Git signs 
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}


