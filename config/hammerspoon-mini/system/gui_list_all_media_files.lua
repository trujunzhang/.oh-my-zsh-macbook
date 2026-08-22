local function focusLastFocused()
    local wf = hs.window.filter
    local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
    if #lastFocused > 0 then
        lastFocused[1]:focus()
    end
end

local chooser = nil

chooser = hs.chooser.new(function(choice)
    if not choice then
        focusLastFocused()
        return
    end
    hs.printf("%s = %s", "Choice subText:", choice["mediaFile"])

    local mediaFile = choice["mediaFile"]
    local mediaSrt = choice["mediaSrt"]

    if chooser ~= nil then
        chooser:hide()
    end

    hs.timer.doAfter(0.5, function()
        local shell_command = '"' .. GTotalVideoPlayerBinPath .. '" "file://' .. mediaFile .. '" '
        -- .. '--sub-language "中文 (繁體) -[Chinese]" '
        -- .. '--sub-language "中文（繁體）-「Chinesel" '
        -- .. '--sub-language=zh-TW '

        if mediaSrt ~= nil then
            shell_command = shell_command .. '--sub-file "' .. mediaSrt .. '" '
        end

        hs.printf("%s = %s", "shell command:", shell_command)
        hs.execute(shell_command)
    end)
end)

-- Set the height of the chooser to display 10 rows
chooser:rows(20)
chooser:placeholderText("Select a media file to play")
local myRed = { red = 1.0, green = 0.0, blue = 0.0, alpha = 0.5 }
-- chooser:subTextColor(hs.drawing.color.x11.blue)
-- chooser:subTextColor(myRed)

function Show_All_Media_Files_list_Chooser()
    local myArray = ListAllFilesInMediaFolder(GMediaFoldPath)

    chooser:choices(myArray)

    chooser:query("")
    chooser:show()
end

hs.hotkey.bind(GameHotkeyMods, "-", Show_All_Media_Files_list_Chooser)
