local which_key = require("which-key")
local icons = require("lib.icons")

local LazyVim = require("lazyvim.util")

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 30,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    ["<leader>"] = icons.ui.Rocket .. "Space",
    ["<space>"] = icons.ui.Rocket .. "Space",
  },
  icons = {
    breadcrumb = icons.ui.ArrowOpen,
    separator = icons.ui.Arrow,
    group = "",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "shadow",
    position = "bottom",
    margin = { 0, 0, 0, 0 },
    padding = { 1, 2, 1, 2 },
    winblend = 10,
  },
  layout = {
    height = { min = 4, max = 24 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
  show_help = true,
  show_keys = true,
  triggers = "auto",
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    i = { "j", "j" },
    v = { "j", "j" },
  },
}

local i = {
  [" "] = "Whitespace",
  ['"'] = 'Balanced "',
  ["'"] = "Balanced '",
  ["`"] = "Balanced `",
  ["("] = "Balanced (",
  [")"] = "Balanced ) including white-space",
  [">"] = "Balanced > including white-space",
  ["<lt>"] = "Balanced <",
  ["]"] = "Balanced ] including white-space",
  ["["] = "Balanced [",
  ["}"] = "Balanced } including white-space",
  ["{"] = "Balanced {",
  ["?"] = "User Prompt",
  _ = "Underscore",
  a = "Argument",
  b = "Balanced ), ], }",
  c = "Class",
  f = "Function",
  o = "Block, conditional, loop",
  q = "Quote `, \", '",
  t = "Tag",
}

local a = vim.deepcopy(i)
for k, v in pairs(a) do
  a[k] = v:gsub(" including.*", "")
end

local ic = vim.deepcopy(i)
local ac = vim.deepcopy(a)

for key, name in pairs({ n = "Next", l = "Last" }) do
  i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
  a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  -- e = { '<cmd>NvimTreeToggle<cr>', icons.documents.OpenFolder .. 'Explorer' },
  -- e = {
  --   function()
  --     local nvim_tree_api = require("nvim-tree.api")
  --     return nvim_tree_api.tree.open()
  --   end,
  --   icons.documents.OpenFolder .. "Explorer",
  -- },
  ["<Tab>"] = { "<cmd>b#<cr>", icons.ui.Pencil .. "Tab Previous" },
  q = { "<cmd>qa!<cr>", icons.ui.Close .. "Quit" },
  Q = { "<cmd>qa!<cr>", icons.ui.Power .. "Force Quit!" },
  w = { "<cmd>w<cr>", icons.ui.Save .. "Save" },
  x = { "<cmd>x<cr>", icons.ui.Pencil .. "Write and Quit" },
  -- ['/'] = { '<Plug>(comment_toggle_linewise_current)', 'Comment toggle current line' },
  c = {
    name = icons.ui.NeoVim .. "Config",
    c = { "<cmd>CccConvert<cr>", "Convert Color" },
    d = { "<cmd>RootDir<cr>", "Root Directory" },
    e = { "<cmd>e $MYVIMRC<cr>", "Edit Config" },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format File" },
    F = { "<cmd>retab<cr>", "Fix Tabs" },
    i = { vim.show_pos, "Inspect Position" },
    l = { "<cmd>:g/^\\s*$/d<cr>", "Clean Empty Lines" },
    n = { "<cmd>set relativenumber!<cr>", "Relative Numbers" },
    p = { "<cmd>CccPick<cr>", "Pick Color" },
    r = { "<cmd>Telescope reloader<cr>", "Reload Module" },
    R = { "<cmd>ReloadConfig<cr>", "Reload Configs" },
  },
  d = {
    name = icons.ui.Bug .. "Debug",
    b = { "<cmd>DapToggleBreakpoint<cr>", "Breakpoint" },
    c = { "<cmd>DapContinue<cr>", "Continue" },
    i = { "<cmd>DapStepInto<cr>", "Into" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    o = { "<cmd>DapStepOver<cr>", "Over" },
    O = { "<cmd>DapStepOut<cr>", "Out" },
    r = { "<cmd>DapToggleRepl<cr>", "Repl" },
    R = { "<cmd>DapRestartFrame<cr>", "Restart Frame" },
    u = { "<cmd>DapUIToggle<cr>", "Debugger" },
    t = { '<cmd>lua require"jester".debug()<cr>', "Debug cursor jtest" },
    x = { "<cmd>DapTerminate<cr>", "Exit" },
  },
  l = {
    name = icons.ui.Gear .. "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    d = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition" },
    f = { "<cmd>Lspsaga finder<cr>", "Finder" },
    F = { "<cmd>Telescope lsp_references<cr>", "References" },
    h = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
    i = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    I = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
    k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle LSP Lines" },
    L = { "<cmd>LspInfo<cr>", "LSP Info" },
    o = { "<cmd>Lspsaga outline<cr>", "Outline" },
    p = { "<cmd>Telescope lsp_incoming_calls<cr>", "Incoming Calls" },
    P = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Outgoing Calls" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    R = { "<cmd>Lspsaga project_replace<cr>", "Replace" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    t = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek Type Definition" },
    T = { "<cmd>Lspsaga goto_type_definition<cr>", "Goto Type Definition" },
  },

  j = {
    name = icons.ui.Gear .. "JavaScript",
    g = { '<cmd>lua require("package-info").toggle()<cr>', "Toggle package info" },
    u = { '<cmd>lua require("package-info").update()<cr>', "Update package" },
    x = { '<cmd>lua require("package-info").delete()<cr>', "Delete package" },
    v = { '<cmd>lua require("package-info").change_version()<cr>', "Change Version" },
    s = { "<cmd>TSToolsSortImports<cr>", "Sort imports" },
    o = { "<cmd>TSToolsOrganizeImports<cr>", "Organize imports" },
    f = { "<cmd>TSToolsFixAll<cr>", "Fix all" },
    i = { "<cmd>TSToolsAddMissingImports<cr>", "Add imports" },
    d = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Source definition" },
    r = { "<cmd>TSToolsRenameFile<cr>", "Rename file" },
    t = { "<cmd>TSC<cr>", "TSC" },
  },

  m = {
    name = icons.kind.Field .. "Modes",
    c = { "<cmd>CccHighlighterToggle<cr>", "Highlight Colors" },
    d = { "<cmd>Dashboard<cr>", "Dashboard" },
    h = { "<cmd>Hardtime toggle<cr>", "Hardtime" },
    m = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview" },
    n = { "<cmd>Telescope notify<cr>", "Notifications" },
    r = { "<cmd>%SnipRun<cr>", "Run File" },
    s = { "<cmd>set spell!<cr>", "Spellcheck" },
    z = { "<cmd>ZenMode<cr>", "ZenMode" },
    Z = { "<cmd>Twilight<cr>", "Twilight" },
  },
  n = {
    name = icons.ui.Note .. "Notes",
    d = { "<cmd>Tdo<cr>", "Today's Todo" },
    e = { "<cmd>TdoEntry<cr>", "Today's Entry" },
    f = { "<cmd>TdoFiles<cr>", "All Notes" },
    g = { "<cmd>TdoFind<cr>", "Find Notes" },
    h = { "<cmd>Tdo -1<cr>", "Yesterday's Todo" },
    j = { "<cmd>put =strftime('%a %d %b %r')<cr>", "Insert Human Date" },
    J = { "<cmd>put =strftime('%F')<cr>", "Insert Date" },
    k = { "<cmd>put =strftime('%r')<cr>", "Insert Human Time" },
    K = { "<cmd>put =strftime('%F-%H-%M')<cr>", "Insert Time" },
    l = { "<cmd>Tdo 1<cr>", "Tomorrow's Todo" },
    n = { "<cmd>TdoNote<cr>", "New Note" },
    s = {
      '<cmd>lua require("tdo").run_with("commit " .. vim.fn.expand("%:p")) vim.notify("Committed!")<cr>',
      "Commit Note",
    },
    t = { "<cmd>TdoTodos<cr>", "Incomplete Todos" },
    x = { "<cmd>TdoToggle<cr>", "Toggle Todo" },
  },
  p = {
    name = icons.ui.Package .. "Packages",
    c = { "<cmd>Lazy check<cr>", "Check" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
    p = { "<cmd>Lazy<cr>", "Plugins" },
    P = { "<cmd>Lazy profile<cr>", "Profile" },
    m = { "<cmd>Mason<cr>", "Mason" },
    i = { "<cmd>Lazy install<cr>", "Install" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    r = { "<cmd>Lazy restore<cr>", "Restore" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    x = { "<cmd>Lazy clean<cr>", "Clean" },
  },

  r = {
    name = icons.diagnostics.Hint .. "Refactor",
    b = { "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Spectre Replace Buffer" },
    c = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Spectre Search current word" },
    e = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract Block" },
    f = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract To File" },
    i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    n = { "", "Swap Next" },
    p = { "", "Swap Previous" },
    r = { "", "Smart Rename" },
    d = { "", "Go To Definition" },
    h = { "", "List Definition Head" },
    l = { "", "List Definition" },
    j = { "", "Next Usage" },
    k = { "", "Previous Usage" },
    R = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor Commands" },
    S = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace Word" },
    v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  },
  t = {
    name = icons.ui.Terminal .. "Terminal",
    ["`"] = { "<cmd>Sterm<cr>", "Horizontal Terminal" },
    n = { "<cmd>Sterm node<cr>", "Node" },
    p = { "<cmd>Sterm bpython<cr>", "Python" },
    r = { "<cmd>Sterm irb<cr>", "Ruby" },
    s = { "<cmd>Sterm<cr>", "Horizontal Terminal" },
    t = { "<cmd>Fterm<cr>", "Terminal" },
    v = { "<cmd>Vterm<cr>", "Vertical Terminal" },
  },
  T = {
    name = icons.ui.Test .. "Test",
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', "Run Test" },
    F = { '<cmd>lua require("neotest").run.run()<cr>', "Run Current Test" },
    o = { "<cmd>Neotest output-panel<cr>", "Test Output" },
    O = { "<cmd>Neotest summary<cr>", "Test Summary" },
  },
  s = {
    name = icons.ui.Windows .. "Split",
    ["-"] = { "<C-w>s", "Split Below" },
    ["\\"] = { "<C-w>v", "Split Right" },
    c = { "<cmd>tabclose<cr>", "Close Tab" },
    d = { "<C-w>c", "Close Window" },
    f = { "<cmd>tabfirst<cr>", "First Tab" },
    h = { "<C-w>h", "Move Left" },
    j = { "<C-w>j", "Move Down" },
    k = { "<C-w>k", "Move Up" },
    l = { "<C-w>l", "Move Right" },
    L = { "<cmd>tablast<cr>", "Last Tab" },
    o = { "<cmd>tabnext<cr>", "Next Tab" },
    O = { "<cmd>tabprevious<cr>", "Previous Tab" },
    p = { "<C-w>p", "Previous Window" },
    q = { "<cmd>bw<cr>", "Close Current Buf" },
    s = { "<cmd>split<cr>", "Horizontal Split File" },
    t = { "<cmd>tabnew<cr>", "New Tab" },
    v = { "<cmd>vsplit<cr>", "Vertical Split File" },
    W = { "<cmd>lua require'utils'.sudo_write()<cr>", "Force Write" },
    w = { "<cmd>w<cr>", "Write" },
    x = { "<cmd>x<cr>", "Write and Quit" },
  },
  y = {
    name = icons.ui.Clipboard .. "Yank",
    f = { "<cmd>%y+<cr>", "Copy Whole File" },
    p = { "<cmd>CRpath<cr>", "Copy Relative Path" },
    P = { "<cmd>CApath<cr>", "Copy Absolute Path" },
    g = { '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', "Copy Git URL" },
  },
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vmappings = {
  l = {
    name = icons.ui.Gear .. "LSP",
    a = "<cmd><C-U>Lspsaga range_code_action<CR>",
  },
  r = {
    name = icons.diagnostics.Hint .. "Refactor",
    r = { "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor Commands" },
    e = { "<esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
    f = { "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract To File" },
    v = { "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
    i = { "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
  },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", icons.ui.Play .. "Run Code" },
  q = { "<cmd>q<cr>", icons.ui.Close .. "Quit" },
  Q = { "<cmd>qa!<cr>", icons.ui.Power .. "Force Quit!" },
  x = { "<cmd>x<cr>", icons.ui.Pencil .. "Write and Quit" },
  y = {
    name = icons.ui.Clipboard .. "Yank",
    g = { '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', "Copy Git URL" },
  },
}

local no_leader_opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local no_leader_mappings = {
  ["<S-h>"] = { "<cmd>bprevious<cr>", "Previous Buffer" },
  ["<S-l>"] = { "<cmd>bnext<cr>", "Next Buffer" },

  ["<C-h>"] = { "<C-w>h", "Move Left" },
  -- ['<C-h>'] = {
  --     function()
  --         local nvim_tree_api = require('nvim-tree.api')
  --         return nvim_tree_api.tree.open()
  --     end,
  --     icons.documents.OpenFolder .. 'Explorer',
  -- },
  -- ["<C-h>"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["<C-j>"] = { "<C-w>j", "Move Down" },
  ["<C-k>"] = { "<C-w>k", "Move Up" },
  ["<C-l>"] = { "<C-w>l", "Move Right" },

  ["<C-i>"] = { "<cmd>b#<cr>", "Tab Previous" },
  -- ["<C-r>"] = { '<cmd>lua LazyVim.pick("live_grep")<cr>', "Find Text" },
  ["<C-r>"] = {
    function()
      require("lazyvim.util").pick("live_grep")
    end,
    "Find Text",
  },
  -- { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },

  ["<C-Up>"] = { "<cmd>resize +10<cr>", "Increase window height" },
  ["<C-Down>"] = { "<cmd>resize -10<cr>", "Decrease window height" },
  ["<C-Left>"] = { "<cmd>vertical resize -10<cr>", "Decrease window width" },
  ["<C-Right>"] = { "<cmd>vertical resize +10<cr>", "Increase window width" },

  ["<C-f>"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
  -- ["<C-g>"] = { "<cmd>Fterm lazygit<cr>", "Lazygit" },
  ["<C-g>"] = {
    function()
      require("lazyvim.util").terminal.open(
        { "gitui" },
        { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false }
      )
    end,
    "Lazygit",
  },

  ["<C-b>"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },

  ["["] = {
    name = icons.ui.ArrowLeft .. "Previous",
    b = { "<cmd>bprevious<cr>", "Buffer" },
    B = { "<cmd>bfirst<cr>", "First Buffer" },
    d = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic" },
    e = { "g;", "Edit" },
    g = { "<cmd>Gitsigns prev_hunk<cr>", "Git Hunk" },
    j = { "<C-o>", "Jump" },
  },
  ["]"] = {
    name = icons.ui.ArrowRight .. "Next",
    b = { "<cmd>bnext<cr>", "Buffer" },
    B = { "<cmd>blast<cr>", "Buffer" },
    d = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic" },
    e = { "g,", "Edit" },
    g = { "<cmd>Gitsigns next_hunk<cr>", "Git Hunk" },
    j = { "<C-i>", "Jump" },
  },

  ["#"] = { "<cmd>edit #<cr>", "Alternate Buffer" },
  K = { "<cmd>Lspsaga hover_doc<cr>", "LSP Hover" },
  U = { "<cmd>redo<cr>", "Redo" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(no_leader_mappings, no_leader_opts)
which_key.register({ mode = { "o", "x" }, i = i, a = a })
