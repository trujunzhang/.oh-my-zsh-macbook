--- @type NvPluginSpec
return {
  "hrsh7th/nvim-cmp",
  opts = function()
    return require("configs.cmp").cmp
  end,
  -- opts = {
  -- sources = {
  --   { name = "nvim_lsp" },
  --   { name = "git" },
  --   { name = "npm", keyword_length = 4 },
  --   { name = "luasnip" },
  --   { name = "luasnip_choice" },
  --   { name = "nvim_lua" },
  --   { name = "path" },
  -- },
  -- },
  dependencies = {
    {
      'Exafunction/codeium.vim',
      -- Run :Codeium Auth to set up the plugin and start using Codeium.
      config = function()
        -- Change '<C-g>' here to any keycode you like.
        -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        -- vim.keymap.set('i', '<Right>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
    },

    -- autopairing of (){}[] etc
    {
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
  }
}
