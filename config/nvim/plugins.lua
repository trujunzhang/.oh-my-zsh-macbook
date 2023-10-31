local overrides = require "custom.configs.overrides"
-- local cmp_opt = require "custom.configs.cmp"

---@type NvPluginSpec[]
local plugins = {
  ----------------------------------------- djzhang's plugins ------------------------------------------
  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("custom.configs.project").setup()
    end,
    enabled = true,
    event = "VimEnter",
    cmd = "Telescope projects",
  },
  ----------------------------------------- override plugins ------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", ft = "lua", opts = { experimental = { pathStrict = true } } },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require("plugins.configs.others").gitsigns
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("scrollbar.handlers.gitsigns").setup()
      require("gitsigns").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = overrides.devicons,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    dependencies = {
      "debugloop/telescope-undo.nvim",
      -- "gnfisher/nvim-telescope-ctags-plus",
      "tom-anders/telescope-vim-bookmarks.nvim",
      "benfowler/telescope-luasnip.nvim",
      "Marskey/telescope-sg",
      -- {
      --   "ThePrimeagen/harpoon",
      --   cmd = "Harpoon",
      -- },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "chrisgrieser/nvim-various-textobjs",
      "filNaj/tree-setter",
      "RRethy/nvim-treesitter-textsubjects",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("Comment").setup {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
          }
        end,
      },
    },
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "antosha417/nvim-lsp-file-operations" },
    opts = overrides.nvimtree,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.colorizer,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require("custom.configs.cmp").cmp
    end,
    -- opts = cmp_opt.cmp,
    dependencies = {
      -- "delphinus/cmp-ctags",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      -- "hrsh7th/cmp-copilot",
      "ray-x/cmp-treesitter",
      {
          'Exafunction/codeium.vim',
          config = function ()
            -- Change '<C-g>' here to any keycode you like.
            -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<Right>', function () return vim.fn['codeium#Accept']() end, { expr = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
          end
      },
     -- {
     --   'codota/tabnine-nvim',
     --   build = "./dl_binaries.sh",
     --   config = function()
     --     require('tabnine').setup({
     --       disable_auto_comment=true,
     --       accept_keymap="<Right>",
     --       dismiss_keymap = "<C-]>",
     --       debounce_ms = 800,
     --       suggestion_color = {gui = "#808080", cterm = 244},
     --       exclude_filetypes = {"TelescopePrompt"},
     --       log_file_path = nil, -- absolute path to Tabnine log file
     --     })
     --     end,
     -- },
      {
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
          require "custom.configs.luasnip"
        end,
      },
    },
    config = function(_, opts)
      require("cmp").setup.cmdline({ "/", "?" }, {
        mapping = require("cmp").mapping.preset.cmdline(),
        require("cmp").mapping.confirm { select = true },
        sources = {
          { name = "buffer" },
        },
      })

      require("cmp").setup.cmdline(":", {
        mapping = require("cmp").mapping.preset.cmdline(),
        sources = require("cmp").config.sources({
          { name = "cmdline" },
        }, {
          { name = "path" },
        }),
      })

      require("cmp").setup(opts)
    end,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup { mappings = {
        "<C-u>",
        "<C-d>",
      } }
    end,
  },
  -- {
  --   "razak17/tailwind-fold.nvim",
  --   opts = {
  --     min_chars = 50,
  --   },
  --   ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
  -- },
  ----------------------------------------- enhance plugins ------------------------------------------
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require "custom.configs.autosave"
    end,
  },
  {
    "andrewferrier/debugprint.nvim",
    keys = { "<leader><leader>p" },
    config = function()
      require("debugprint").setup {
        create_keymaps = false,
        create_commands = false,
      }
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "cbochs/portal.nvim",
    keys = { "<leader>pj", "<leader>ph" },
  },
-- TODO: djzhang
  -- {
  --   "gbprod/cutlass.nvim",
  --   event = "BufReadPost",
    -- opts = {
      -- cut_key = "x",
      -- override_del = true,
      -- exclude = {},
      -- registers = {
      --   select = "_",
      --   delete = "_",
      --   change = "_",
      -- },
    -- },
  -- },
  {
    "smoka7/multicursors.nvim",
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    config = true,
    dependencies = {
      "smoka7/hydra.nvim",
    },
  },
  {
    "rmagatti/auto-session",
    event = "VimEnter",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = true,
        },
      }
    end,
  },
  -- {
  --   "axkirillov/hbac.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("hbac").setup {
  --       autoclose = true,
  --       threshold = 5,
  --     }
  --   end,
  -- },
  {
    "chrisgrieser/nvim-early-retirement",
    opts = {
      retirementAgeMins = 5,
      notificationOnAutoClose = false,
    },
    event = "BufReadPost",
  },
  {
    "code-biscuits/nvim-biscuits",
    event = "BufReadPost",
    config = function()
      require "custom.configs.biscuits"
    end,
  },
  {
    "rainbowhxch/accelerated-jk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.accelerated"
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup()
    end,
  },
  {
    "MattesGroeger/vim-bookmarks",
    cmd = "BookmarkToggle",
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.illuminate"
    end,
  },
  {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
    branch = "v2",
    dependencies = "mfussenegger/nvim-treehopper",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = "BufReadPost",
    config = function()
      require("nvim-toggler").setup {
        remove_default_keybinds = true,
      }
    end,
  },
  {
    "barrett-ruth/live-server.nvim",
    cmd = "LiveServerStart",
    build = "yarn global add live-server",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "declancm/vim2vscode",
    cmd = "Code",
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSCaptureUnderCursor",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.context"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require "custom.configs.virtual-text"
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require "custom.configs.dapui"
        end,
      },
      {
        "LiadOz/nvim-dap-repl-highlights",
        config = true,
        build = function()
          if not require("nvim-treesitter.parsers").has_parser "dap_repl" then
            vim.cmd ":TSInstall dap_repl"
          end
        end,
      },
    },
  },
  {
    "mawkler/modicator.nvim",
    event = "BufWinEnter",
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    config = function()
      require("modicator").setup()
    end,
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufReadPost",
    config = function()
      require("virt-column").setup {
        char = "┃",
        -- virtcolumn = "120",
      }
    end,
  },
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    config = function()
      require("rest-nvim").setup {
        result_split_horizontal = true,
      }
    end,
  },
  {
    "yorickpeterse/nvim-dd",
    event = "LspAttach",
    opts = {
      timeout = 1000,
    },
  },
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      alpha = 0.75,
      blend_color = "#000000",
      update_in_insert = {
        enable = true,
        delay = 100,
      },
      hide = {
        virtual_text = true,
        signs = true,
        underline = true,
      },
    },
  },
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    config = function()
      require("rayso").setup {
        open_cmd = "chrome",
      }
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<leader>to" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = true,
      }
    end,
  },
  ----------------------------------------- ui plugins ------------------------------------------
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.93,
          width = 150,
          height = 1,
        },
        plugins = {
          options = {
            showcmd = true,
          },
          twilight = { enabled = false },
          gitsigns = { enabled = true },
        },
      }
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      require "custom.configs.scrollbar"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.todo"
    end,
  },
  {
    "chikko80/error-lens.nvim",
    ft = "go",
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.trouble"
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  { "rainbowhxch/beacon.nvim", event = "BufReadPost" },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.animate").setup {
        scroll = {
          enable = false,
        },
      }
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    keys = { "<leader>mm" },
    config = function()
      require("codewindow").setup {
        show_cursor = false,
        window_border = "rounded",
      }
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.hlchunk"
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    init = function()
      vim.g.code_action_menu_show_details = true
      vim.g.code_action_menu_show_diff = true
      vim.g.code_action_menu_show_action_kind = true
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "BrunoKrugel/lazydocker.nvim",
    cmd = "LazyDocker",
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "AckslD/muren.nvim",
    cmd = "MurenToggle",
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },
  {
    "FabijanZulj/blame.nvim",
    cmd = "ToggleBlame",
  },
  {
    "akinsho/git-conflict.nvim",
    ft = "gitcommit",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        event = "BufReadPost",
        config = function()
          local builtin = require "statuscol.builtin"
          require("statuscol").setup {
            relculright = true,
            bt_ignore = { "nofile", "prompt", "terminal", "packer" },
            ft_ignore = { "NvimTree", "dashboard", "nvcheatsheet" },
            segments = {
              -- Segment 1: Add padding
              {
                text = { " " },
              },
              -- Segment 2: Fold Column
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              -- Segment 3: Add padding
              {
                text = { " " },
              },
              -- Segment 4: Show signs with one character width
              {
                sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
                auto = true,
                click = "v:lua.ScSa",
              },
              -- Segment 5: Show line number
              {
                text = { " ", " ", builtin.lnumfunc, " " },
                click = "v:lua.ScLa",
                condition = { true, builtin.not_empty },
              },
              -- Segment 6: Add padding
              {
                text = { " " },
                hl = "Normal",
                condition = { true, builtin.not_empty },
              },
            },
          }
        end,
      },
    },
    config = function()
      require "custom.configs.ufo"
    end,
  },
  --  {
  -- 	"Snyssfx/goerr-nvim",
  -- 	ft = "go",
  -- 	config = function()
  -- 		vim.g.goerr_indent_error = 1
  -- 		vim.g.goerr_nvim_indent_level = 4
  -- 		vim.g.goerr_nvim_max_width = 1000
  -- 		vim.g.goerr_nvim_sign = " "
  -- 	end
  -- },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.inlayhints"
    end,
  },
  {
    "adelarsq/image_preview.nvim",
    keys = { "<leader>p" },
    config = function()
      require("image_preview").setup()
    end,
  },
  {
    "VonHeikemen/searchbox.nvim",
    cmd = { "SearchBoxMatchAll", "SearchBoxReplace", "SearchBoxIncSearch" },
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
          },
        },
      }
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("scrollbar.handlers.search").setup {
        {
          nearest_float_when = false,
          override_lens = function(render, posList, nearest, idx, relIdx)
            local sfw = vim.v.searchforward == 1
            local indicator, text, chunks
            local absRelIdx = math.abs(relIdx)
            if absRelIdx > 1 then
              indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and icons.misc.up or icons.misc.down)
            elseif absRelIdx == 1 then
              indicator = sfw ~= (relIdx == 1) and icons.misc.up or icons.misc.down
            else
              indicator = icons.misc.dot
            end
            local lnum, col = unpack(posList[idx])
            if nearest then
              local cnt = #posList
              if indicator ~= "" then
                text = ("[%s %d/%d]"):format(indicator, idx, cnt)
              else
                text = ("[%d/%d]"):format(idx, cnt)
              end
              chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
            else
              text = ("[%s %d]"):format(indicator, idx)
              chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
            end
            render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
          end,
        },
      }
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    event = "BufReadPost",
    config = function()
      require("highlight-undo").setup {}
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    keys = { "<leader>a" },
    config = function()
      require "custom.configs.pretty-fold"
    end,
  },
  {
    "jghauser/fold-cycle.nvim",
    keys = { "<leader>a" },
    config = function()
      require("fold-cycle").setup()
    end,
  },
  {
    "anuvyklack/fold-preview.nvim",
    keys = { "<leader>p" },
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
    },
    opts = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  {
    "Fildo7525/pretty_hover",
    keys = { "<leader>k" },
    config = true,
  },
  -- {
  --   "VidocqH/lsp-lens.nvim",
  --   event = "BufReadPost",
  --   config = true,
  -- },
  {
    "ziontee113/icon-picker.nvim",
    cmd = "IconPickerNormal",
    config = function()
      require("icon-picker").setup {
        disable_legacy_commands = true,
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.lspsaga"
    end,
  },
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    config = function()
      require "custom.configs.glance"
    end,
  },
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        commit = "3047ede61cc1308069ad1184c0d447ebee92d749",
        opts = {
          task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1,
            bindings = {
              ["q"] = function()
                vim.cmd "OverseerClose"
              end,
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("compiler").setup(opts)
    end,
  },
  ----------------------------------------- language plugins ------------------------------------------
  -- {
  --   "ray-x/go.nvim",
  --   ft = { "go", "gomod", "gosum", "gowork" },
  --   dependencies = {
  --     {
  --       "ray-x/guihua.lua",
  --       build = "cd lua/fzy && make",
  --     },
  --     {
  --       "crusj/hierarchy-tree-go.nvim",
  --       config = function()
  --         require("hierarchy-tree-go").setup {
  --           icon = {
  --             fold = "",
  --             unfold = "",
  --             func = "",
  --             last = "☉",
  --           },
  --           hl = {
  --             current_module = "guifg=Green", -- highlight cwd module line
  --             others_module = "guifg=White", -- highlight others module line
  --             cursorline = "guibg=Gray guifg=White", -- hl  window cursorline
  --           },
  --         }
  --       end,
  --     },
  --   },
  --   config = function()
  --     require "custom.configs.go"
  --   end,
  --   build = ':lua require("go.install").update_all_sync()',
  -- },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "llllvvuu/nvim-js-actions",
    keys = { "<leader>jc" },
  },
  {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = true,
  },
  {
    "nvim-neotest/neotest",
    ft = { "go" },
    dependencies = {
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require "custom.configs.neotest"
    end,
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = { "markdown", "vimwiki" },
    config = function()
      require("peek").setup {
        app = "webview",
        theme = "dark",
        filetype = { "markdown", "vimwiki" },
      }
    end,
  },
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup()
    end,
  },
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    config = function()
      require("rayso").setup {
        open_cmd = "chrome",
      }
    end,
  },
  {
    "chrisgrieser/nvim-recorder",
    keys = { "q", "Q" },
    opts = {
      lessNotifications = true,
      clear = true,
    },
  },
  {
    "javiorfo/nvim-soil",
    ft = "plantuml",
    dependencies = { "javiorfo/nvim-nyctophilia" },
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.refactoring"
    end,
  },
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    opts = {
      keepFoldsAcrossSessions = true,
      pauseFoldsOnSearch = true,
      setupFoldKeymaps = true,
    },
  },
  {
    "Zeioth/markmap.nvim",
    build = "yarn global add markmap-cli",
    cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    opts = {
      html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
      hide_toolbar = false, -- (default)
      grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    },
    config = function(_, opts)
      require("markmap").setup(opts)
    end,
  },
  {
    "malbertzard/inline-fold.nvim",
    opts = {
      defaultPlaceholder = "…",
      queries = {
        html = {
          { pattern = 'class="([^"]*)"', placeholder = "@" }, -- classes in html
          { pattern = 'href="(.-)"' }, -- hrefs in html
          { pattern = 'src="(.-)"' }, -- HTML img src attribute
        },
        go = {
          { pattern = "^%s*if err != nil {", placeholder = "if err != nil .." },
        },
      },
    },
  },
  ----------------------------------------- completions plugins ------------------------------------------
  -- {
  --   "ludovicchabant/vim-gutentags",
  --   event = "BufReadPost",
  -- },
  -- -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.copilot"
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "InsertEnter",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       config = function()
  --         require("copilot_cmp").setup()
  --       end,
  --     },
  --     {
  --       "jonahgoldwastaken/copilot-status.nvim",
  --       ops = {
  --         icons = {
  --           idle = " ",
  --           error = " ",
  --           offline = " ",
  --           warning = "𥉉 ",
  --           loading = " ",
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     require("copilot").setup {
  --       suggestion = {
  --         enabled = false,
  --         auto_trigger = false,
  --         keymap = {
  --           -- accept = "<Tab>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       panel = {
  --         enabled = false,
  --       },
  --       filetypes = {
  --         gitcommit = false,
  --         TelescopePrompt = false,
  --       },
  --       server_opts_overrides = {
  --         trace = "verbose",
  --         settings = {
  --           advanced = {
  --             listCount = 3,
  --             inlineSuggestCount = 3,
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}

return plugins
