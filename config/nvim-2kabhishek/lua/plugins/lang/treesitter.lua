local treesitter = require('nvim-treesitter.configs')
local textobjects = require('plugins.lang.textobjects')

local auto_install = require('lib.util').get_user_config('auto_install', true)
local installed_parsers = {}
if auto_install then
    installed_parsers = require('plugins.list').ts_parsers
end

treesitter.setup({
    ensure_installed = installed_parsers,
    sync_install = false,
    ignore_install = {},
    auto_install = true,

    -- textobjects = textobjects,
    autopairs = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },
    matchup = { enable = true },
    indent = { enable = true },

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn', -- set to `false` to disable one of the mappings
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },

    -- textsubjects = {
    --     enable = true,
    --     prev_selection = ',',
    --     keymaps = {
    --         ['.'] = { 'textsubjects-smart', desc = 'Select the current text subject' },
    --         ['a;'] = {
    --             'textsubjects-container-outer',
    --             desc = 'Select outer container (class, function, etc.)',
    --         },
    --         ['i;'] = {
    --             'textsubjects-container-inner',
    --             desc = 'Select inside containers (classes, functions, etc.)',
    --         },
    --     },
    -- },

    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>rr',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = '<leader>rd',
                list_definitions = '<leader>rl',
                list_definitions_toc = '<leader>rh',
                goto_next_usage = '<leader>rj',
                goto_previous_usage = '<leader>rk',
            },
        },
    },

    -- see https://www.youtube.com/watch?v=CEMPq_r8UYQ
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
                ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
                ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
                ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

                -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
                ['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
                ['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
                ['l:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
                ['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },

                ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
                ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

                ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
                ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

                ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
                ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

                ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
                ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

                ['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
                ['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

                ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
                ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
                ['<leader>n:'] = '@property.outer', -- swap object property with next
                ['<leader>nm'] = '@function.outer', -- swap function with next
            },
            swap_previous = {
                ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
                ['<leader>p:'] = '@property.outer', -- swap object property with prev
                ['<leader>pm'] = '@function.outer', -- swap function with previous
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']f'] = { query = '@call.outer', desc = 'Next function call start' },
                [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
                [']c'] = { query = '@class.outer', desc = 'Next class start' },
                [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
                [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
                [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
            },
            goto_next_end = {
                [']F'] = { query = '@call.outer', desc = 'Next function call end' },
                [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
                [']C'] = { query = '@class.outer', desc = 'Next class end' },
                [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
                [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
            },
            goto_previous_start = {
                ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
                ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
                ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
                ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
                ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
            },
            goto_previous_end = {
                ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
                ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
                ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
                ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
                ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
            },
        },
    },
})
