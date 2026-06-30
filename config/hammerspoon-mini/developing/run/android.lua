local appPath = "three-apps"
local mobileTitle = "Android Emulator - genymotion:5554"
local appCMD = "android_new_ieatta_genymotion"

hs.hotkey.bind(
    -- { 'Cmd', 'Shift' },
    { "Cmd", "shift", "Ctrl" },
    "Y",
    function()
        -- local mobileApp = hs.application.applicationsForBundleID('NULL-APP-BUNDLE-ID')[1]
        -- local mobileApp = hs.application.find("Android Emulator")
        local mobileApp = hs.appfinder.appFromWindowTitle(mobileTitle)
        if mobileApp then
            mobileApp:kill()
        end

        local neovideApp = hs.application.applicationsForBundleID("com.neovide.neovide")[1]
        if neovideApp then
            neovideApp:kill()
        end

        hs.application.launchOrFocus(TerminalApp)

        local myApp = hs.application.applicationsForBundleID(TerminalAppID)[1]

        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes("nrstart", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "W", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes(appCMD, myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "E", myApp)
        hs.eventtap.keyStroke({ "Ctrl" }, "C", myApp)
        hs.eventtap.keyStrokes("z three-apps", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        hs.eventtap.keyStrokes("us", myApp)
        hs.eventtap.keyStroke({ "" }, "return", myApp)
        -- end)

        -- hs.timer.doAfter(0.3, function()
        hs.eventtap.keyStroke({ "Ctrl" }, "A", myApp)
        -- hs.application.launchOrFocus("Neovide")
        -- end)

        hs.notify.new({ title = "run android", informativeText = "typing cmd on the terminal successfully" }):send()
    end
)

hs.hotkey.bind(
    -- { 'Cmd', 'Alt' },
    { "Cmd", "shift", "Ctrl" },
    "X",
    function()
        -- local mobileApp = hs.appfinder.appFromWindowTitle("Android Emulator - genymotion:5554")
        local mobileApp = hs.appfinder.appFromWindowTitle(mobileTitle)
        if mobileApp then
            mobileApp:kill()
        end

        hs.notify.new({ title = "kill android", informativeText = "close it successfully" }):send()
    end
)
