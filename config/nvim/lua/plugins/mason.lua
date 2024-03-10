---@type NvPluginSpec
return {
  "williamboman/mason.nvim",
  opts = {},
  config = function(_, opts)
    -- https://www.lazyvim.org/extras/formatting/prettier
    table.insert(opts.ensure_installed, "prettier")
  end,
}
