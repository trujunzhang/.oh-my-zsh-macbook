local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

function merge_table(table1, table2)
    for _, value in ipairs(table2) do
        table1[#table1 + 1] = value
    end
    return table1
end

local slow_format_filetypes = { 'typescript', 'javascript' }

local plugins_UI = {
    -- UI
}
local plugins_Language = {
    -- Language
}
local plugins_Mini = {
    {
        'echasnovski/mini.comment',
        version = '*',
        dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
        config = load_config('lang.comment'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('lang.surround'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
}
local plugins_Treesitter = {
    -- Tresitter
}

local plugins_LSP = {
    -- LSP
    -- {
    --     'nvimtools/none-ls.nvim',
    --     dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
    --     config = load_config('lang.null-ls'),
    --     event = { 'BufReadPre', 'BufNewFile' },
    -- },
}

local plugins_Completion = {
    -- Completion
    ,
}
local plugins_Tools = {
    -- Tools
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     dependencies = {
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     config = load_config('tools.nvim-tree'),
    --     cmd = 'NvimTreeToggle',
    -- },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'InsertEnter',
    },
    -- {
    --     'folke/flash.nvim',
    --     config = load_config('tools.flash'),
    --     keys = {
    --         {
    --             's',
    --             mode = { 'n', 'x', 'o' },
    --             function()
    --                 require('flash').jump()
    --             end,
    --             desc = 'Flash',
    --         },
    --         {
    --             'S',
    --             mode = { 'n', 'x', 'o' },
    --             function()
    --                 require('flash').treesitter()
    --             end,
    --             desc = 'Flash Treesitter',
    --         },
    --         {
    --             'r',
    --             mode = 'o',
    --             function()
    --                 require('flash').remote()
    --             end,
    --             desc = 'Remote Flash',
    --         },
    --         {
    --             'R',
    --             mode = { 'o', 'x' },
    --             function()
    --                 require('flash').treesitter_search()
    --             end,
    --             desc = 'Treesitter Search',
    --         },
    --         {
    --             '<c-s>',
    --             mode = { 'c' },
    --             function()
    --                 require('flash').toggle()
    --             end,
    --             desc = 'Toggle Flash Search',
    --         },
    --     },
    -- },
    {
        'aserowy/tmux.nvim',
        config = load_config('tools.tmux'),
        event = function()
            if vim.fn.exists('$TMUX') == 1 then
                return 'VeryLazy'
            end
        end,
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
    {
        'uga-rosa/ccc.nvim',
        config = load_config('tools.ccc'),
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    },
    {
        '2kabhishek/tdo.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
        keys = { '[t', ']t' },
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
        config = load_config('tools.dbee'),
        cmd = 'DBToggle',
        enabled = false,
    },
}
local plugins_Telescope = {
    -- Telescope
     
}

local plugins_Git = {
    -- Git
    {
        '2kabhishek/co-author.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'CoAuthor',
    },
    {
        'ruifm/gitlinker.nvim',
        config = load_config('tools.gitlinker'),
        keys = '<leader>gy',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('tools.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}
local plugins_javascript = {
    
}
local plugins_djzhang = {
    --  djzhang's plugins
}

local Plugins_lazy = {
    {
        'LazyVim/LazyVim',
        import = 'lazyvim.plugins',
        opts = {
            colorscheme = 'rose-pine-dawn',
        },
    },
    -- { import = 'lazyvim.plugins.extras.lang.typescript' },
    -- disable trouble
    -- { 'folke/trouble.nvim', enabled = false },
    { 'folke/tokyonight.nvim', enabled = false },
    { 'folke/persistence.nvim', enabled = false },
    { 'nvim-neo-tree/neo-tree.nvim', enabled = false },
}

local merged_table = {}
merged_table = merge_table(merged_table, Plugins_lazy)
merged_table = merge_table(merged_table, plugins_UI)
merged_table = merge_table(merged_table, plugins_Language)
merged_table = merge_table(merged_table, plugins_Mini)
merged_table = merge_table(merged_table, plugins_Treesitter)
merged_table = merge_table(merged_table, plugins_LSP)
merged_table = merge_table(merged_table, plugins_Completion)
merged_table = merge_table(merged_table, plugins_Tools)
merged_table = merge_table(merged_table, plugins_Telescope)
merged_table = merge_table(merged_table, plugins_Git)
merged_table = merge_table(merged_table, plugins_javascript)
merged_table = merge_table(merged_table, plugins_djzhang)

local plugins = merged_table

local ts_parsers = {
    'bash',
    'css',
    'dart',
    'elixir',
    'gitcommit',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline', -- markdown code blocks
    'python',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
}

local null_ls_sources = {
    'shellcheck', -- bash lint
}

local lsp_servers = {
    'clangd',
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp', -- check typos
    'vimls',
}

local util = require('lib.util')

if util.is_present('npm') then
    table.insert(lsp_servers, 'eslint')
    table.insert(lsp_servers, 'tsserver')
end

if util.is_present('gem') then
    table.insert(lsp_servers, 'solargraph')
    table.insert(lsp_servers, 'ruby_ls')
    table.insert(lsp_servers, 'rubocop')
end

if util.is_present('go') then
    table.insert(lsp_servers, 'gopls')
end

if util.is_present('dart') then
    table.insert(lsp_servers, 'dartls')
end

if util.is_present('java') then
    table.insert(lsp_servers, 'jdtls')
end

if util.is_present('pip') then
    table.insert(lsp_servers, 'ruff_lsp')
    table.insert(lsp_servers, 'pylsp')
end

if util.is_present('mix') then
    table.insert(lsp_servers, 'elixirls')
end

if util.is_present('cargo') then
    table.insert(lsp_servers, 'rust_analyzer')
end

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = ts_parsers,
}
