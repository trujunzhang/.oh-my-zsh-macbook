local platform = require('utils.platform')()

local options = {
   -- default_prog = {},
   -- launch_menu = {},
}

-- if platform.is_mac_arm then
--    options.default_prog = { '/etc/profiles/per-user/djzhang/bin/fish', '-l' }
--    options.launch_menu = {
--       { label = 'Bash', args = { 'bash', '-l' } },
--       { label = 'Fish', args = { '/etc/profiles/per-user/djzhang/bin/fish', '-l' } },
--       { label = 'Zsh', args = { 'zsh', '-l' } },
--    }
-- elseif platform.is_mac_x86 then
--    options.default_prog = { '/etc/profiles/per-user/djzhang/bin/fish', '-l' }
--    options.launch_menu = {
--       { label = 'Bash', args = { 'bash', '-l' } },
--       { label = 'Fish', args = { '/etc/profiles/per-user/djzhang/bin/fish', '-l' } },
--       { label = 'Zsh', args = { 'zsh', '-l' } },
--    }
-- end

return options
