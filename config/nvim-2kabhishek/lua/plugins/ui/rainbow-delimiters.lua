return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    require("plugins.ui.config.rainbow-delimiters-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
