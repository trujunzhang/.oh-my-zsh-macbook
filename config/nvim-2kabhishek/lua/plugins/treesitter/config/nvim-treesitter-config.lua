local treesitter = require("nvim-treesitter.configs")
local textobjects = require("plugins.treesitter.config.textobjects")

local ts_parsers = {
  "bash",
  "css",
  "dart",
  "elixir",
  "gitcommit",
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline", -- markdown code blocks
  "python",
  "ruby",
  "rust",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local auto_install = require("lib.util").get_user_config("auto_install", true)
local installed_parsers = {}
if auto_install then
  installed_parsers = ts_parsers
end

treesitter.setup({
  ensure_installed = installed_parsers,
  sync_install = false,
  ignore_install = {},
  auto_install = true,

  textobjects = textobjects,
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
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
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
        smart_rename = "<leader>rr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<leader>rd",
        list_definitions = "<leader>rl",
        list_definitions_toc = "<leader>rh",
        goto_next_usage = "<leader>rj",
        goto_previous_usage = "<leader>rk",
      },
    },
  },
})