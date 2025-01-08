require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- disabled nvchad default keymaps
-- vim.keymap.set("n", key, "<nop>")
map("n", "<leader>b", "<nop>", { desc = "buffer new" })
map("n", "<leader>n", "<nop>", { desc = "toggle line number" })
map("n", "<leader>x", "<nop>", { desc = "buffer close" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Quit
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Toggle Cheatsheet
vim.keymap.set("n", "<leader>nc", "<cmd>NvCheatsheet<cr>", { desc = "Neovim | Toggle Cheatsheet", silent = true })

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

vim.keymap.set("n", "<leader><Tab>", "<cmd>b#<cr>", { desc = " Tab Previous", silent = true })

-- tabufline
map("n", "<leader>be", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>bp", function() require("nvchad.tabufline").prev() end, { desc = "buffer previous" })
map("n", "<leader>bn", function() require("nvchad.tabufline").next() end, { desc = "buffer next" })
map("n", "<leader>bx", function()  require("nvchad.tabufline").close_buffer() end, { desc = "buffer close" })
map("n", "<leader>bo", function() require("nvchad.tabufline").closeAllBufs(false) end, { desc = "buffer close others" })
map("n", "<leader>bl", function() require("nvchad.tabufline").closeBufs_at_direction("left") end, { desc = "buffer close left" })
map("n", "<leader>br", function() require("nvchad.tabufline").closeBufs_at_direction("right") end, { desc = "buffer close right" })

-- Move to line beginning and end
map({ "n", "v", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "v", "x" }, "gh", "^", { desc = "Beginning of line" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gm", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

map("n", "gt", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
