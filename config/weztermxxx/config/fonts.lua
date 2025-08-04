local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'JetBrainsMono Nerd Font'
-- brew install font-jetbrains-mono-nerd-font
-- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
local font = 'JetBrainsMono Nerd Font'
-- local font = 'Hack Nerd Font Mono'
local font_size = 14

return {
   font = wezterm.font(font),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   -- freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'

   freetype_render_target = 'HorizontalLcd',
}
