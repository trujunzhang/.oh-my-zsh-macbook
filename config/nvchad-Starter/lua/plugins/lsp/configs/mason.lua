---@type NvPluginSpec
-- NOTE: Package installer
return {
    "williamboman/mason.nvim",
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    init = function()
        vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason | Installer", silent = true })
    end,
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUpdate",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
    },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { 
                    "bashls",
                    "yamlls",
                    "jsonls",
                    "eslint",
                    "lua_ls",
                    "rust_analyzer",
                    'pyright'
            },
        },
        config = function()
            local mason = require "mason"
            -- local path = require "mason-core.path"
            local mason_lspconfig = require "mason-lspconfig"

            mason.setup {
                ui = {
                    border = vim.g.border_enabled and "rounded" or "none",
                    -- Whether to automatically check for new versions when opening the :Mason window.
                    check_outdated_packages_on_open = false,
                    icons = {
                        package_pending = " ",
                        package_installed = " ",
                        package_uninstalled = " ",
                    },
                },
                -- install_root_dir = path.concat { vim.fn.stdpath "config", "/lua/custom/mason" },
            }

          local servers = mason_lspconfig.get_installed_servers()
          local excluded = { "ts_ls", "jdtls" }

          for _, server in ipairs(servers) do
            if not vim.tbl_contains(excluded, server) then
              -- Load LSP Settings(If Exists)
              local ok_settings, settings = pcall(require, "plugins.lsp.settings." .. server)
              -- if ok_settings then
              --   vim.lsp.config(string.lower(server), settings)
              -- end

              -- Enable LSP
              -- vim.lsp.enable(server)
            end
          end

        end,
    },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "gopls"
      }
        -- registries = {
        --     "github:nvim-java/mason-registry",
        --     "github:mason-org/mason-registry",
        -- },
    },
}

