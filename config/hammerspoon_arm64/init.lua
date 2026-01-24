print("=================== load djzhang's config===============================")

GMacCurrentVolume = 0

-- TerminalApp = "Wezterm.app"
-- TerminalAppID = "com.github.wez.wezterm"
TerminalApp = "Ghostty.app"
TerminalAppID = "com.mitchellh.ghostty"

-- GamesFolder = "/Volumes/MacGame/AppGames/Kegworks"
GamesFolder = "/Volumes/MacGame/AppGames/"
KegworksGames = GamesFolder .. "Kegworks/"

GameHotkeyMods = { "Cmd", "Alt", "shift", "ctrl" }

-- require "reload.reload"
require("utils.tools")
require("utils.string_utils")
require("applications.app_utils")
require("applications.app_kill")
require("applications.app")
require("applications.app_restart")
require("applications.app_titles")
require("applications.app_windows")
require("applications.bluetooth_info")
-- require("hotkey.hotkey")
require("hotkey.games_utils")
require("hotkey.games_apps")
require("hotkey.games_info")
require("hotkey.games_dialogues")
require("hotkey.games_run_alpha")
require("hotkey.games_run_numbers")
require("hotkey.games_kill")
require("hotkey.games_list")
require("hotkey.system")
require("developing.run.ios")
require("developing.run.android")

-- Create and start the watcher
-- local appMusicWatcher = hs.application.watcher.new(Mac_Apps_Watcher)
-- appMusicWatcher:start()

ConsoleFilter:subscribe({ "windowFocused" }, ConsoleWindowFocusHandler)
