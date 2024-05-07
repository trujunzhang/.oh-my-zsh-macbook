return {
  "RRethy/vim-illuminate",
  config = function()
    require("plugins.ui.config.vim-illuminate-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
