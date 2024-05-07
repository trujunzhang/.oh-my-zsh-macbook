return {
  "williamboman/mason.nvim",
  config = function()
    require("plugins.lsp.config.mason-config")
  end,
  cmd = "Mason",
}
