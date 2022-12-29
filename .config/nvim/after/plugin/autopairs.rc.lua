local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then
    print('auto pair is not ready')
    return
end


autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
