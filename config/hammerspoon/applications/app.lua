hs.hotkey.bind(GameHotkeyMods, "N", OpenAndActiveBraveBrowser)
hs.hotkey.bind(GameHotkeyMods, "B", OpenAndActiveBraveBrowser)

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

hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "W", function()
    hs.application.launchOrFocus(TerminalApp)
    -- hs.notify.new({ title = "WezTerm", informativeText = "run it sucessfully" }):send()
end)

hs.hotkey.bind({ "Cmd", "Alt", "Ctrl" }, "G", function()
    hs.application.launchOrFocus(TerminalApp)
    -- hs.notify.new({ title = "Ghostty", informativeText = "run it sucessfully" }):send()
end)
