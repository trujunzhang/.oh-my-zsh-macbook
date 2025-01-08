---@type NvPluginSpec
-- NOTE: Improve Other LSP Functionalities
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  -- commit = "898030df423a527c55a6fd85e85e58e840ff6e82",
  init = function()
    vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Lspsaga | Code Action", silent = true })
    vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Lspsaga | Code Outline", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lI",
      "<cmd>Lspsaga incoming_calls<cr>",
      { desc = "Lspsaga | Incoming Calls", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lO",
      "<cmd>Lspsaga outgoing_calls<cr>",
      { desc = "Lspsaga | Outgoing Calls", silent = true }
    )
    vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Lspsaga | Rename", silent = true })
    vim.keymap.set(
      "n",
      "<leader>lj",
      "<cmd>Lspsaga diagnostic_jump_next<cr>",
      { desc = "Lspsaga | Next Diagnostic", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>lk",
      "<cmd>Lspsaga diagnostic_jump_prev<cr>",
      { desc = "Lspsaga | Prev Diagnostic", silent = true }
    )

    -- vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Lspsaga | Code Action", silent = true })
  end,
  config = function()
    local lspsaga = require("lspsaga")
    local icons = require("lib.icons")

    lspsaga.setup({
      ui = {
        theme = "round",
        border = "rounded",
        devicon = true,
        title = true,
        winblend = 1,
        expand = icons.ui.ArrowOpen,
        collapse = icons.ui.ArrowClosed,
        preview = icons.ui.List,
        code_action = icons.diagnostics.Hint,
        diagnostic = icons.ui.Bug,
        incoming = icons.ui.Incoming,
        outgoing = icons.ui.Outgoing,
        hover = icons.ui.Comment,
      },
    })
  end,
}
