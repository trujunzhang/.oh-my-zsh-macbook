return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-symbols.nvim",
    "molecule-man/telescope-menufacture",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("plugins.telescope.config.telescope-config")
  end,
  cmd = "Telescope",
}
