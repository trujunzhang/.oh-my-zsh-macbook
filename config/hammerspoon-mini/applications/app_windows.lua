function Mac_Apps_Watcher(appName, eventType, appObject)
    hs.printf("%s = %s", "app watcher:", appName)
    hs.printf("%s = %s", "app watcher<eventType>:", eventType)
    hs.printf("%s = %s", "app watcher<eventType>:", hs.application.watcher.launched)

    if appName == "Infuse" then
        if eventType == hs.application.watcher.launched then
            hs.timer.doAfter(1, function()
                hs.eventtap.keyStroke({ "Ctrl", "Cmd" }, "f")
                hs.notify.new({ title = "Fullscreen 'Infuse' app", informativeText = "run it sucessfully" }):send()
            end)
        end
    end

    if appName == "Music" then
        if eventType == hs.application.watcher.launched then
            hs.timer.doAfter(1, function()
                hs.execute("kill -9 $(ps aux | grep 'Music' | awk '{print $2}')")
                -- hs.execute("killall Music")
                hs.notify.new({ title = "killing Music app", informativeText = "run it sucessfully" }):send()
            end)
        end
    end
end
