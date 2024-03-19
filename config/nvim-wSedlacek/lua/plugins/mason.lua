---@type NvPluginSpec
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyre",
      "lua-language-server",
      "html-lsp",
      "prettier",
      "stylua"
    },
  },
  config = function(_, opts)
    -- https://www.lazyvim.org/extras/formatting/prettier
    table.insert(opts.ensure_installed, "prettier")
  end,
}
