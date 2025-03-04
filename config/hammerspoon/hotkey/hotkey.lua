-- local hyper = { 'ctrl', 'cmd' }
local hyper = { 'alt', 'cmd' }

hs.hotkey.bind({ 'alt', "cmd" }, "G", hs.caffeinate.systemSleep)

function fancyNotify(t, m)
    hs.notify.new({ title = t, informativeText = m }):send():release()
end

-- show front activated app infos
-- hs.hotkey.bind({"space", "s"}, function()
hs.hotkey.bind(
    { 'cmd' },
    "N",
    function()
        hs.application.launchOrFocus("Brave Browser Nightly")

        hs.timer.doAfter(0.3, function()
            local myApp = hs.application.applicationsForBundleID('com.brave.Browser.nightly')[1]
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
