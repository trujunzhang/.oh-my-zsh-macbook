local function ApplicationLaunchKeyRemap(key, name)
    hs.hotkey.bind({ "space" }, key, function()
        hs.application.launchOrFocus(name)

        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
            hs.window.focusedWindow():application():path(),
            hs.window.focusedWindow():application():name(),
            hs.keycodes.currentSourceID()))
    end)
end

-- ApplicationLaunchKeyRemap("C", "Google Chrome")

hs.hotkey.bind(
    { 'Cmd', "shift", "Ctrl" },
    "C",
    function()
        hs.application.launchOrFocus("WezTerm")

        EscapeTab("A")
        EscapeTab("W")
        EscapeTab("E")
        EscapeTab("R")

        EscapeTab("F")
        EscapeTab("J")
        EscapeTab("K")
        EscapeTab("L")

        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]
        hs.eventtap.keyStroke({ "Ctrl" }, 'A', myApp)

        hs.notify.new({ title = "Escape all tabs", informativeText = "Run it successfully" }):send()
    end)
