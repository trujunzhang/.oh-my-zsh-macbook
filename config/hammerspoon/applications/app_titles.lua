-- Define a function that will be called when a window matching the filter changes focus
function ConsoleWindowFocusHandler(window)
    if window then
        local winTitle = window:title()
        print("Hammerspoon Console window focused! Title: " .. winTitle)

        if winTitle == "Open" then
            hs.timer.doAfter(3, function()
                hs.eventtap.keyStroke({}, "return")
                hs.notify
                    .new({ title = "Watching window title: " .. winTitle, informativeText = "run it sucessfully" })
                    :send()
            end)
        end

        if winTitle == "Music" then
            hs.timer.doAfter(2, function()
                hs.execute("kill -9 $(ps aux | grep 'Music' | awk '{print $2}')")
                -- hs.execute("killall Music")
                hs.notify
                    .new({ title = "Watching window title: " .. winTitle, informativeText = "kill it sucessfully" })
                    :send()
            end)
        end

        -- You can add more actions here, e.g., move the window to a specific screen
        -- window:moveToUnit(hs.geometry.rect(0, 0, 0.5, 1))
    else
        print("A window matching the filter lost focus (or was closed).")
    end
end

-- Create a new window filter
ConsoleFilter = hs.window.filter.new()

-- Filter windows by an exact application name (optional, but good practice)
ConsoleFilter:setAppFilter("Hammerspoon")

-- Add a title filter using a Lua pattern (case-insensitive by default)
-- The pattern "console" will match "Hammerspoon Console"
-- ConsoleFilter:setTitleFilter("console", true) -- `true` makes it case-insensitive

-- Subscribe to window focus events for this filter
-- ConsoleFilter:subscribe({ "windowFocused" }, ConsoleWindowFocusHandler)

-- You can also subscribe to creation/destruction events
-- consoleFilter:subscribe({"windowCreated", "windowDestroyed"}, function(windowFilter, window, event)
--     print("Event " .. event .. " for window: " .. window:title())
-- end)

-- Optional: start highlighting windows that match the filter (for debugging/visual confirmation)
-- hs.window.highlight.start(consoleFilter)

-- print("Hammerspoon window title watcher is active.")
