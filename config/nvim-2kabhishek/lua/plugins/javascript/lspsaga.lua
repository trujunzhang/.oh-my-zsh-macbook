return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("plugins.javascript.config.lspsaga-config")
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  event = "LspAttach",
}
