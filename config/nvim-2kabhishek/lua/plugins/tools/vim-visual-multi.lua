return {
  "mg979/vim-visual-multi",
  config = function()
    require("plugins.tools.config.vim-visual-multi-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
