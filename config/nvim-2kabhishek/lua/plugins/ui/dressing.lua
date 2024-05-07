return {
  "stevearc/dressing.nvim",
  config = function()
    require("plugins.ui.config.dressing-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
