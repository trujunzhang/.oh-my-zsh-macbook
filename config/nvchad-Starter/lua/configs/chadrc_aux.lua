local M = {}

M.theme_customs = {
  ["bearded-arc"] = {
    border_fg = "#7589BF",
    buf_on_link = "Normal",
    comment_fg = "#7589BF",
    code_action_fg = "#F9E2AF",
    curline_bg = "black",
    curline_fg = "nord_blue",
    st_bg = "one_bg1",
    st_cwd_fg = "red",
    st_normal_fg = "blue",
    st_insert_fg = "purple",
  },
  ["eldritch"] = {
    border_fg = "purple",
    buf_on_link = "St_Lsp",
    comment_fg = "dark_purple",
    code_action_fg = "yellow",
    curline_bg = "black",
    curline_fg = "purple",
    st_bg = "statusline_bg",
    st_cwd_fg = "yellow",
    st_normal_fg = "blue",
    st_insert_fg = "purple",
  },
}

--- Show harpoon indicator in statusline
local harpoon_statusline_indicator = function()
  -- inspiration from https://github.com/letieu/harpoon-lualine
  local inactive = "%#St_HarpoonInactive#"
  local active = "%#St_HarpoonActive#"

  local options = {
    icon = active .. " ⇁ ",
    separator = "",
    indicators = {
      inactive .. "q",
      inactive .. "w",
      inactive .. "e",
      inactive .. "r",
      inactive .. "t",
      inactive .. "y",
    },
    active_indicators = {
      active .. "1",
      active .. "2",
      active .. "3",
      active .. "4",
      active .. "5",
      active .. "6",
    },
  }

  local list = require("harpoon"):list()
  local root_dir = list.config:get_root_dir()
  local current_file_path = vim.api.nvim_buf_get_name(0)
  local length = math.min(list:length(), #options.indicators)
  local status = { options.icon }

  local get_full_path = function(root, value)
    if vim.uv.os_uname().sysname == "Windows_NT" then
      return root .. "\\" .. value
    end

    return root .. "/" .. value
  end

  for i = 1, length do
    local value = list:get(i).value
    local full_path = get_full_path(root_dir, value)

    if full_path == current_file_path then
      table.insert(status, options.active_indicators[i])
    else
      table.insert(status, options.indicators[i])
    end
  end

  if length > 0 then
    table.insert(status, " ")
    return table.concat(status, options.separator)
  else
    return ""
  end
end

M.modules = {
  statusline = {
    separator = " ", -- Add space between modules
    hack = "%#@comment#%", -- Hack to make module highlight visible
    tint = "%#StText#", -- Force grey on modules that absorb neighbour colour

    modified = function()
      local hl = "%#TbBufOffModified#"
      return vim.bo.modified and hl .. " " or hl .. ""
    end, -- Show modified indicator

    bufnr = function()
      local bufnr = vim.api.nvim_get_current_buf()
      return "%#StText#" .. tostring(bufnr)
    end, -- Show current buffer number in statusline

    harpoon = harpoon_statusline_indicator,
  },

  tabufline = {
    fill = "%#TbFill#%=", -- Fill tabufline with TbFill hl
  },
}

return M
