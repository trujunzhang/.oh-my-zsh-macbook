--- @type NvPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    git = { enable = true },

    view = {
      -- side = "right",
      width = 30,
    },
    renderer = {
      highlight_git = true,
      icons = { show = { git = true } },
    },
  },
  dependencies = {
    "antosha417/nvim-lsp-file-operations",
    'nvim-tree/nvim-web-devicons',
  },
}
