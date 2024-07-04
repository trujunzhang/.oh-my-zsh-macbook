return {
  "windwp/nvim-autopairs",
  config = function()
    require("plugins.language.config.nvim-autopairs-config")
  end,
  event = "InsertEnter",
}
