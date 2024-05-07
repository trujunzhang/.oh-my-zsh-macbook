return {
  "akinsho/bufferline.nvim",
  config = function()
    require("plugins.ui.config.bufferline-config")
  end,
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "BufAdd",
}
