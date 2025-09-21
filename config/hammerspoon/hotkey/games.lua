-- local GamesFolder = "/Volumes/MacGame/AppGames/Kegworks"
local GamesFolder = "/Volumes/MacGame/AppGames/"
local KegworksGames = GamesFolder .. "Kegworks/"

-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11

-- Function to toggle Dock visibility
local function toggleDockVisibility()
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
local function move_cursor(direction)
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

local function beforePlayGame(runApp)
    -- move_cursor('left')

    hs.notify.new({ title = "Playing game", informativeText = "Start it" }):send()

    hs.timer.doAfter(2, function()
        -- local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]
        -- hs.eventtap.keyStroke({ "Alt" }, 'G', myApp)
        hs.eventtap.keyStroke({ "Alt" }, "G")
    end)

    hs.timer.doAfter(4, function()
        hs.eventtap.leftClick(hs.mouse.getAbsolutePosition())
    end)

    hs.timer.doAfter(6, function()
        runApp()
    end)
end

local function activeWindow(interval)
    interval = interval or 60
    hs.timer.doAfter(interval, function()
        hs.eventtap.leftClick(hs.mouse.getAbsolutePosition())
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

-- hs.hotkey.bind(
--     { 'Cmd', 'Alt' },
--     "R",
--     function()
--         beforePlayGame(function()
--             hs.application.launchOrFocus(GamesFolder .. "Resident Evil Village.app")
--             hs.notify.new({ title = "Resident Evil Village.app", informativeText = "run it sucessfully" }):send()
--         end)
--     end)

-- hs.hotkey.bind(
--     { 'Cmd', 'Alt' },
--     "M",
--     function()
--         beforePlayGame(function()
--             hs.application.launchOrFocus(GamesFolder .. "MetroExodus.app")
--             hs.notify.new({ title = "MetroExodus.app", informativeText = "run it sucessfully" }):send()
--         end)
--     end)

hs.hotkey.bind({ "Cmd", "Alt" }, "E", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Mass-Effect-Andromeda.app")
        hs.notify.new({ title = "Mass-Effect-Andromeda.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

-- hs.hotkey.bind({ "Cmd", "Alt" }, "I", function()
--     beforePlayGame(function()
--         hs.application.launchOrFocus(KegworksGames .. "Bioshock Infinite.app")
--         hs.notify.new({ title = "Bioshock Infinite.app", informativeText = "run it sucessfully" }):send()
--     end)
--
--     activeWindow()
-- end)

hs.hotkey.bind({ "Cmd", "Alt" }, "R", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Titanfall2.app")
        hs.notify.new({ title = "Titanfall2.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "W", function()
    hs.execute("defaults write com.apple.dock autohide -bool true && killall Dock")

    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "The Witcher 3 Wild Hunt GOTY.app")
        hs.notify.new({ title = "The Witcher 3 Wild Hunt GOTY.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow(100)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "2", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Crysis_2_Remastered-FLT.app")
        hs.notify.new({ title = "Crysis_2_Remastered-FLT.app", informativeText = "run it sucessfully" }):send()
    end)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "3", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Crysis 3 Remasted.app")
        hs.notify.new({ title = "Crysis 3 Remasted.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "4", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-Creed-IV-Black Flag.app")
        hs.notify.new({ title = "Assasins Creed - black flag", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "5", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-creed-rogue.app")
        hs.notify.new({ title = "Assassins-creed-rogue.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "6", function()
    -- local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable toggle"
    -- hs.execute(shell_command)

    beforePlayGame(function()
        -- hs.application.launchOrFocus(KegworksGames .. "Assassins.Creed.Origins-CPY.app")
        -- hs.notify.new({ title = "Assassins.Creed.Origins-CPY.app", informativeText = "run it sucessfully" }):send()

        hs.application.launchOrFocus(KegworksGames .. "Batman Arkham Knight.app")
        hs.notify.new({ title = "Batman Arkham Knight.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "7", function()
    -- turn off aerospace
    local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable off"
    hs.execute(shell_command)

    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Need_for_Speed_Payback.app")
        hs.notify.new({ title = "Need-for-speed-payback.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "C", function()
    beforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Mafia Definitive Edition.app")
        hs.notify.new({ title = "Mafia Definitive Edition.app", informativeText = "run it sucessfully" }):send()
    end)

    activeWindow(100)
end)
