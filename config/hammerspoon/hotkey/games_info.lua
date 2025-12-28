function ClickGameControllersPanel()
    local targetWindow = nil

    local windows = hs.window.allWindows()
    for _, win in ipairs(windows) do
        hs.printf("%s = %s", "list title:", win:title())

        if CheckContainSubString(win:title(), "Game Controllers") then
            hs.printf("%s = %s", "find title:", win:title())
            targetWindow = win
        end
    end

    if targetWindow then
        targetWindow:focus(true) -- 'true' brings all windows forward

        -- Wait a small moment for the focus to shift (optional, but can help with timing)
        ClickActiveWindow(targetWindow, -300, 160)
    else
        hs.alert.show("Could not find window with title: " .. "Game Controllers")
    end
end

function Show_Bluetooth_PS5_Battery_Info()
    hs.eventtap.keyStroke({ "CMD", "ALT" }, "G")

    -- hs.timer.doAfter(3, function()
    --     hs.eventtap.keyStroke({ "CMD", "ALT" }, "H")
    -- end)

    hs.timer.doAfter(3, function()
        -- hs.eventtap.keyStroke({}, "A")
        -- hs.eventtap.keyStroke({}, "G")

        ClickGameControllersPanel()
        hs.notify.new({ title = "Show PS5 Battery Info", informativeText = "run it sucessfully" }):send()
    end)

    hs.timer.doAfter(10, function()
        hs.eventtap.keyStroke({ "CMD" }, "W")
    end)
end
