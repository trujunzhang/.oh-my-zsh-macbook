-- local GamesFolder = "/Volumes/MacGame/AppGames/Kegworks"
local GamesFolder = "/Volumes/MacGame/AppGames/"
local KegworksGames = GamesFolder .. "Kegworks/"

-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11

hs.hotkey.bind({ "Cmd", "Alt" }, "R", function()
    -- local app_name = "Titanfall2.app"
    local app_name = "Mafia II Definitive Edition.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "E", function()
    -- local app_name = "Bioshock Infinite.app"
    -- local app_name = "Mass-Effect-Andromeda.app"
    local app_name = "Red Dead Redemption 2.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    -- app: "Red Dead Redemption 2.app"
    -- title: "Minimum Recommended Hardware Check Failure"
    Close_Active_Window("Minimum Recommended")

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "W", function()
    -- hs.execute("defaults write com.apple.dock autohide -bool true && killall Dock")

    -- local app_name = "The Witcher 3 Wild Hunt GOTY.app"
    local app_name = "Watch Dogs 2.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    -- ActiveWindow(100)
    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "1", function()
    local app_name = "Red Dead Redemption 2.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "2", function()
    -- local app_name = "Crysis_2_Remastered-FLT.app"
    -- local app_name = "Watch Dogs 2.app"
    local app_name = "METAL GEAR SOLID Δ.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    -- app: "METAL GEAR SOLID Δ.app"
    -- title: "Known issues with graphics driver"
    Close_Active_Window("Known issues with graphics driver", "cancel", 40)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "3", function()
    -- local app_name = "Crysis 3 Remasted.app"
    local app_name = "UNCHARTED.LoT.Collection.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow(120)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "4", function()
    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-Creed-IV-Black Flag.app")
        hs.notify.new({ title = "Assasins Creed - black flag", informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "5", function()
    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-creed-rogue.app")
        hs.notify.new({ title = "Assassins-creed-rogue.app", informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "6", function()
    -- local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable toggle"
    -- hs.execute(shell_command)

    BeforePlayGame(function()
        -- hs.application.launchOrFocus(KegworksGames .. "Assassins.Creed.Origins-CPY.app")
        -- hs.notify.new({ title = "Assassins.Creed.Origins-CPY.app", informativeText = "run it sucessfully" }):send()

        hs.application.launchOrFocus(KegworksGames .. "Batman Arkham Knight.app")
        hs.notify.new({ title = "Batman Arkham Knight.app", informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "7", function()
    -- turn off aerospace
    local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable off"
    hs.execute(shell_command)

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. "Need_for_Speed_Payback.app")
        hs.notify.new({ title = "Need-for-speed-payback.app", informativeText = "run it sucessfully" }):send()
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "C", function()
    -- local app_name = "Mafia Definitive Edition.app"
    local app_name = "UNCHARTED.LoT.Collection.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    -- app: "UNCHARTED.LoT.Collection.app"
    -- title: "GPU Change"
    Close_Active_Window("GPU Change", "ok", 50)

    ActiveWindow(100)
end)
