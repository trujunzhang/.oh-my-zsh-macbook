return {
  "rcarriga/nvim-notify",
  config = function()
    require("plugins.ui.config.nvim-notify-config")
  end,
  event = "VeryLazy",
  cmd = "Notifications",
}
