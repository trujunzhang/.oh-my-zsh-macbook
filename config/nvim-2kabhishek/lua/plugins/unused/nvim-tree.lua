return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("plugins.tools.config.nvim-tree-config")
  end,
  cmd = "NvimTreeToggle",
}
