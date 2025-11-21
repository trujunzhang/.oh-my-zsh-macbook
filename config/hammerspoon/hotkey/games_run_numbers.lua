-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
-- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11

hs.hotkey.bind({ "Cmd", "Alt" }, "1", function()
    local app_name = "Crysis 3 Remasted"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(120)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "2", function()
    -- local app_name = "Crysis_2_Remastered-FLT"
    -- local app_name = "Watch Dogs 2"
    -- local app_name = "METAL GEAR SOLID Δ"
    local app_name = "Ghost of Tsushima.app"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "METAL GEAR SOLID Δ"
    -- title: "Known issues with graphics driver"
    -- Close_Active_Window("Known issues with graphics driver", "cancel", 70)

    -- app: "Ghost of Tsushima"
    -- title: "host of Tsushima DIRECTOR'S CUT"
    Close_Active_Window("host of Tsushima", "ok", 35, "true")

    ActiveWindow(60)
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "3", function()
    -- local app_name = "Horizon Zero Dawn Remastered"
    local app_name = "Just Cause 4"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Horizon Zero Dawn Remastered"
    -- title: "Horizon Zero Dawn™ Remastered",
    -- Close_Active_Window("Horizon Zero Dawn", "ok", 35, "true")

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "4", function()
    local app_name = "Assassins-Creed-IV-Black Flag"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "5", function()
    local app_name = "Assassins-creed-rogue"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "6", function()
    -- local app_name = "Batman Arkham Knight"
    local app_name = "Assassins.Creed.Origins-CPY"

    -- turn off aerospace
    -- app: "Batman Arkham Knight"
    -- TurnOffAerospace()

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end)

hs.hotkey.bind({ "Cmd", "Alt" }, "7", function()
    local app_name = "Need_for_Speed_Payback"

    -- turn off aerospace
    -- app: "Need_for_Speed_Payback"
    TurnOffAerospace()

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end)
