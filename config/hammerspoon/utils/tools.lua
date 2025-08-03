
function EscapeTab(tab)
    local myApp = hs.application.applicationsForBundleID('com.github.wez.wezterm')[1]

    hs.eventtap.keyStroke({ "Ctrl" }, tab, myApp)
    hs.eventtap.keyStroke({}, "escape")
end
