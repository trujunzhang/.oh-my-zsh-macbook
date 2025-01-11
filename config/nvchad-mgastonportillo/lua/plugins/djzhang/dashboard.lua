return {
    "nvimdev/dashboard-nvim",
    config = function()
        require "gale.dashboard"
    end,
    -- Only load when no arguments
    event = function()
        if vim.fn.argc() == 0 then
            return "VimEnter"
        end
    end,
    cmd = "Dashboard",
}
