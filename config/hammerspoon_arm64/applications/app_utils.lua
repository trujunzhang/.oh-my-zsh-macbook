function Send_Keys_With_Hotmail()
    hs.eventtap.keyStrokes("trujunzhang@hotmail.com")
end

function Send_Keys_With_Password()
    hs.eventtap.keyStrokes("wanghao@DJZ720")
end

function Turn_off_Moonlander_light()
    -- info
    --   moonlander = "Moonlander Mark I"
    --   moonlander = "Moonlander Mark I"
    --    https://github.com/qmk/qmk_firmware
    --    https://github.com/qmk/qmk_firmware
    --    QK_BACKLIGHT_OFF
    --    QK_BACKLIGHT_OFF
    --    QK_BACKLIGHT_OFF = 0x7801,
    --    QK_BACKLIGHT_OFF = 0x7801,

    -- hs.eventtap.keyStroke({ "" }, "A")

    -- local char_string = hs.utf8.codepointToUTF8(0x00C5)
    -- hs.eventtap.keyStrokes(char_string)

    -- local char_string = hs.utf8.codepointToUTF8(0x00A0)
    -- local char_string = hs.utf8.codepointToUTF8(0x0005)
    -- hs.eventtap.keyStrokes(char_string)

    -- hs.brightness.keyboard(0)
end

function Run_Genymotion_VM()
    hs.execute("killall ClashX")

    local genymotion_folder = "/Volumes/MacGame/MacApps/current/Genymotion"
    local genymotion_vm_name = "e19d3aee-67e1-4bc5-a9c2-cdd4a4b18926"

    hs.execute(
        genymotion_folder
            .. "/Genymotion.app/Contents/MacOS/player.app/Contents/MacOS/player --vm-name "
            .. genymotion_vm_name
            .. " --referer launchpad --no-update-check"
    )
end

function OpenAndActiveBraveBrowser()
    hs.application.launchOrFocus("Brave Browser Nightly")

    hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Alt" }, "N")

        local myApp = hs.application.applicationsForBundleID("com.brave.Browser.nightly")[1]
        local focusedAppWindow = myApp:focusedWindow()
        ClickActiveWindow(focusedAppWindow, 0, 90)
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
