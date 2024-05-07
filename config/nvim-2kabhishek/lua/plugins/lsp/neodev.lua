return {
  "folke/neodev.nvim",
  ft = { "lua", "vim" },
  config = function()
    require("plugins.lsp.config.neodev-config")
  end,
}
