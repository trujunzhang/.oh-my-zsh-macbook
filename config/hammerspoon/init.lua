print("=================== load djzhang's config===============================")

-- TerminalApp = "Wezterm.app"
-- TerminalAppID = "com.github.wez.wezterm"
TerminalApp = "Ghostty.app"
TerminalAppID = "com.mitchellh.ghostty"

-- require "reload.reload"
require("utils.tools")
require("hotkey.hotkey")
require("hotkey.games_dialogues")
require("hotkey.games_utils")
require("hotkey.games_run")
require("hotkey.games_kill")
require("hotkey.system")
require("applications.app")
require("developing.run.ios")
require("developing.run.android")

-- Private use
if hs.host.localizedName() == "kaboom的MacBook Pro" then
    -- require("autoscript.autoscript")
end
