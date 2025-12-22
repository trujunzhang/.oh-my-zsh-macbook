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
end)

local menus = {
    {
        ["text"] = "Browser\n",
        ["subText"] = "I used these browsers",
    },
    {
        ["text"] = "Device\n",
        ["subText"] = "I used these devices",
    },
}

chooser:choices(menus)
hs.hotkey.bind(GameHotkeyMods, "9", function()
    chooser:show()
end)
