require('core.options')
require('core.functions')
require('core.keymaps')
require('core.autocmd')
require('plugins.lazy')
-- Add user configs to this module
pcall(require, 'user')

require('luasnip/loaders/from_vscode').load({ paths = { '~/.config/nvim-snippets/debug-snippets' } })
