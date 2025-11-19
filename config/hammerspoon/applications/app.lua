hs.hotkey.bind({ "Cmd", "shift", "Ctrl" }, "C", function()
    hs.application.launchOrFocus(TerminalApp)

    EscapeTab("A")
    EscapeTab("W")
    EscapeTab("E")
    EscapeTab("R")

    EscapeTab("F")
    EscapeTab("Y")
    EscapeTab("K")
    EscapeTab("L")

    local myApp = hs.application.applicationsForBundleID(TerminalAppID)[1]

    hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)

    hs.notify.new({ title = "Escape all tabs", informativeText = "Run it successfully" }):send()
end)

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
