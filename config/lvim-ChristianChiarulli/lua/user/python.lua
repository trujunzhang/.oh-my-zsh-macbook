lvim.lsp.pyright.setup {
  -- on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        -- search subdirectories like src; defaults to true
        autoSearchPaths = true,
        -- make completion a lot faster, especially when large libaries are imported; auto-import suffers though generally good improvement as completion is not cached like as opposed to vscode
        -- defaults to true
        useLibraryCodeForTypes = false,
      }
    }
  }
};

lvim.lang.python.lsp.setup.settings = {
  python = {
    pythonPath = "python",
    venvPath = "",
  },
}
