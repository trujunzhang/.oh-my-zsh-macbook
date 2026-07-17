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

function BeforePlayGame(app_name, game_foler_name, runApp)
    DoesGameTagFileExist(app_name, game_foler_name, runApp, DoPlayGame, DoOpenAndVerifyGame)
end

function DoOpenAndVerifyGame(appName, game_foler_name)
    hs.notify.new({ title = "Verifing game", informativeText = "Start it" }):send()

    appName = FixGameAppName(appName)
    GCurrentGameName = appName
    CheckAppExistedByPrefix(appName)

    -- hs.printf("%s = %s", "GCurrentGameName:", GCurrentGameName)

    local appPath = KegworksGames .. GCurrentGameName
    -- hs.printf("%s = %s", "appPath:", appPath)

    if DoesDirectoryExist(appPath) then
        local wine_gamePath = appPath .. "/" .. DRIVER_C_FOLDER_IN_WINE_APP .. "/Games"
        local toxic_gamePath = appPath .. "/" .. DRIVER_C_FOLDER_IN_TOXICGAME_APP .. "/Games"

        local gamesFolder = wine_gamePath
        if DoesDirectoryExist(toxic_gamePath) then
            gamesFolder = toxic_gamePath
        end

        local gamePath = gamesFolder .. "/" .. game_foler_name

        local tmpPath = Moving_Games_Folder .. "/" .. game_foler_name

        -- hs.printf("%s = %s", "gamePath:", gamePath)
        -- hs.printf("%s = %s", "tmpPath:", tmpPath)

        if DoesDirectoryExist(gamePath) then
            hs.execute("mkdir -p " .. Moving_Games_Folder)
            local shell_command = "mv '" .. gamePath .. "' '" .. tmpPath .. "'"
            hs.execute(shell_command)
            hs.notify.new({ title = GCurrentGameName, informativeText = "Moving to tmp folder sucessfully" }):send()

            hs.timer.doAfter(0.5, function()
                hs.application.launchOrFocus(appPath)
            end)

            hs.timer.doAfter(80, function()
                -- hs.timer.doAfter(5, function()
                hs.execute("killall Configure")
            end)
        elseif DoesDirectoryExist(tmpPath) then
            if DoesDirectoryExist(gamesFolder) then
                local shell_command = "mv '" .. tmpPath .. "' '" .. gamePath .. "'"
                hs.execute(shell_command)
                hs.notify
                    .new({ title = GCurrentGameName, informativeText = "Moving from tmp folder sucessfully" })
                    :send()
                WriteGameTagFile(appName)
            else
                hs.notify.new({ title = "Moving from tmp folder", informativeText = "run it failed" }):send()
            end
        end
    else
        hs.notify.new({ title = GCurrentGameName .. " not found", informativeText = "run it failed" }):send()
    end
end

function DoPlayGame(runApp)
    hs.notify.new({ title = "Playing game", informativeText = "Start it" }):send()

    hs.timer.doAfter(1, function()
        hs.eventtap.keyStroke({ "Alt" }, "N")
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
    if OpenGameStatus == "verify" then
        return
    end
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

function Open_Enjoyable(shortcut)
    local appName = "Enjoyable"

    hs.execute("killall " .. appName)

    hs.timer.doAfter(2, function()
        hs.application.launchOrFocus(GamesControllerFolder .. appName .. ".app")
        hs.notify.new({ title = "open " .. appName, informativeText = "run it sucessfully" }):send()
    end)

    hs.timer.doAfter(4, function()
        -- enable it
        hs.eventtap.keyStroke({ "cmd" }, shortcut)
        hs.eventtap.keyStroke({ "cmd" }, "R")
        hs.eventtap.keyStroke({ "cmd" }, "M")
    end)
end
