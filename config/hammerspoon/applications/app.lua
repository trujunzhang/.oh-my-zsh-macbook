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
