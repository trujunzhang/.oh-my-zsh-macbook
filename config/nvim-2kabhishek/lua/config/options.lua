-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
    numberwidth = 4, -- set number column width to 2 {default 4}
    pumblend = 10, -- Popup blen
    pumheight = 10, -- pop up menu height
    shiftround = true, -- Round indent
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
