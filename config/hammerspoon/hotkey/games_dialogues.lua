local function clickActiveWindow(focusedWindow)
    local windowFrame = focusedWindow:frame()

    local x = windowFrame.x
    local y = windowFrame.y
    local width = windowFrame.w
    local height = windowFrame.h

    local centerX = x + width / 2
    local centerY = y + height / 2

    local position = { x = centerX, y = centerY }

    hs.eventtap.leftClick(position)
end

function ClickOkButton(windowTitle, actionType)
    -- Find all windows that match the title
    -- local targetWindows = hs.window.filter
    --     .new(function(win)
    --         print(win:title())
    --         return win:title() == windowTitle
    --     end)
    --     :getWindows()

    local targetWindow = nil

    local windows = hs.window.allWindows()
    for _, win in ipairs(windows) do
        -- print(win:title())
        if string.find(win:title(), windowTitle) then
            print(win:title())
            targetWindow = win
        end
    end

    if targetWindow then
        targetWindow:focus(true) -- 'true' brings all windows forward
        clickActiveWindow(targetWindow)

        -- Wait a small moment for the focus to shift (optional, but can help with timing)
        hs.timer.doAfter(0.2, function()
            if actionType == "ok" then
                -- Send the "return" key (Enter key)
                hs.eventtap.keyStroke({}, "return")
                hs.notify.new({ title = "Clicked OK button in: " .. windowTitle, informativeText = "Start it" }):send()
            end
            if actionType == "cancel" then
                -- Send the "escape" key (Escape key)
                hs.eventtap.keyStroke({}, "escape")
                hs.notify
                    .new({ title = "Clicked Cancel button in: " .. windowTitle, informativeText = "Start it" })
                    :send()
            end
        end)
    else
        hs.alert.show("Could not find window with title: " .. windowTitle)
    end
end

function ListWindowTitles()
    local windows = hs.window.allWindows()
    print("--- Open Window Titles ---")
    for _, win in ipairs(windows) do
        if win:isVisible() then -- Optionally filter for visible windows
            print(win:title())
        end
    end
    print("--------------------------")
end

function ListAllWindowTitles()
    -- Get a list of all windows
    local all_windows = hs.window.filter.new():getWindows()

    print("--- Listing all window titles ---")
    for i, window in ipairs(all_windows) do
        local title = window:title() -- Get the window title
        local appName = window:application():title() -- Get the application name
        if title and title ~= "" then
            print(string.format("Application: %s | Title: %s", appName, title))
        else
            print(string.format("Application: %s | Title: (none)", appName))
        end
    end
    print("--- End of list ---")
end

function Close_Active_Window(windowTitle, actionType, interval)
    interval = interval or 35
    actionType = actionType or "ok"
    hs.timer.doAfter(interval, function()
        ClickOkButton(windowTitle, actionType)
    end)
end

-- Example usage:
-- You can bind this function to a hotkey or call it when a specific event occurs
-- For example, to bind it to `Cmd + Option + Ctrl + K`:
-- hs.hotkey.bind({ "cmd", "alt" }, "8", function()
-- ClickOkButton("Minimum Recommended Hardware Check Failure", "ok")
-- ClickOkButton("Minimum Recommended", "ok")
-- ClickOkButton("Known issues with graphics driver", "cancel")
-- ListAllWindowTitles()
-- end)
