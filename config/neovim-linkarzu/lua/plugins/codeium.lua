return {
    -- add ai_accept action
    {
        "Exafunction/codeium.nvim",
        config = function()
            vim.keymap.set("i", "<Right>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true })
        end,
    },
}
