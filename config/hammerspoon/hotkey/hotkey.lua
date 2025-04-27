-- local hyper = { 'ctrl', 'cmd' }
local hyper = { 'alt', 'cmd' }

hs.hotkey.bind({ 'alt', "cmd" }, "G", hs.caffeinate.systemSleep)

function fancyNotify(t, m)
    hs.notify.new({ title = t, informativeText = m }):send()
end

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "F",
    function()
        local bluetoothDevice = "DualSense Wireless Controller"

        local deviceAddress = "90-b6-85-65-d4-5d"

        -- blueutil connect <device_mac_address>
        local shell_command = "/opt/homebrew/bin/blueutil --connect 90-b6-85-65-d4-5d"
        hs.execute(shell_command)

        hs.notify.new({ title = "connect PS5 bluetooth device", informativeText = "connect it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "A",
    function()
        local shell_command = os.getenv("HOME") .. "/.local/bin/aerospace enable toggle"
        hs.execute(shell_command)
        hs.notify.new({ title = "toggle Aerospace", informativeText = "toggle it sucessfully" }):send()
    end)


hs.hotkey.bind(
    { 'cmd' },
    "N",
    function()
        hs.application.launchOrFocus("Brave Browser Nightly")

        hs.timer.doAfter(0.3, function()
            local myApp = hs.application.applicationsForBundleID('com.brave.Browser.nightly')[1]
            hs.eventtap.leftClick(hs.mouse.getAbsolutePosition())
            hs.eventtap.keyStroke({ "" }, "space", myApp)
        end)

        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
            hs.window.focusedWindow():application():path(),
            hs.window.focusedWindow():application():name(),
            hs.keycodes.currentSourceID()))
    end)

local function directoryLaunchKeyRemap(mods, key, dir)
    local mods = mods or {}
    hs.hotkey.bind({ "space" }, "f", function()
        -- hs.hotkey.bind(mods, key, function()
        local shell_command = "open " .. dir
        hs.execute(shell_command)

        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
            hs.window.focusedWindow():application():path(),
            hs.window.focusedWindow():application():name(),
            hs.keycodes.currentSourceID()))
    end)
end

-- directoryLaunchKeyRemap({ "space" }, "F", os.getenv("HOME") .. "/Documents/Organizations")
-- directoryLaunchKeyRemap({ "space" }, "F", os.getenv("HOME") .. "/Documents/Organizations")


-- Minimize the active window when holding space and pressing 'm'
