return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("plugins.javascript.config.lspsaga-config")
  end,
  event = "LspAttach",
}
