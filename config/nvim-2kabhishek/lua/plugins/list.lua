local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

local slow_format_filetypes = { 'typescript', 'javascript' }

local plugins = {
    -- UI
    {
        'navarasu/onedark.nvim',
        config = load_config('ui.onedark'),
        lazy = false,
        priority = 1000,
    },
    {
        'akinsho/bufferline.nvim',
        config = load_config('ui.bufferline'),
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'BufAdd',
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = load_config('ui.indentline'),
        main = 'ibl',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = load_config('ui.rainbow'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'RRethy/vim-illuminate',
        config = load_config('ui.illuminate'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'rcarriga/nvim-notify',
        config = load_config('ui.notify'),
        event = 'VeryLazy',
        cmd = 'Notifications',
    },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'nvimdev/dashboard-nvim',
        config = load_config('ui.dashboard'),
        -- Only load when no arguments
        event = function()
            if vim.fn.argc() == 0 then
                return 'VimEnter'
            end
        end,
        cmd = 'Dashboard',
    },
    {
        'gelguy/wilder.nvim',
        build = function()
            vim.cmd([[silent UpdateRemotePlugins]])
        end,
        config = load_config('ui.wilder'),
        keys = { ':', '/', '?' },
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
            config = load_config('ui.twilight'),
        },
        config = load_config('ui.zen-mode'),
        cmd = { 'ZenMode', 'Twilight' },
    },

    -- Language
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        config = load_config('lang.dap'),
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'olimorris/neotest-rspec',
            'haydenmeade/neotest-jest',
        },
        config = load_config('lang.neotest'),
        cmd = 'Neotest',
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        config = load_config('lang.sniprun'),
        cmd = 'SnipRun',
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = load_config('lang.refactoring'),
    },
    {
        'windwp/nvim-autopairs',
        config = load_config('lang.autopairs'),
        event = 'InsertEnter',
    },
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
    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
        },
        config = load_config('lang.treesitter'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'ckolkey/ts-node-action',
        dependencies = { 'nvim-treesitter' },
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = load_config('lang.lspconfig'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    -- {
    --     'dgagn/diagflow.nvim',
    --     -- event = 'LspAttach', --- This is what I use personnally and it works great
    --     opts = {},
    --     -- config = load_config('lang.diagflow'),
    -- },
    {
        'folke/neodev.nvim',
        ft = { 'lua', 'vim' },
        config = load_config('lang.neodev'),
    },
    {
        'nvimdev/lspsaga.nvim',
        config = load_config('lang.lspsaga'),
        event = 'LspAttach',
    },
    -- {
    --     'Maan2003/lsp_lines.nvim',
    --     config = load_config('lang.lsp-lines'),
    --     event = 'LspAttach',
    -- },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPre', 'BufNewFile' },
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
            {
                'Exafunction/codeium.vim',
                -- Run :Codeium Auth to set up the plugin and start using Codeium.
                config = function()
                    -- Change '<C-g>' here to any keycode you like.
                    -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
                    vim.keymap.set('i', '<Right>', function()
                        return vim.fn['codeium#Accept']()
                    end, { expr = true })
                    -- vim.keymap.set('i', '<Tab>', function()
                    --     return vim.fn['codeium#Accept']()
                    -- end, { expr = true })
                    vim.keymap.set('i', '<c-;>', function()
                        return vim.fn['codeium#CycleCompletions'](1)
                    end, { expr = true })
                    vim.keymap.set('i', '<c-,>', function()
                        return vim.fn['codeium#CycleCompletions'](-1)
                    end, { expr = true })
                    vim.keymap.set('i', '<c-x>', function()
                        return vim.fn['codeium#Clear']()
                    end, { expr = true })
                end,
            },
        },
        config = load_config('lang.cmp'),
        event = 'InsertEnter',
    },

    -- Tools
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = load_config('tools.nvim-tree'),
        cmd = 'NvimTreeToggle',
    },
    {
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'InsertEnter',
    },
    {
        'folke/flash.nvim',
        config = load_config('tools.flash'),
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
            {
                'r',
                mode = 'o',
                function()
                    require('flash').remote()
                end,
                desc = 'Remote Flash',
            },
            {
                'R',
                mode = { 'o', 'x' },
                function()
                    require('flash').treesitter_search()
                end,
                desc = 'Treesitter Search',
            },
            {
                '<c-s>',
                mode = { 'c' },
                function()
                    require('flash').toggle()
                end,
                desc = 'Toggle Flash Search',
            },
        },
    },
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
        'chrisgrieser/nvim-spider',
        config = load_config('tools.spider'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'folke/which-key.nvim',
        config = load_config('tools.which-key'),
        event = 'VeryLazy',
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
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

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'nvim-telescope/telescope-symbols.nvim',
            'molecule-man/telescope-menufacture',
            'debugloop/telescope-undo.nvim',
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = load_config('tools.harpoon'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
    },

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
    --  djzhang's plugins
    {
        'rmagatti/auto-session',
        config = function()
            vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
            require('auto-session').setup({
                log_level = 'error',
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            })
        end,
    },
    {
        'okuuva/auto-save.nvim',
        cmd = 'ASToggle', -- optional for lazy loading on command
        event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
        opts = {
            -- your config goes here
            -- or just leave it empty :)
        },
    },
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        config = function()
            require("conform").setup({
                format_on_save = {
                  -- These options will be passed to conform.format()
                  timeout_ms = 1000,
                  lsp_fallback = true,
                },
              })
        end,
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
                rust = { 'rustfmt' },
                terraform = { 'terraform_fmt' },
                javascript = { { 'prettierd', 'prettier' } },
                typescript = { { 'prettierd', 'prettier' } },
                json = { 'prettierd' },
                html = { { 'prettierd', 'prettier' } },
                scss = { { 'prettierd', 'prettier' } },
                css = { { 'prettierd', 'prettier' } },
                markdown = { 'markdownlint' },
                ocaml = { 'ocamlformat' },
                sql = { 'pg_format' },
                swift = { 'swift_format' },
                proto = { 'buf' },
                yaml = { { 'prettierd', 'prettier' } },
            },

            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end

                if slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end

                local function on_format(err)
                    if err and err:match('timeout$') then
                        slow_format_filetypes[vim.bo[bufnr].filetype] = true
                    end
                end

                return { timeout_ms = 500, lsp_fallback = true }, on_format
            end,

            format_after_save = function(bufnr)
                if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end

                return { lsp_fallback = true }
            end,
        },
    },
}

local lsp_servers = {
    'bashls',
    'elixirls',
    'eslint',
    'jsonls',
    'lua_ls',
    'rubocop', -- ruby
    'ruby_ls',
    'ruff_lsp', -- python
    'rust_analyzer',
    'solargraph', -- ruby
    'tsserver',
    'typos_lsp', -- check typos
    'vimls',
}

local null_ls_sources = {
    'shellcheck', -- bash lint
}

local ts_parsers = {
    'bash',
    'css',
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

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = ts_parsers,
}
