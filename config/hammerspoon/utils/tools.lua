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

function SetMacosVolume(value)
    value = value or 13
    hs.execute("osascript -e 'set volume output volume " .. value .. "'")
    hs.notify.new({ title = "Setup MacOS Volume", informativeText = "to " .. value .. "%" }):send()
end

function SetMacosDefaultVolume()
    SetMacosVolume()
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
        return app_name_prefix
    elseif DoesDirectoryExist(KegworksGames .. dash_name_prefix) then
        return dash_name_prefix
    end

    return appName
end

function Check_And_Run_KegworksApp(appName)
    appName = appName:gsub(".app", "")
    appName = appName .. ".app"

    local currentName = appName
    local tmp1 = check_app_existed("10", appName)
    local tmp2 = check_app_existed("whiskey", appName)

    if DoesDirectoryExist(KegworksGames .. appName) then
        currentName = appName
    elseif DoesDirectoryExist(KegworksGames .. tmp1) then
        currentName = tmp1
    elseif DoesDirectoryExist(KegworksGames .. tmp2) then
        currentName = tmp2
    end

    hs.printf("%s = %s", "new_name_prefix:", currentName)

    hs.application.launchOrFocus(KegworksGames .. currentName)
    hs.notify.new({ title = currentName, informativeText = "run it sucessfully" }):send()
end
