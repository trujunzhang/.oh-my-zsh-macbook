require('core.options')
require('core.functions')
require('core.keymaps')
require('core.autocmd')
require('plugins.lazy')
-- Add user configs to this module
pcall(require, 'user')

local luasnip_from_vscode = require('luasnip/loaders/from_vscode')
if not luasnip_from_vscode then
    return
end
luasnip_from_vscode.load({ paths = { '~/.config/nvim-snippets/debug-snippets' } })


