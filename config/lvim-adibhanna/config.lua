-- additional plugins
reload "user.plugins"
reload "user.project"
reload "user.autosave"
reload "user.options"
reload "user.autocommands"
reload "user.lsp"
reload "user.treesitter"
reload "user.copilot"
reload "user.telescope"
reload "user.fidget"
reload "user.whichkey"
reload "user.inlay-hints"
reload "user.functions"
reload "user.dial"
reload "user.shortcut"
reload "user.dap-debug"
-- reload "user.spectre"

-- reload "user.chatgpt"
-- reload "user.neoai"

-- snippets
-- refer:
--    https://github.com/sambergo/lunarvim-snippet-examples
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/nvim-snippets/vscode-es7-javascript-react-snippets" } }
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/nvim-snippets/my-snippets" } }

-- set notimeout
-- set encoding=utf-8
vim.cmd([[
set shiftwidth=2
set autoindent
set smartindent
]])
