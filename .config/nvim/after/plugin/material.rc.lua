local status, material = pcall(require, 'material')

if not status then
    print('The plugin material is not ready')
    return
end

material.setup({
    plugins = {
        'dap',
        'gitsigns',
        'indent-blankline',
        'lspsaga',
        'nvim-cmp',
        'telescope',
    }
})
