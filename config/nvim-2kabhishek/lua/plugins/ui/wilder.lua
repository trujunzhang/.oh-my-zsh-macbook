return {
  "gelguy/wilder.nvim",
  build = function()
    vim.cmd([[silent UpdateRemotePlugins]])
  end,
  config = function()
    require("plugins.ui.config.wilder-config")
  end,
  keys = { ":", "/", "?" },
}
