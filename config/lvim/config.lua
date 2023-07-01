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

-- reload "user.chatgpt"
-- reload "user.neoai"

-- snippet
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/vscode-es7-javascript-react-snippets" } }