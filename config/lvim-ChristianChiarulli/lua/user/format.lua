local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.js", "*.jsx", "*.ts", "*.tsx"}


