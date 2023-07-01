M = {}
lvim.leader = "space"

local opts = { noremap = true, silent = true }
local opt = { noremap = true, silent = true }

local keymap = vim.keymap.set
local mapbuf = vim.keymap.set
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.normal_mode["<leader><leader>"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<leader>t"] = "<cmd>TroubleToggle<CR>"
lvim.keys.normal_mode["<leader>o"] = "<cmd>SymbolsOutline<CR>"

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


mapbuf('n', 'ff', '<cmd>lua vim.lsp.buf.format({ async = false })<CR>', opt)
-- rename
mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
-- code action
mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
-- go xx
mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
-- Mac: command+b = formatting
-- mapbuf('<D-b>', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
-- diagnostic
mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
-- leader + =
mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
-- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)


return M
