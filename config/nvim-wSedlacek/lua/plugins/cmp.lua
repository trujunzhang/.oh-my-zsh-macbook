--- @type NvPluginSpec
return {
  "hrsh7th/nvim-cmp",
  init = function()
    vim.opt.pumheight = 8
  end,
  opts = {
    sources = {
      { name = "nvim_lsp" },
      { name = "git" },
      { name = "npm", keyword_length = 4 },
      { name = "luasnip" },
      { name = "luasnip_choice" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "orgmode" },
    },
  },

  dependencies = {
    {
      'Exafunction/codeium.vim',
      -- Run :Codeium Auth to set up the plugin and start using Codeium.
      config = function()
        -- Change '<C-g>' here to any keycode you like.
        -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<Right>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        -- vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
    },
  }


}
