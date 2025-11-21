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

function Check_And_Run_KegworksApp(appName)
    appName = appName:gsub(".app", "")
    appName = appName .. ".app"

    local app_name_prefix = "10_" .. appName
    local new_name = appName:gsub(" ", "_")
    local new_name_prefix = "10_" .. new_name

    hs.printf("%s = %s", "new_name_prefix:", new_name_prefix)

    if DoesDirectoryExist(KegworksGames .. app_name_prefix) then
        appName = app_name_prefix
    elseif DoesDirectoryExist(KegworksGames .. new_name) then
        appName = new_name
    elseif DoesDirectoryExist(KegworksGames .. new_name_prefix) then
        appName = new_name_prefix
    end

    hs.application.launchOrFocus(KegworksGames .. appName)
    hs.notify.new({ title = appName, informativeText = "run it sucessfully" }):send()
end
