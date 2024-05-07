local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')
local icons = require('lib.icons').diagnostics

local lsp_servers = {
    'clangd',
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp', -- check typos
    'vimls',
}

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_servers = {}
if auto_install then
    installed_servers = lsp_servers
end

local lsp_capabilities = cmp_lsp.default_capabilities()
local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
    })
end

local signs = { Error = icons.Error, Warn = icons.Warning, Hint = icons.Hint, Info = icons.Information }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

lspconfig.pyright.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
    capabilities = lsp_capabilities,
    root_dir = lspconfig.util.root_pattern('package.json'),
})

require('mason-lspconfig').setup({
    ensure_installed = installed_servers,
    handlers = {
        default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                        format = {
                            enable = true,
                            defaultConfig = {
                                align_continuous_assign_statement = false,
                                align_continuous_rect_table_field = false,
                                align_array_table = false,
                            },
                        },
                    },
                },
            })
        end,
    },
})

lspconfig.eslint.setup({
    --- ...
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
        })
    end,
})

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lsp_capabilities.offsetEncoding = { 'utf-16' }

lspconfig['clangd'].setup({
    capabilities = lsp_capabilities,
    -- on_attach = on_attach,
    filetypes = { 'h', 'c', 'cpp', 'cc', 'objc', 'objcpp' },
    flags = lsp_flags,
    cmd = { 'clangd', '--background-index' },
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern(
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git'
    ),
})
