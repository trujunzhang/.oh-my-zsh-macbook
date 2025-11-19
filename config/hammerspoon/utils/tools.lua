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
