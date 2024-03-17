-- Additional Plugins
lvim.plugins = {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("user.theme").rose_pine()
      lvim.colorscheme = "rose-pine-dawn"
    end,
    cond = function()
      local _time = os.date "*t"
      return (_time.hour >= 1 and _time.hour < 9) 
    end,
  },
  "HiPhish/nvim-ts-rainbow2",
  "andymass/vim-matchup",
  "lunarvim/synthwave84.nvim",
  { url = "git@github.com:ChristianChiarulli/bookmark.nvim.git" },
  { url = "git@github.com:LunarVim/primer.nvim.git" },
  "stevearc/dressing.nvim",
  "AckslD/swenv.nvim",
  -- "mfussenegger/nvim-jdtls",
  -- "opalmay/vim-smoothie",
  -- {
  --   "j-hui/fidget.nvim",
  --   branch = "legacy",
  -- },
  -- "windwp/nvim-ts-autotag",
  -- "kylechui/nvim-surround",
  -- "christianchiarulli/harpoon",
  -- "moll/vim-bbye",
  -- "folke/todo-comments.nvim",
  -- "windwp/nvim-spectre",
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   branch = "anticonceal",
  -- },
  -- "kevinhwang91/nvim-bqf",
  -- "nacro90/numb.nvim",
  -- "jose-elias-alvarez/typescript.nvim",
  -- "mxsdev/nvim-dap-vscode-js",
  -- "petertriho/nvim-scrollbar",
  -- "MunifTanjim/nui.nvim",
  -- {
  --   "jinh0/eyeliner.nvim",
  --   config = function()
  --     require("eyeliner").setup {
  --       highlight_on_key = true,
  --     }
  --   end,
  -- },
  -- { "christianchiarulli/telescope-tabs", branch = "chris" },
  -- "monaqa/dial.nvim",
  -- "MunifTanjim/nui.nvim",
  -- "Bryley/neoai.nvim",
  -- "mfussenegger/nvim-dap-python",
  -- "nvim-neotest/neotest",
  -- "nvim-neotest/neotest-python",
  -- {
  --   "hrsh7th/cmp-emoji",
  --   event = "BufRead",
  -- },
  -- "ThePrimeagen/vim-be-good",
}
