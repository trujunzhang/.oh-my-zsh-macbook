return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip/loaders/from_vscode").load({ paths = { "~/.config/snippets" } })
        end,
      },
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      {
        "Exafunction/codeium.vim",
        -- Run :Codeium Auth to set up the plugin and start using Codeium.
        config = function()
          -- Change '<C-g>' here to any keycode you like.
          -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
          vim.keymap.set("i", "<Right>", function()
            return vim.fn["codeium#Accept"]()
          end, { expr = true })
          -- vim.keymap.set('i', '<Tab>', function()
          --     return vim.fn['codeium#Accept']()
          -- end, { expr = true })
          vim.keymap.set("i", "<c-;>", function()
            return vim.fn["codeium#CycleCompletions"](1)
          end, { expr = true })
          vim.keymap.set("i", "<c-,>", function()
            return vim.fn["codeium#CycleCompletions"](-1)
          end, { expr = true })
          vim.keymap.set("i", "<c-x>", function()
            return vim.fn["codeium#Clear"]()
          end, { expr = true })
        end,
      },
    },
    config = function()
      require("plugins.completion.config.nvim-cmp-config")
    end,
    event = "InsertEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
    end,
  },
}
