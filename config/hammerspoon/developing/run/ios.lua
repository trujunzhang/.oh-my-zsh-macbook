local appPath = "three-apps"
local mobileID = "com.apple.iphonesimulator"

hs.hotkey.bind(
    { 'cmd' },
    "I",
    function()
        local mobileApp = hs.application.applicationsForBundleID(mobileID)[1]
        if mobileApp then
            mobileApp:kill()
        end

        local neovideApp = hs.application.applicationsForBundleID('com.neovide.neovide')[1]
        if neovideApp then
            neovideApp:kill()
        end

        hs.application.launchOrFocus("WezTerm")
        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]

        -- Tab 1
        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes("nrstart", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- Tab 2
        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "W", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes("ios_new_ieatta_iphone16plus", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- Tab 3
        -- hs.timer.doAfter(0.6, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "E", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes("us", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- hs.timer.doAfter(1.6, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
        -- hs.application.launchOrFocus("Neovide")
        -- end)

        hs.notify.new({ title = "run ios", informativeText = "typing cmd on the WezTerm successfully" }):send():release()
    end)

hs.hotkey.bind(
    { 'Cmd' },
    "P",
    function()
        -- local mobileApp = hs.appfinder.appFromWindowTitle("Android Emulator - genymotion:5554")
        -- local mobileApp = hs.appfinder.appFromWindowTitle(mobileTitle)
        local mobileApp = hs.application.applicationsForBundleID(mobileID)[1]
        if mobileApp then
            mobileApp:kill()
        end

        hs.notify.new({ title = "kill ios", informativeText = "close it successfully" }):send()
            :release()
    end)

function EscapeTab(tab)
    local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]

    hs.eventtap.keyStroke({ "Ctrl" }, tab, myApp)
    hs.eventtap.keyStroke({}, "escape")
end

hs.hotkey.bind(
    { 'Cmd' ,"shift", "Ctrl" },
    "C",
    function()
        hs.application.launchOrFocus("WezTerm")

        EscapeTab("A")
        EscapeTab("W")
        EscapeTab("E")
        EscapeTab("R")

        EscapeTab("F")
        EscapeTab("J")
        EscapeTab("K")
        EscapeTab("L")

        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]
        hs.eventtap.keyStroke({ "Ctrl" }, 'A', myApp)

        hs.notify.new({ title = "Escape all tabs", informativeText = "Run it successfully" }):send()
            :release()
    end)
