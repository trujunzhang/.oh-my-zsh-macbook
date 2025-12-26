function Show_Bluetooth_PS5_Battery_Info()
    hs.eventtap.keyStroke({ "CMD", "ALT" }, "G")

    hs.timer.doAfter(3, function()
        hs.eventtap.keyStroke({ "CMD", "ALT" }, "H")
    end)

    hs.timer.doAfter(5, function()
        hs.eventtap.keyStroke({}, "A")
        hs.eventtap.keyStroke({}, "G")
        hs.notify.new({ title = "Show PS5 Battery Info", informativeText = "run it sucessfully" }):send()
    end)
end
