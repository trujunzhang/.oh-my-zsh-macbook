-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local modules = require("configs.chadrc_aux").modules
local theme_customs = require("configs.chadrc_aux").theme_customs

M.base46 = {
    transparency = true,
    -- theme = "rosepine-dawn",
    theme = "bearded-arc", ---@diagnostic disable-line

    integrations = {
        "lspsaga",
        "blankline",
        "cmp",
        "codeactionmenu",
        "dap",
        "devicons",
        "hop",
        "lsp",
        "mason",
        "neogit",
        "notify",
        "nvimtree",
        "rainbowdelimiters",
        "semantic_tokens",
        "todo",
        "whichkey",
    },
}

local themed_values = theme_customs[M.base46.theme]

M.base46.hl_override = {
    CursorLineNr = { fg = "yellow", bold = true },
    FloatBorder = { fg = themed_values.border_fg, bg = "NONE" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopePromptBorder = { link = "FloatBorder" },
    TelescopeSelection = { bg = themed_values.curline_bg, fg = "#DDDDDD", bold = true },
    NvimTreeCursorLine = { bg = themed_values.curline_bg, fg = themed_values.curline_fg, bold = true },
    MatchWord = { fg = "NONE", bg = "black2" },
    MatchBackground = { link = "MatchWord" },
    NeogitDiffContext = { bg = "NONE" },
    NeogitDiffContextCursor = { bg = themed_values.curline_colour, bold = true },
    NeogitDiffContextHighlight = { bg = "NONE" },
    NvimTreeRootFolder = { fg = "vibrant_green" },
    NvimTreeGitDirty = { link = "NvimTreeNormal" },
    TbBufOn = { link = themed_values.buf_on_link },
    St_NormalMode = { fg = themed_values.st_normal_fg, bg = themed_values.st_bg },
    St_InsertMode = { fg = themed_values.st_insert_fg, bg = themed_values.st_bg },
    St_cwd = { fg = themed_values.st_cwd_fg, bg = themed_values.st_bg },
    St_CommandMode = { bg = themed_values.st_bg },
    St_ConfirmMode = { bg = themed_values.st_bg },
    St_SelectMode = { bg = themed_values.st_bg },
    St_VisualMode = { bg = themed_values.st_bg },
    St_ReplaceMode = { bg = themed_values.st_bg },
    St_TerminalMode = { bg = themed_values.st_bg },
    St_NTerminalMode = { bg = themed_values.st_bg },
    -- BUG: (types) fg can take a table as an argument
    TbBufOffModified = { fg = { "green", "black", 50 } }, ---@diagnostic disable-line
    FloatTitle = { fg = themed_values.border_fg, bg = "NONE" },
    LspInlayHint = { fg = themed_values.border_fg, bg = "NONE" },
    Comment = { fg = themed_values.comment_fg, italic = true },
    CmpBorder = { link = "FloatBorder" },
    CmpDocBorder = { link = "FloatBorder" },
    ["@comment"] = { link = "Comment" },
    ["@keyword"] = { italic = true },
}

M.base46.hl_add = {
    -- BUG: (types) fg can take a table as an argument
    BeardedCurline = { fg = { "black", -12 } }, ---@diagnostic disable-line
    LspInfoBorder = { link = "FloatBorder" },
    YankVisual = { bg = "lightbg" },
    St_HarpoonInactive = { link = "StText" },
    St_HarpoonActive = { link = "St_LspHints" },
    CodeActionSignHl = { fg = themed_values.code_action_fg },
    NvimTreeGitStagedIcon = { fg = "vibrant_green" },
    MarkviewLayer2 = { bg = "#171B21" },
    MarkviewCode = { link = "MarkviewLayer2" },
    HelpviewCode = { link = "MarkviewLayer2" },
    HelpviewInlineCode = { link = "MarkviewInlineCode" },
    HelpviewCodeLanguage = { link = "MarkviewCode" },
    ["@markup.quote.markdown"] = { bg = "NONE" },
    ["@markup.raw.block.markdown"] = { link = "MarkviewLayer2" },
    ["@number.luadoc"] = { fg = "Comment" },
}

M.ui = {
    -- lazyload it when there are 1+ buffers
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
        bufwidth = 21,
    },

    colorify = {
        enabled = true,
        mode = "virtual", -- fg, bg, virtual
        virt_text = "󱓻 ",
        highlight = { hex = true, lspvars = true },
    },
}

return M
