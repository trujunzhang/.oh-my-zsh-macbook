-- export D3DM_ENABLE_METALFX=1
-- export ROSETTA_ADVERTISE_AVX=1
-- export D3DM_ENABLE_METALFX=1 ROSETTA_ADVERTISE_AVX=1
-- export D3DM_ENABLE_METALFX=1 ROSETTA_ADVERTISE_AVX=1
-- export D3DM_ENABLE_METALFX=1

function Play_Call_of_Duty_Modern_Warfare_Remastered()
    local app_name = "Call of Duty Modern Warfare Remastered"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Call of Duty Modern Warfare Remastered"
    -- title: "Run In Safe Mode"
    Close_Active_Window("Run In Safe Mode", "ok", 35)

    ActiveWindow(60)
end

function Play_UNCHARTED_LoT_Collection()
    local app_name = "UNCHARTED.LoT.Collection"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "UNCHARTED.LoT.Collection.app"
    -- title: "GPU Change"
    Close_Active_Window("GPU Change", "cancel", 55)

    -- app: "UNCHARTED.LoT.Collection.app(The lost legecy)"
    -- title: "GPU Change"
    -- Close_Active_Window("GPU Change", "cancel", 105)

    -- ActiveWindow(115)
    ActiveWindow(75)
end

function Play_Red_Dead_Redemption()
    local app_name = "Red Dead Redemption 2"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Red Dead Redemption 2"
    -- title: "Minimum Recommended Hardware Check Failure"
    Close_Active_Window("Minimum Recommended", "ok", 40)

    ActiveWindow(60)
end

function Play_The_Last_of_Us_Part_I()
    local app_name = "The Last of Us Part I"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(50)
end

function Play_The_Last_of_Us_Part_II()
    local app_name = "The Last of Us Part II"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "The Last of Us Part II"
    -- title: "The Last of Us™ Part II"
    Close_Active_Window("The Last of Us", "ok", 35, "false")
    Close_Active_Window("The Last of Us", "ok", 40, "true")

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

function Play_Crysis_3_Remasted()
    local app_name = "Crysis 3 Remasted"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(120)
end

function Play_Crysis_2_Remastered()
    local app_name = "Crysis_2_Remastered-FLT"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(60)
end

function Play_Metal_Gear_Solid()
    local app_name = "METAL GEAR SOLID Δ"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "METAL GEAR SOLID Δ"
    -- title: "Known issues with graphics driver"
    Close_Active_Window("Known issues with graphics driver", "cancel", 70)

    ActiveWindow(60)
end

function Play_Ghost_of_Tsushima()
    local app_name = "Ghost of Tsushima"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Ghost of Tsushima"
    -- title: "host of Tsushima DIRECTOR'S CUT"
    Close_Active_Window("host of Tsushima", "ok", 35, "false")
    Close_Active_Window("host of Tsushima", "ok", 40, "true")

    ActiveWindow(60)
end

function Play_Horizon_Zero_Dawn_Remastered()
    -- app: "Horizon Zero Dawn Remastered"
    -- export D3DM_ENABLE_METALFX=1
    -- local app_name = "Horizon Zero Dawn Remastered"
    local app_name = "Horizon Zero Dawn"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "Horizon Zero Dawn Remastered"
    -- title: "Horizon Zero Dawn™ Remastered",
    -- Close_Active_Window("Horizon Zero Dawn", "ok", 35, "true")

    ActiveWindow()
end

function Play_Just_Cause_4()
    local app_name = "Just Cause 4"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Assassins_Creed_4_Black_Flag()
    local app_name = "Assassins-Creed-IV-Black Flag"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Assassins_Creed_Rogue()
    local app_name = "Assassins-creed-rogue"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Assassins_Creed_Syndicate()
    -- Fix Graphical Flashing Issue
    -- Open AC.ini using a text editor.
    -- Change the value to:
    -- UserDriverWorkAround = 1

    local app_name = "Assassins Creed Syndicate"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Assassins_Creed_Origins()
    -- turn off aerospace
    -- app: "Assassins Creed Origins"
    -- TurnOffAerospace()

    local app_name = "Assassins Creed Origins"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Assassins_Creed_Mirage()
    -- export D3DM_ENABLE_METALFX=1
    -- export D3DM_ENABLE_METALFX=1
    local app_name = "Assassins Creed Mirage"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Batman_Arkham_Knight()
    local app_name = "Batman Arkham Knight"

    -- turn off aerospace
    -- app: "Batman Arkham Knight"
    TurnOffAerospace()

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Need_for_Speed_Heat()
    local app_name = "Need for Speed Heat"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(60)
end

function Play_Need_for_Speed_Payback()
    local app_name = "Need_for_Speed_Payback"

    -- turn off aerospace
    -- app: "Need_for_Speed_Payback"
    TurnOffAerospace()

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

-- export D3DM_ENABLE_METALFX=1
-- export D3DM_ENABLE_METALFX=1
function Play_SILENT_HILL_f()
    local app_name = "SILENT HILL f"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- app: "SILENT HILL f"
    -- title: "WARNING: Known issues with graphics driver"
    Close_Active_Window("Known issues with graphics driver", "cancel", 35)

    ActiveWindow(60)
end

function Play_Silent_Hill_2()
    -- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
    -- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11
    -- "C:\toxicgames.in\Silent-Hill-2\SILENT HILL 2\SHProto.exe" -dx11

    local app_name = "Silent Hill 2"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Expedition_33()
    local app_name = "Expedition 33"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow()
end

function Play_Grand_Theft_Auto_V()
    -- SetMacosVolume(5)

    local app_name = "Grand Theft Auto V"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(50)
end

function Play_Star_Wars_Jedi_Fallen_Order()
    local app_name = "Star Wars Jedi Fallen Order"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(50)
end

function Play_Warcraft_3_The_Frozen_Throne()
    -- "C:\Games\Warcraft 3\Warcraft III.exe" -nativefullscr
    -- "C:\Games\Warcraft 3\Warcraft III.exe" -nativefullscr
    -- "C:\Games\Warcraft 3\Warcraft III.exe" -nativefullscr -opengl
    -- "C:\Games\Warcraft 3\Warcraft III.exe" -nativefullscr -opengl

    local app_name = "Warcraft 3 The Frozen Throne"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    -- ActiveWindow(10)
end

function Play_Battlefield_V()
    local app_name = "Battlefield V"

    BeforePlayGame(function()
        Check_And_Run_KegworksApp(app_name)
    end)

    ActiveWindow(50)
end
