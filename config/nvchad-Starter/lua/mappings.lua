require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
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

-- Move to line beginning and end
map({ "n", "v", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "v", "x" }, "gh", "^", { desc = "Beginning of line" })
