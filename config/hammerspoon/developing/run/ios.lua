local appPath = "three-apps"

hs.hotkey.bind(
    { 'cmd' },
    "I",
    function()
        local mobileApp = hs.application.applicationsForBundleID('com.apple.iphonesimulator')[1]
        mobileApp:kill()

        hs.application.launchOrFocus("WezTerm")

        local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
            hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
            hs.eventtap.keyStrokes("z three-apps", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
            hs.eventtap.keyStrokes("nrstart", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
        end)

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({ "Ctrl" }, "W", myApp)
            hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
            hs.eventtap.keyStrokes("z three-apps", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
            hs.eventtap.keyStrokes("ios_new_ieatta_iphone16plus", myApp)
            hs.eventtap.keyStroke({ "" }, "return", myApp)
        end)

        hs.timer.doAfter(0.3, function()
            hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
        end)

        hs.notify.new({ title = "run ios", informativeText = "typing cmd on the WezTerm successfully" }):send():release()
    end)
