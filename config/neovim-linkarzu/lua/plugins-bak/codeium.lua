return {
    -- add ai_accept action
    {
        "Exafunction/codeium.nvim",
        build = ":Codeium Auth",
        config = function()
            vim.keymap.set("i", "<Right>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true })
        end,
    },
}
