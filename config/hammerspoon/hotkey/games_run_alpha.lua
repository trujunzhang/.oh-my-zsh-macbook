hs.hotkey.bind({ "Cmd", "Alt" }, "C", function()
    -- local app_name = "Mafia Definitive Edition.app"
    local app_name = "UNCHARTED.LoT.Collection.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

    -- app: "UNCHARTED.LoT.Collection.app"
    -- title: "GPU Change"
    Close_Active_Window("GPU Change", "cancel", 75)

    ActiveWindow(90)
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
    Close_Active_Window("Minimum Recommended", "ok", 60)

    ActiveWindow(80)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "R", function()
    -- local app_name = "Titanfall2.app"
    local app_name = "Mafia II Definitive Edition.app"

    BeforePlayGame(function()
        hs.application.launchOrFocus(KegworksGames .. app_name)
        hs.notify.new({ title = app_name, informativeText = "run it sucessfully" }):send()
    end)

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
