return {
  "folke/which-key.nvim",
  config = function()
    require("plugins.tools.config.which-key-config")
  end,
  event = "VeryLazy",
}
