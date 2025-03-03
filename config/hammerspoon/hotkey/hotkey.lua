-- local hyper = { 'ctrl', 'cmd' }
local hyper = { 'alt', 'cmd' }

hs.hotkey.bind({ 'alt', "cmd" }, "G", hs.caffeinate.systemSleep)

-- show front activated app infos
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
