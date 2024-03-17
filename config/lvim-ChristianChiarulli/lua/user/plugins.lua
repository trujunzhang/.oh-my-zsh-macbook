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
  { url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
  { url = "git@github.com:LunarVim/primer.nvim.git" },
  "stevearc/dressing.nvim",
  "AckslD/swenv.nvim",
  "roobert/tailwindcss-colorizer-cmp.nvim",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "mfussenegger/nvim-jdtls",
  "opalmay/vim-smoothie",
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
  },
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "christianchiarulli/harpoon",
  "NvChad/nvim-colorizer.lua",
  "moll/vim-bbye",
  "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "anticonceal",
  },
  "lunarvim/darkplus.nvim",
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "nacro90/numb.nvim",
  "neogitorg/neogit",
  "sindrets/diffview.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "petertriho/nvim-scrollbar",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  "MunifTanjim/nui.nvim",
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },
  "MunifTanjim/nui.nvim",
  "Bryley/neoai.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  {
    "hrsh7th/cmp-emoji",
    event = "BufRead",
  },
  "ThePrimeagen/vim-be-good",
  -- "folke/noice.nvim",
  -- "rcarriga/nvim-notify",

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
  -- "christianchiarulli/nvim-ts-rainbow",
  -- "karb94/neoscroll.nvim",
}
