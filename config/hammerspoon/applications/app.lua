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
        -- hs.application.launchOrFocus("Ghostty")

        EscapeTab("A")
        EscapeTab("W")
        EscapeTab("E")
        EscapeTab("R")

        EscapeTab("F")
        EscapeTab("U")
        EscapeTab("K")
        EscapeTab("L")

        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]
        -- local myApp = hs.application.applicationsForBundleID('com.mitchellh.ghostty')[1]
        hs.eventtap.keyStroke({ "Ctrl" }, 'A', myApp)

        hs.notify.new({ title = "Escape all tabs", informativeText = "Run it successfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "H",
    function()
        hs.eventtap.keyStroke({ "Cmd", "Alt" }, 'F')
        -- hs.notify.new({ title = "Show Homerow keys", informativeText = "show it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt', 'Ctrl' },
    "C",
    function()
        hs.application.launchOrFocus("/Applications/Google Chrome.app")
        -- hs.notify.new({ title = "Google Chrome", informativeText = "run it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt', 'Ctrl' },
    "V",
    function()
        hs.application.launchOrFocus("/Applications/Visual Studio Code.app")
        -- hs.notify.new({ title = "Visual Studio Code", informativeText = "run it sucessfully" }):send()
    end)


hs.hotkey.bind(
    { 'Cmd', 'Alt', 'Ctrl' },
    "W",
    function()
        hs.application.launchOrFocus("/Applications/Wezterm.app")
        -- hs.notify.new({ title = "WezTerm", informativeText = "run it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt', 'Ctrl' },
    "G",
    function()
        hs.application.launchOrFocus("/Applications/Ghostty.app")
        -- hs.notify.new({ title = "Ghostty", informativeText = "run it sucessfully" }):send()
    end)
