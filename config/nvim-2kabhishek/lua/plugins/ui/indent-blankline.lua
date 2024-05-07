return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("plugins.ui.config.indent-blankline-config")
  end,
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
}
