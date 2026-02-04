function EscapeTab(tab)
    local myApp = hs.application.applicationsForBundleID(TerminalAppID)[1]

    hs.eventtap.keyStroke({ "Ctrl" }, tab, myApp)
    hs.eventtap.keyStroke({}, "escape")
end

function ClickActiveWindow(focusedWindow, offsetX, offsetY)
    offsetX = offsetX or 0
    offsetY = offsetY or 0
    local windowFrame = focusedWindow:frame()

    local x = windowFrame.x
    local y = windowFrame.y
    local width = windowFrame.w
    local height = windowFrame.h

    local centerX = x + width / 2
    local centerY = y + height / 2

    local position = { x = centerX - offsetX, y = centerY - offsetY }

    hs.eventtap.leftClick(position)
end

function ClickPrimaryScreenCenter(offsetX, offsetY)
    offsetX = offsetX or 0
    offsetY = offsetY or 0

    local primaryScreen = hs.screen.primaryScreen()
    local fullFrame = primaryScreen:fullFrame()
    -- print("Primary screen full frame: " .. hs.inspect(fullFrame))

    local windowFrame = fullFrame

    local x = windowFrame.x
    local y = windowFrame.y
    local width = windowFrame.w
    local height = windowFrame.h

    local centerX = x + width / 2
    local centerY = y + height / 2

    local position = { x = centerX - offsetX, y = centerY - offsetY }

    hs.eventtap.leftClick(position)
end

function SetMacosVolume(value)
    value = value or 13
    hs.execute("osascript -e 'set volume output volume " .. value .. "'")
    hs.notify.new({ title = "Setup MacOS Volume", informativeText = "to " .. value .. "%" }):send()
end

function SetMacosDefaultVolume()
    if GMacCurrentVolume == 0 then
        GMacCurrentVolume = 13
    else
        GMacCurrentVolume = 0
    end
    SetMacosVolume(GMacCurrentVolume)
end

function TurnOffAerospace()
    local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable off"
    hs.execute(shell_command)
end

function HideLeftDock()
    hs.execute("defaults write com.apple.dock autohide -bool true && killall Dock")
end

function DoesDirectoryExist(path)
    local attr = hs.fs.attributes(path)
    return attr and attr.mode == "directory"
end

local function check_app_existed(prefix, appName)
    local app_name_prefix = prefix .. "_" .. appName
    local dash_name_prefix = prefix .. "_" .. appName:gsub(" ", "_")

    if DoesDirectoryExist(KegworksGames .. app_name_prefix) then
        GCurrentGameName = app_name_prefix
    elseif DoesDirectoryExist(KegworksGames .. dash_name_prefix) then
        GCurrentGameName = dash_name_prefix
    elseif DoesDirectoryExist(KegworksGames .. "p_" .. dash_name_prefix) then
        GCurrentGameName = "p_" .. dash_name_prefix
    -- for dxmt
    elseif DoesDirectoryExist(KegworksGames .. "mt_" .. dash_name_prefix) then
        GCurrentGameName = "mt_" .. dash_name_prefix
    elseif DoesDirectoryExist(KegworksGames .. "p_mt_" .. dash_name_prefix) then
        GCurrentGameName = "p_mt_" .. dash_name_prefix
    end
end

function Check_And_Run_KegworksApp(appName)
    appName = appName:gsub(".app", "")
    appName = appName .. ".app"

    GCurrentGameName = appName

    check_app_existed("10", appName)
    check_app_existed("whiskey", appName)
    check_app_existed("103", appName)
    check_app_existed("108103", appName)
    check_app_existed("2477", appName)

    hs.printf("%s = %s", "GCurrentGameName:", GCurrentGameName)

    if DoesDirectoryExist(KegworksGames .. GCurrentGameName) then
        hs.application.launchOrFocus(KegworksGames .. GCurrentGameName)
        hs.notify.new({ title = GCurrentGameName, informativeText = "run it sucessfully" }):send()
    else
        hs.notify.new({ title = GCurrentGameName .. " not found", informativeText = "run it failed" }):send()
    end
end

function Is_WindowActive(windowTitle)
    local focused = hs.window.focusedWindow()
    hs.printf("%s = %s", "focused window title:", focused:title())
    if focused and CheckContainSubString(focused:title(), windowTitle) then
        return true
    else
        return false
    end
end
