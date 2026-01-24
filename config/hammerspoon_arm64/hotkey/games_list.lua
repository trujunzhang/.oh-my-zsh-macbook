-- Source - https://stackoverflow.com/a
-- Posted by moh17
-- Retrieved 2025-12-22, License - CC BY-SA 4.0

-- Focus the last used window.

local function focusLastFocused()
    local wf = hs.window.filter
    local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
    if #lastFocused > 0 then
        lastFocused[1]:focus()
    end
end
-- On selection, copy the text and type it into the focused application.

local chooser = hs.chooser.new(function(choice)
    if not choice then
        focusLastFocused()
        return
    end
    hs.printf("%s = %s", "Choice subText:", choice["subText"])

    local tag = choice["tag"]

    if tag == "Horizon-Zero-Dawn" then
        Play_Horizon_Zero_Dawn_Remastered()
    elseif tag == "Red-Dead-Redemption-2" then
        Play_Red_Dead_Redemption()
    elseif tag == "The-Last-of-Us-Part-I" then
        Play_The_Last_of_Us_Part_I()
    elseif tag == "The-Last-of-Us-Part-II" then
        Play_The_Last_of_Us_Part_II()
    elseif tag == "Marvel-Spider-Man-Remastered" then
        Play_Marvel_Spider_Man_Remastered()
    elseif tag == "Ghost-of-Tsushima" then
        Play_Ghost_of_Tsushima()
    elseif tag == "Just-Cause-4" then
        Play_Just_Cause_4()
    elseif tag == "Assassins-Creed-IV-Black-Flag" then
        Play_Assassins_Creed_4_Black_Flag()
    elseif tag == "Assassins-creed-rogue" then
        Play_Assassins_Creed_Rogue()
    elseif tag == "Assassins-Creed-Syndicate" then
        Play_Assassins_Creed_Syndicate()
    elseif tag == "Assassins-Creed-Origins" then
        Play_Assassins_Creed_Origins()
    elseif tag == "Assassins-Creed-Mirage" then
        Play_Assassins_Creed_Mirage()
    elseif tag == "Need-for-Speed-Heat" then
        Play_Need_for_Speed_Heat()
    elseif tag == "Need-for-Speed-Payback" then
        Play_Need_for_Speed_Payback()
    elseif tag == "Silent-Hill-2" then
        Play_Silent_Hill_2()
    elseif tag == "Grand-Theft-Auto-V" then
        Play_Grand_Theft_Auto_V()
    elseif tag == "Star-Wars-Jedi-Fallen-Order" then
        Play_Star_Wars_Jedi_Fallen_Order()
    elseif tag == "Warcraft-3-The-Frozen-Throne" then
        Play_Warcraft_3_The_Frozen_Throne()
    elseif tag == "Battlefield_V" then
        Play_Battlefield_V()
    elseif tag == "Sniper-Elite-4" then
        Play_Sniper_Elite_4()
    elseif tag == "Alone-in-the-Dark" then
        Play_Alone_in_the_Dark()
    elseif tag == "Kingdom-Come-Deliverance" then
        Play_Kingdom_Come_Deliverance()
    elseif tag == "Assassin-Creed-Brotherhood" then
        Play_Assassin_Creed_Brotherhood()
    elseif tag == "Assassins-Creed-Unity" then
        Play_Assassins_Creed_Unity()
    elseif tag == "Crysis-3-Remasted" then
        Play_Crysis_3_Remasted()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    -- elseif tag == "" then
    --     Play_Horizon_Zero_Dawn_Remastered()
    else
        -- print("Default choice")
    end
end)

local menus = {
    -- {
    --     ["text"] = "Star Wars Jedi Fallen Order(-F)",
    --     ["tag"] = "Star-Wars-Jedi-Fallen-Order",
    -- },
    {
        ["text"] = "Horizon Zero Dawn(-D)",
        ["tag"] = "Horizon-Zero-Dawn",
    },
    -- {
    --     ["text"] = "Red Dead Redemption 2(-R)",
    --     ["tag"] = "Red-Dead-Redemption-2",
    -- },
    -- {
    --     ["text"] = "The Last of Us Part I(-)",
    --     ["tag"] = "The-Last-of-Us-Part-I",
    -- },
    -- {
    --     ["text"] = "The Last of Us Part II(-)",
    --     ["tag"] = "The-Last-of-Us-Part-II",
    -- },
    -- {
    --     ["text"] = "Marvel Spider-Man Remastered(-S)",
    --     ["tag"] = "Marvel-Spider-Man-Remastered",
    -- },
    {
        ["text"] = "Ghost of Tsushima(-T)",
        ["tag"] = "Ghost-of-Tsushima",
    },
    -- {
    --     ["text"] = "Just Cause 4(-J)",
    --     ["tag"] = "Just-Cause-4",
    -- },
    {
        ["text"] = "Assassin Creed Brotherhood(-B)",
        ["tag"] = "Assassin-Creed-Brotherhood",
    },
    {
        ["text"] = "Assassins-Creed-IV-Black Flag(-4)",
        ["tag"] = "Assassins-Creed-IV-Black-Flag",
    },
    {
        ["text"] = "Assassins-creed-rogue(-5)",
        ["tag"] = "Assassins-creed-rogue",
    },
    {
        ["text"] = "Assassins Creed Unity(-U)",
        ["tag"] = "Assassins-Creed-Unity",
    },
    -- {
    --     ["text"] = "Assassins Creed Syndicate(-A)",
    --     ["tag"] = "Assassins-Creed-Syndicate",
    -- },
    -- {
    --     ["text"] = "Assassins Creed Origins(-)",
    --     ["tag"] = "Assassins-Creed-Origins",
    -- },
    -- {
    --     ["text"] = "Assassins Creed Mirage(-C)",
    --     ["tag"] = "Assassins-Creed-Mirage",
    -- },
    {
        ["text"] = "Need for Speed Heat(-3)",
        ["tag"] = "Need-for-Speed-Heat",
    },
    -- {
    --     ["text"] = "Need_for_Speed_Payback(-)",
    --     ["tag"] = "Need-for-Speed-Payback",
    -- },
    -- {
    --     ["text"] = "Silent Hill 2(-S)",
    --     ["tag"] = "Silent-Hill-2",
    -- },
    {
        ["text"] = "Grand Theft Auto V(-G)",
        ["tag"] = "Grand-Theft-Auto-V",
    },
    {
        ["text"] = "Warcraft 3 The Frozen Throne(-W)",
        ["tag"] = "Warcraft-3-The-Frozen-Throne",
    },
    {
        ["text"] = "Battlefield V(-V)",
        ["tag"] = "Battlefield_V",
    },
    {
        ["text"] = "Sniper Elite 4(-E)",
        ["tag"] = "Sniper-Elite-4",
    },
    -- {
    --     ["text"] = "Alone in the Dark(-A)",
    --     ["tag"] = "Alone-in-the-Dark",
    -- },
    {
        ["text"] = "Kingdom Come Deliverance(-K)",
        ["tag"] = "Kingdom-Come-Deliverance",
    },
    {
        ["text"] = "Crysis 3 Remasted(-C)",
        ["tag"] = "Crysis-3-Remasted",
    },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
    -- {
    --     ["text"] = "",
    --     ["tag"] = "",
    -- },
}

chooser:choices(menus)

-- Set the height of the chooser to display 10 rows
chooser:rows(20)

chooser:placeholderText("Select a game")

local function Show_Games_list_Chooser()
    chooser:query("")
    chooser:show()
end

hs.hotkey.bind(GameHotkeyMods, "-", Show_Games_list_Chooser)
hs.hotkey.bind(GameHotkeyMods, "=", Show_Games_list_Chooser)
