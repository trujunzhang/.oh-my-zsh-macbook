return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("plugins.lsp.config.nvim-lspconfig-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
