local cmp_mapping = require 'cmp.config.mapping'
local cmp = require('lvim.utils.modules').require_on_index 'cmp'

local status_cmp_ok, cmp_types = pcall(require, "cmp.types.cmp")
if not status_cmp_ok then
  return
end
local SelectBehavior = cmp_types.SelectBehavior

lvim.builtin.cmp.window = {
  completion = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
    col_offset = -3,
    side_padding = 1,
    scrollbar = false,
    -- scrollbar = {
    --   position = 'inside',
    -- },
    scrolloff = 8,
  },
  documentation = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
  },
}
vim.opt.pumblend = 10

lvim.builtin.cmp.formatting.source_names = {}


lvim.builtin.cmp.sources[2].entry_filter = function(entry, ctx)
  local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
  if kind == "Snippet" and ctx.prev_context.filetype == "java" then
    return false
  end

  if kind == "Text" and not ctx.prev_context.filetype == "markdown" then
    return false
  end

  return true
end


lvim.builtin.cmp.mapping = {
  ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item { behavior = SelectBehavior.Select }, { "i" }),
  ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item { behavior = SelectBehavior.Select }, { "i" }),
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() and cmp.get_active_entry() then
      -- completion if a cmp item is selected
      cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
    elseif vim.fn.exists('b:_codeium_completions') ~= 0 then
      -- accept codeium completion if visible
      vim.fn['codeium#Accept']()
      fallback()
    elseif cmp.visible() then
      -- select first item if visible
      cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
}
