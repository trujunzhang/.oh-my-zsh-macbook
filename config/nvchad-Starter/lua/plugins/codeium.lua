---@type NvPluginSpec
local spec = {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function(_, opts)
            table.insert(opts.sources, { name = "codeium" })
            require("cmp").setup(opts)
        end,
        dependencies = {
            {
                "Exafunction/codeium.vim",
                -- enabled = false,
                enabled = true,
                -- Run :Codeium Auth to set up the plugin and start using Codeium.
                config = function()
                    -- Change '<C-g>' here to any keycode you like.
                    -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
                    vim.keymap.set("i", "<Right>", function()
                        return vim.fn["codeium#Accept"]()
                    end, { expr = true })
                    -- vim.keymap.set('i', '<Tab>', function()
                    --     return vim.fn['codeium#Accept']()
                    -- end, { expr = true })
                    vim.keymap.set("i", "<c-;>", function()
                        return vim.fn["codeium#CycleCompletions"](1)
                    end, { expr = true })
                    vim.keymap.set("i", "<c-,>", function()
                        return vim.fn["codeium#CycleCompletions"](-1)
                    end, { expr = true })
                    vim.keymap.set("i", "<c-x>", function()
                        return vim.fn["codeium#Clear"]()
                    end, { expr = true })
                end,
            },
        },
    },
}

return spec
