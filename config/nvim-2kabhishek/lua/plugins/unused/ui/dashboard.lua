return {
  "nvimdev/dashboard-nvim",
  config = function()
    require("plugins.ui.config.dashboard-config")
  end,
  -- Only load when no arguments
  event = function()
    if vim.fn.argc() == 0 then
      return "VimEnter"
    end
  end,
  cmd = "Dashboard",
}
