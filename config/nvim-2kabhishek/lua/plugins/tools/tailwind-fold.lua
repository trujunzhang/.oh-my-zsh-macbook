return {
  "razak17/tailwind-fold.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    min_chars = 50,
  },
  ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  keys = {
    { "<leader>lb", "<cmd>TailwindFoldToggle<cr>", desc = "Fold/Unfold tailwind classes" },
  },
}
