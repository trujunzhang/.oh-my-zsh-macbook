---@type NvPluginSpec
return {
    "olimorris/persisted.nvim",
    event = "VimEnter",
    opts = {
      save_dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
      silent = true,                                                   -- silent nvim message when sourcing session file
      use_git_branch = true,                                           -- create session files based on the branch of the git enabled repository
      autosave = true,                                                 -- automatically save session files when exiting Neovim
      should_autosave = nil,                                           -- function to determine if a session should be autosaved
      autoload = true,                                                 -- automatically load the session for the cwd on Neovim startup
      on_autoload_no_session = nil,
      follow_cwd = true,
      ignored_dirs = {
        { "~/.config", exact = true },
      },
      telescope = {                         -- options for the telescope extension
        reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      },
      config = function(_, opts)
        vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
        require("persisted").setup(opts)
        require("telescope").load_extension "persisted"
      end,
    },
  }
  