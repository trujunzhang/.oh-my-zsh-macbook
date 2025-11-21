function Play_UNCHARTED_LoT_Collection()
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
end

function Play_Red_Dead_Redemption()
    -- local app_name = "Bioshock Infinite"
    -- local app_name = "Mass-Effect-Andromeda"
    local app_name = "Red Dead Redemption 2"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Red Dead Redemption 2"
    -- title: "Minimum Recommended Hardware Check Failure"
    Close_Active_Window("Minimum Recommended", "ok", 60)

    ActiveWindow(70)
end

function Play_The_Last_of_Us_Part_II()
    -- local app_name = "Bioshock Infinite"
    -- local app_name = "Mass-Effect-Andromeda"
    -- local app_name = "Red Dead Redemption 2"
    local app_name = "The Last of Us Part II"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "The Last of Us Part II"
    -- title: "The Last of Us™ Part II"
    Close_Active_Window("The Last of Us", "ok", 30, "true")

    ActiveWindow(50)
end

function Play_Mafia_II_Definitive_Edition()
    -- local app_name = "Titanfall2"
    local app_name = "Mafia II Definitive Edition"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Marvel_Spider_Man_Remastered()
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
end

function Play_The_Witcher_3_Wild_Hunt()
    -- app: "The Witcher 3 Wild Hunt GOTY"
    HideLeftDock()

    local app_name = "The Witcher 3 Wild Hunt GOTY"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(60)
end
