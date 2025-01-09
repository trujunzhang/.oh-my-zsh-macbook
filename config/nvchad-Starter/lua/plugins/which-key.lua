---@type NvPluginSpec
-- NOTE: Keymaps Popup/Guide
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
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
    config = function(_, opts)
        require("which-key").setup(opts)
        require("which-key").add {
            {
                { "<leader>b", group = "Buffer", icon = "" },
                -- Split
                { "<leader>s", group = " Split", nowait = true, remap = false },
                { "<leader>s-", "<C-w>s", desc = "Split Below", nowait = true, remap = false },
                { "<leader>s\\", "<C-w>v", desc = "Split Right", nowait = true, remap = false },
                { "<leader>sc", "<cmd>tabclose<cr>", desc = "Close Tab", nowait = true, remap = false },
                { "<leader>sd", "<C-w>c", desc = "Close Window", nowait = true, remap = false },
                { "<leader>sf", "<cmd>tabfirst<cr>", desc = "First Tab", nowait = true, remap = false },
                { "<leader>sh", "<C-w>h", desc = "Move Left", nowait = true, remap = false },
                { "<leader>sj", "<C-w>j", desc = "Move Down", nowait = true, remap = false },
                { "<leader>sk", "<C-w>k", desc = "Move Up", nowait = true, remap = false },
                { "<leader>sl", "<C-w>l", desc = "Move Right", nowait = true, remap = false },
                { "<leader>so", "<cmd>tabnext<cr>", desc = "Next Tab", nowait = true, remap = false },
                { "<leader>sp", "<C-w>p", desc = "Previous Window", nowait = true, remap = false },
                { "<leader>sq", "<cmd>bw<cr>", desc = "Close Current Buf", nowait = true, remap = false },
                { "<leader>ss", "<cmd>split<cr>", desc = "Horizontal Split File", nowait = true, remap = false },
                { "<leader>st", "<cmd>tabnew<cr>", desc = "New Tab", nowait = true, remap = false },
                { "<leader>sv", "<cmd>vsplit<cr>", desc = "Vertical Split File", nowait = true, remap = false },
                -- Yank
                { "<leader>y", group = " Yank", nowait = true, remap = false },
                { "<leader>ya", "<cmd>CApath<cr>", desc = "Copy Absolute Path", nowait = true, remap = false },
                { "<leader>yf", "<cmd>%y+<cr>", desc = "Copy Whole File", nowait = true, remap = false },
                {
                    "<leader>yg",
                    '<cmd>lua require"gitlinker".get_buf_range_url()<cr>',
                    desc = "Copy Git URL",
                    nowait = true,
                    remap = false,
                },
                { "<leader>yp", "<cmd>CRpath<cr>", desc = "Copy Relative Path", nowait = true, remap = false },


                -- { "<leader>T", group = "Tests", icon = "󰙨" },
                -- { "<leader>d", group = "Debugging", icon = "" },
                -- { "<leader>f", group = "Find", icon = "" },
                -- { "<leader>g", group = "Git", icon = "󰊢" },
                -- { "<leader>h", group = "Harpoon", icon = "" },
                -- { "<leader>l", group = "LSP", icon = "" },
                { "<leader>n", group = "Neovim", icon = "" },
                -- { "<leader>o", group = "Options", icon = "" },
                -- { "<leader>p", group = "Plugins", icon = "" },
                -- { "<leader>r", group = "Runner", icon = "" },
                -- { "<leader>t", group = "Terminal", icon = "" },
                -- { "<leader>v", group = "Venv", icon = "" },
            },
        }
    end,
}
