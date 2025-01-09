require "nvchad.mappings"

local utils = require "lib.utils"

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
for i = 1, 9, 1 do
   vim.keymap.set("n", string.format("<leader>b%s", i), function()
     vim.api.nvim_set_current_buf(vim.t.bufs[i])
   end,{ desc = string.format(" switch buffer %s",i), silent = true })
end

-- Move to line beginning and end
map({ "n", "v", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "v", "x" }, "gh", "^", { desc = "Beginning of line" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gm", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

map("n", "gt", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)

map('n', "<leader>yf", "<cmd>%y+<cr>", {desc = "Copy Whole File",silent=true})

-- Close window
vim.keymap.set("n", "<leader>x", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "Bdelete!"
    vim.cmd "silent! close"
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  else
    vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
  end
end, { desc = "General | Close window", silent = true })


-- Find Config Files
vim.keymap.set("n", "<leader>nf", function()
  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Find Config Files", silent = true })

-- Grep Config Files
vim.keymap.set("n", "<leader>ng", function()
  require("telescope.builtin").live_grep {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end, { desc = "Neovim | Grep Config Files", silent = true })

-- Toggle Cheatsheet
vim.keymap.set("n", "<leader>nc", "<cmd>NvCheatsheet<cr>", { desc = "Neovim | Toggle Cheatsheet", silent = true })

-- Inspect
vim.keymap.set("n", "<leader>ni", function()
  if vim.version().minor >= 9 then
    vim.cmd "Inspect"
  else
    vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
  end
end, { desc = "Neovim | Inspect", silent = true }) -- only available on neovim >= 0.9

-- Messages
vim.keymap.set("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
vim.keymap.set("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
vim.keymap.set("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Run Code
vim.keymap.set("n", "<leader>nr", function()
  utils.run_code()
end, { desc = "Neovim | Run Code", silent = true })

