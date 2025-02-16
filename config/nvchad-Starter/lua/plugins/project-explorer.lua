return {
    -- https://github.com/Rics-Dev/project-explorer.nvim
    "Rics-Dev/project-explorer.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        paths = {
            "~/Documents/Organizations/__CODING/WORKING/*"
        }, --custom path set by user
        -- custom find command set by the user. Default should always work on unix unless user has heavily modified tools and/or PATH
        -- for Windows Users: installing `fd` is recommended with the equivalent `fd` command
        -- "fd . %s -td --min-depth %d --max-depth %d"
        command_pattern = "find %s -mindepth %d -maxdepth %d -type d -not -name '.git'",
        -- newProjectPath = "~/dev/", --custom path for new projects
        newProjectPath = "~/Downloads/xxx/wh123/", --custom path for new projects
        file_explorer = function(dir)              --custom file explorer set by user
            -- vim.cmd("Neotree close")
            -- vim.cmd("Neotree " .. dir)
        end,
        -- Or for oil.nvim:
        -- file_explorer = function(dir)
        --   require("oil").open(dir)
        -- end,
    },
    config = function(_, opts)
        require("project_explorer").setup(opts)
    end,
    keys = {
        { "<leader>fp", "<cmd>ProjectExplorer<cr>", desc = "Project Explorer" },
    },
    lazy = false,
}
