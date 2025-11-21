hs.hotkey.bind({ "Cmd", "Alt" }, "C", function()
    -- local app_name = "Mafia Definitive Edition"
    local app_name = "UNCHARTED.LoT.Collection"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "UNCHARTED.LoT.Collection.app"
    -- title: "GPU Change"
    Close_Active_Window("GPU Change", "cancel", 65)

    -- app: "UNCHARTED.LoT.Collection.app(The lost legecy)"
    -- title: "GPU Change"
    Close_Active_Window("GPU Change", "cancel", 105)

    ActiveWindow(115)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "E", function()
    -- local app_name = "Bioshock Infinite"
    -- local app_name = "Mass-Effect-Andromeda"
    -- local app_name = "Red Dead Redemption 2"
    local app_name = "The Last of Us Part II"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Red Dead Redemption 2"
    -- title: "Minimum Recommended Hardware Check Failure"
    -- Close_Active_Window("Minimum Recommended", "ok", 60)

    -- app: "The Last of Us Part II"
    -- title: "The Last of Us™ Part II"
    Close_Active_Window("The Last of Us", "ok", 20, "true")

    ActiveWindow(50)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "R", function()
    -- local app_name = "Titanfall2"
    local app_name = "Mafia II Definitive Edition"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "W", function()
    -- app: "The Witcher 3 Wild Hunt GOTY"
    HideLeftDock()

    -- local app_name = "The Witcher 3 Wild Hunt GOTY"
    -- local app_name = "Watch Dogs 2"
    local app_name = "Marvel Spider-Man Remastered"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Marvel Spider-Man Remastered"
    -- title: "Marvel's Spider-Man Remastered"
    Close_Active_Window("Spider-Man", "ok", 25, "true")

    -- app: "Marvel Spider-Man Remastered"
    -- title: "Marvel's Spider-Man Remastered"
    Close_Active_Window("Spider-Man", "ok", 35)

    ActiveWindow(60)
end)
