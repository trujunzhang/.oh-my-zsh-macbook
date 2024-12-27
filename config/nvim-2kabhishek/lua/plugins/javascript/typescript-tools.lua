return {
  "pmizio/typescript-tools.nvim",
  enabled = true,
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  dependencies = {
    "OlegGulevskyy/better-ts-errors.nvim",
  },
  config = function()
    require("plugins.javascript.config.typescript-tools-config")
  end,
}
