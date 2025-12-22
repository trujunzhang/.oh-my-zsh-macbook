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
    {
        ["text"] = "Horizon Zero Dawn",
        ["tag"] = "Horizon-Zero-Dawn",
    },
    {
        ["text"] = "Red Dead Redemption 2",
        ["tag"] = "Red-Dead-Redemption-2",
    },
    -- {
    --     ["text"] = "The Last of Us Part I",
    --     ["tag"] = "The-Last-of-Us-Part-I",
    -- },
    -- {
    --     ["text"] = "The Last of Us Part II",
    --     ["tag"] = "The-Last-of-Us-Part-II",
    -- },
    {
        ["text"] = "Marvel Spider-Man Remastered",
        ["tag"] = "Marvel-Spider-Man-Remastered",
    },
    {
        ["text"] = "Ghost of Tsushima",
        ["tag"] = "Ghost-of-Tsushima",
    },
    {
        ["text"] = "Just Cause 4",
        ["tag"] = "Just-Cause-4",
    },
    {
        ["text"] = "Assassins-Creed-IV-Black Flag",
        ["tag"] = "Assassins-Creed-IV-Black-Flag",
    },
    {
        ["text"] = "Assassins-creed-rogue",
        ["tag"] = "Assassins-creed-rogue",
    },
    {
        ["text"] = "Assassins Creed Syndicate",
        ["tag"] = "Assassins-Creed-Syndicate",
    },
    -- {
    --     ["text"] = "Assassins Creed Origins",
    --     ["tag"] = "Assassins-Creed-Origins",
    -- },
    {
        ["text"] = "Assassins Creed Mirage",
        ["tag"] = "Assassins-Creed-Mirage",
    },
    {
        ["text"] = "Need for Speed Heat",
        ["tag"] = "Need-for-Speed-Heat",
    },
    -- {
    --     ["text"] = "Need_for_Speed_Payback",
    --     ["tag"] = "Need-for-Speed-Payback",
    -- },
    {
        ["text"] = "Silent Hill 2",
        ["tag"] = "Silent-Hill-2",
    },
    {
        ["text"] = "Grand Theft Auto V",
        ["tag"] = "Grand-Theft-Auto-V",
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
}

chooser:choices(menus)
hs.hotkey.bind(GameHotkeyMods, "9", function()
    chooser:show()
end)
