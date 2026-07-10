function Macbook_PRO_Apps_Watcher(appName, eventType, appObject)
    hs.printf("%s = %s", "app watcher:", appName)
    hs.printf("%s = %s", "app watcher<eventType>:", eventType)
    hs.printf("%s = %s", "app watcher<eventType>:", hs.application.watcher.launched)

    if appName == "UPDF" then
        if eventType == hs.application.watcher.launched then
            -- Action to perform when Music launches
            -- hs.notify
            --  .new({ title = "Hammerspoon", informativeText = "APP UPDF launched, launching helper app..." })
            -- :send()

            hs.timer.doAfter(3, function()
                hs.eventtap.keyStroke({ "fn" }, "f")
                hs.notify.new({ title = "Fullscreen 'UPDF' app", informativeText = "run it sucessfully" }):send()
            end)
        end
    end
end
