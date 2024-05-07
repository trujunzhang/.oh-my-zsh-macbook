return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    -- require('user.theme').rose_pine()
    vim.cmd("colorscheme rose-pine-dawn")
  end,
}
