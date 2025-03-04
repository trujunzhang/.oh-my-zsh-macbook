local appPath = "three-apps"
local mobileTitle = "Android Emulator - genymotion:5554"

hs.hotkey.bind(
-- { 'Cmd', 'Shift' },
    { 'Cmd' },
    "A",
    function()
        -- local mobileApp = hs.application.applicationsForBundleID('NULL-APP-BUNDLE-ID')[1]
        -- local mobileApp = hs.application.find("Android Emulator")
        local mobileApp = hs.appfinder.appFromWindowTitle(mobileTitle)
        if mobileApp then
            mobileApp:kill()
        end

        local neovideApp = hs.application.applicationsForBundleID('com.neovide.neovide')[1]
        if neovideApp then
            neovideApp:kill()
        end

        hs.application.launchOrFocus("WezTerm")

        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({}, "escape")
            hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
            hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
            hs.eventtap.keyStrokes("z three-apps", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
            hs.eventtap.keyStrokes("nrstart", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
        end)

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({}, "escape")
            hs.eventtap.keyStroke({ "Ctrl" }, "W", myApp)
            hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
            hs.eventtap.keyStrokes("z three-apps", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
            hs.eventtap.keyStrokes("android_new_ieatta_genymotion", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
        end)

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({}, "escape")
            hs.eventtap.keyStroke({ "Ctrl" }, "E", myApp)
            hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
            hs.eventtap.keyStrokes("z three-apps", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
            hs.eventtap.keyStrokes("us", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
        end)

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
            hs.application.launchOrFocus("Neovide")
        end)

        hs.notify.new({ title = "run android", informativeText = "typing cmd on the WezTerm successfully" }):send()
            :release()
    end)

hs.hotkey.bind(
    { 'Cmd' },
    "B",
    function()
        -- local mobileApp = hs.appfinder.appFromWindowTitle("Android Emulator - genymotion:5554")
        local mobileApp = hs.appfinder.appFromWindowTitle(mobileTitle)
        if mobileApp then
            mobileApp:kill()
        end

        hs.notify.new({ title = "kill android", informativeText = "close it successfully" }):send()
            :release()
    end)
