return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>rs", "<cmd>lua require('spectre').open()<cr>", desc = "Replace", nowait = true, remap = false },
    {
      "<leader>rb",
      "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>",
      desc = "Spectre Replace Buffer",
      nowait = true,
      remap = false,
    },
    {
      "<leader>rw",
      "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
      desc = "Spectre Search current word",
      nowait = true,
      remap = false,
    },
  },
  config = function()
    require "configs.nvim-spectre"
  end,
  cmd = "Spectre",
}
