return {
  "nvimdev/dashboard-nvim",
  config = function()
    require "configs.dashboard-config"
  end,
  -- Only load when no arguments
  event = function()
    if vim.fn.argc() == 0 then
      return "VimEnter"
    end
  end,
  cmd = "Dashboard",
}
