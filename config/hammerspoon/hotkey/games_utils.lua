-- Function to toggle Dock visibility
function ToggleDockVisibility()
    local currentDockState = hs.execute("defaults read com.apple.dock autohide")
    if currentDockState == "1" then
        hs.execute("defaults write com.apple.dock autohide -bool false && killall Dock")
    else
        hs.execute("defaults write com.apple.dock autohide -bool true && killall Dock")
    end
end

-- Assassins-creed-three.app
-- 'Assassins Creed IV Black Flag.app'
-- Assassins-creed-rogue.app
-- Assassins-creed-unity.app
-- Cyberpunk.2077..app

-- hs.hotkey.bind({ "alt", "shift" }, "Right", move_cursor('right'))
-- hs.hotkey.bind({ "alt", "shift" }, "Left", move_cursor('left'))
function Move_Cursor(direction)
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen
    if direction == "right" then
        nextScreen = screen:next()
    else
        nextScreen = screen:previous()
    end

    local rect = nextScreen:fullFrame()
    -- get the center of the rect
    local center = hs.geometry.rect(rect).center
    hs.mouse.setAbsolutePosition(center)
end

function BeforePlayGame(runApp)
    -- move_cursor('left')

    hs.notify.new({ title = "Playing game", informativeText = "Start it" }):send()

    hs.timer.doAfter(1, function()
        hs.eventtap.keyStroke({ "Alt" }, "B")
    end)

    hs.timer.doAfter(3, function()
        hs.eventtap.keyStroke({ "Alt" }, "G")
    end)

    hs.timer.doAfter(5, function()
        -- hs.eventtap.leftClick(hs.mouse.absolutePosition())
        ClickPrimaryScreenCenter()
    end)

    hs.timer.doAfter(6, function()
        runApp()
    end)
end

function ActiveWindow(interval)
    interval = interval or 60
    hs.timer.doAfter(interval, function()
        -- hs.eventtap.leftClick(hs.mouse.absolutePosition())
        ClickPrimaryScreenCenter()
        -- hs.notify.new({ title = "Active game window", informativeText = "click it sucessfully" }):send()
        hs.alert.show(
            string.format(
                "App path:        %s\nApp name:      %s\nIM source id:  %s",
                hs.window.focusedWindow():application():name(),
                hs.window.focusedWindow():application():name(),
                hs.keycodes.currentSourceID()
            )
        )
    end)
end

function ClickPlayButton(app_name, interval)
    interval = interval or 35
    hs.timer.doAfter(interval, function()
        hs.eventtap.keyStroke({}, "return")
        hs.notify.new({ title = "launch " .. app_name, informativeText = "run it sucessfully" }):send()
    end)
end
