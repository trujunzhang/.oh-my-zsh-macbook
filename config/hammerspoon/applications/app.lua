hs.hotkey.bind(GameHotkeyMods, "N", OpenAndActiveBraveBrowser)

hs.hotkey.bind(GameHotkeyMods, "9", Kill_App_Clashx)
-- hs.hotkey.bind(GameHotkeyMods, "0", Run_Genymotion_VM)

hs.hotkey.bind(GameHotkeyMods, "0", Turn_off_Moonlander_light)

hs.hotkey.bind(GameHotkeyMods, "Q", Send_Keys_With_Hotmail)
hs.hotkey.bind(GameHotkeyMods, "A", Send_Keys_With_Password)

hs.hotkey.bind({ "Cmd", "shift", "Ctrl" }, "C", RunTerminalEscape)

hs.hotkey.bind({ "Cmd", "Alt" }, "A", RunToggleAerospace)

hs.hotkey.bind({ "Cmd", "Alt" }, "H", function()
    hs.eventtap.keyStroke({ "Cmd", "Alt" }, "F")
    -- hs.notify.new({ title = "Show Homerow keys", informativeText = "show it sucessfully" }):send()
end)

hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "C", function()
    -- hs.application.launchOrFocus("/Applications/Google Chrome.app")
    hs.application.launchOrFocus("Google Chrome.app")
    -- hs.notify.new({ title = "Google Chrome", informativeText = "run it sucessfully" }):send()
end)

hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "V", function()
    hs.application.launchOrFocus("Visual Studio Code.app")
    -- hs.notify.new({ title = "Visual Studio Code", informativeText = "run it sucessfully" }):send()
end)

-- hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "W", function()
--     hs.application.launchOrFocus(TerminalApp)
-- end)

hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "G", function()
    hs.application.launchOrFocus(TerminalApp)
end)
