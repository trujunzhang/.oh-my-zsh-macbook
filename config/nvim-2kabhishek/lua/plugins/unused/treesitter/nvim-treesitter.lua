return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "RRethy/nvim-treesitter-textsubjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("plugins.treesitter.config.nvim-treesitter-config")
  end,
  event = { "BufReadPre", "BufNewFile" },
}
