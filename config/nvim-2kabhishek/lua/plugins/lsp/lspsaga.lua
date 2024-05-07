return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("plugins.lsp.config.lspsaga-config")
  end,
  event = "LspAttach",
}
