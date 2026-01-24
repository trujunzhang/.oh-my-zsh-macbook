function ClickxxxOkButton(windowTitle)
    -- Find all windows that match the title
    local targetWindows = hs.window.filter
        .new(function(win)
            print(win:title())
            return win:title() == windowTitle
        end)
        :getWindows()

    if #targetWindows > 0 then
        -- Assuming the first matched window is the correct one
        local targetWindow = targetWindows[1]

        -- Find the "OK" button within the window
        -- The button's title might vary depending on the application
        local okButton = targetWindow:findChild(nil, "AXButton", "OK")

        if okButton then
            okButton:performAction("AXPress")
            hs.alert.show("Clicked OK button in: " .. windowTitle)
        else
            hs.alert.show("Could not find 'OK' button in: " .. windowTitle)
        end
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

-- Example usage:
-- You can bind this function to a hotkey or call it when a specific event occurs
-- For example, to bind it to `Cmd + Option + Ctrl + K`:
hs.hotkey.bind({ "cmd", "alt" }, "8", function()
    clickOkButton("Minimum Recommended Hardware Check Failure")
    -- ListAllWindowTitles()
end)
