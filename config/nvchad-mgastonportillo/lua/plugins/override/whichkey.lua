---@type NvPluginSpec
return {
    "folke/which-key.nvim",
    init = function()
        local map = vim.keymap.set
        map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "WhichKey show all keymaps" })
        map("n", "<leader>wk", function()
            vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
        end, { desc = "WhichKey query lookup" })
    end,
    opts = {
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "", -- symbol prepended to a group
        },
        preset = "modern",
        win = {
            border = vim.g.border_enabled and "rounded" or "none",
        },
        delay = function()
            return 0
        end,
    },
}
