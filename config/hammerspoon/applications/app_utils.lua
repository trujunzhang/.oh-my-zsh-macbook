function OpenAndActiveBraveBrowser()
    hs.application.launchOrFocus("Brave Browser Nightly")

    hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Alt" }, "N")

        local myApp = hs.application.applicationsForBundleID("com.brave.Browser.nightly")[1]
        local focusedAppWindow = myApp:focusedWindow()
        ClickActiveWindow(focusedAppWindow, 0, 55)
        hs.eventtap.keyStroke({ "" }, "space", myApp)
    end)

    hs.alert.show(
        string.format(
            "App path:        %s\nApp name:      %s\nIM source id:  %s",
            hs.window.focusedWindow():application():path(),
            hs.window.focusedWindow():application():name(),
            hs.keycodes.currentSourceID()
        )
    )

    -- hs.timer.doAfter(2, function()
    --     if Is_WindowActive("Brave Canary") == false then
    --         hs.eventtap.keyStroke({ "Alt" }, "N")
    --         hs.printf("%s = %s", "Brave Browser title is not active:", "Brave Canary")
    --     end
    -- end)
end

function RunTerminalEscape()
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
end

function RunToggleAerospace()
    local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable toggle"
    hs.execute(shell_command)
    hs.notify.new({ title = "toggle Aerospace", informativeText = "toggle it sucessfully" }):send()
end
