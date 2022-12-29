local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
    print(status)
    return
end

local status, saga = pcall(require, "lspsaga")
if (not status) then
    print(status)
    return
end

local utils = require('mendesbarreto/utils')
local map = utils.map

require('vim.lsp.protocol')

saga.init_lsp_saga()

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

-- LSP Settings
--
local on_attach = function(client, bufnr)
    local builtin = require('telescope.builtin')

    -- LSP saga
    map.buffnv('<leader>ca', '<cmd>Lspsaga code_action<CR>', { buffer = bufnr })
    map.n('<leader>rn', '<cmd>Lspsaga rename<CR>', { silent = true, desc = '[R]e[n]ame' })
    map.n('<leader>gk', '<cmd>Lspsaga peek_definition<CR>', { silent = true })

    -- Neovim LSP
    --map.n('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- map.n('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    --map.n('<leader>dk', vim.lsp.buf.peek_definition, '[G]oto [D]efinition')
    map.buffn('<leader>gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation', buffer = bufnr })
    map.buffn('<leader>gr', builtin.lsp_references, { desc = '[G]oto Show code [R]eferences', buffer = bufnr })
    map.buffn('<leader>ds', builtin.lsp_document_symbols, { desc = '[D]document [S]ymbols', buffer = bufnr })
    map.buffn('<leader>dof', vim.diagnostic.open_float, { desc = '[D]iagnostic [O]pen [F]loat', buffer = bufnr })
    map.buffn('<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols', buffer = bufnr })
    map.buffn('<leader>df', vim.diagnostic.goto_next, { desc = '[D]iagnostic [F]woard', buffer = bufnr })
    map.buffn('<leader>db', vim.diagnostic.goto_prev, { desc = '[D]iagnostic [B]ackward', buffer = bufnr })

    -- -- See `:help K` for hwy this keymap
    map.buffn('K', vim.lsp.buf.hover, { desc = 'Hover Documentation', buffer = bufnr })
    map.buffn('<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation', buffer = bufnr })

    -- -- Lesser used LSP functionality
    map.buffn('<leader>gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition', buffer = bufnr })
    map.buffn('<leader>gt', vim.lsp.buf.type_definition, { desc = '[G]oto [T]ype Definition', buffer = bufnr })
    map.buffn('<leader>gi', vim.lsp.buf.implementation, { desc = '[g]oto [i]mplementation', buffer = bufnr })
    map.buffn('<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder', buffer = bufnr })
    map.buffn('<leader>wr', vim.lsp.buf.remove_workspace_folder,
        { desc = '[W]orkspace [R]emove Folder', buffer = bufnr })
    map.buffn('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = '[W]orkspace [L]ist Folders', buffer = bufnr })
    enable_format_on_save(client, bufnr)
    -- Display Diagnostic box on cursor hover
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --     buffer = bufnr,
    --     callback = function()
    --         local opts_ = {
    --             focusable = false,
    --             close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --             border = 'rounded',
    --             source = 'always',
    --             prefix = ' ',
    --             scope = 'cursor',
    --         }
    --         vim.diagnostic.open_float(nil, opts_)
    --     end
    -- })

end

-- Example custom configuration for lua
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Set up completion usin gnvim_cmp with LSP Source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Setup maon to manage external tooling
require('mason').setup()

-- Setup mason so it can manage external tooling

local servers = {
    'clangd',
    'rust_analyzer',
    'pyright',
    'tsserver',
    'sumneko_lua',
    'cmake',
    'cssls',
    'cucumber_language_server',
    'dockerls',
    'gopls',
    'gradle_ls',
    'graphql',
    'groovyls',
    'jsonls',
    'kotlin_language_server',
    'marksman', -- Markdown
    'ruby_ls',
    'sqls',
    'taplo', -- TOML
    'tailwindcss', -- tailwindcss
    'terraformls',
    'yamlls',
}

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
    ensure_installed = servers,
    automatic_installation = true,
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

nvim_lsp.sumneko_lua.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },

            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },

            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})

-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--     cmd = { "typescript-language-server", "--stdio" },
--     capabilities = capabilities
-- }

-- Show line diagnostics automatically in hover window
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = ture,
    -- Make the diagnostics open a float box to explain the Error
    -- Some times the error is too long to display on the line
    float = {
        show_header = true,
        border = 'rounded',
        source = "always", -- Or "if_many"
    },
    severity_sort = true
})
