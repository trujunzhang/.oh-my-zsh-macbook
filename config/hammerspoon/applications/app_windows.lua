function Mac_Apps_Watcher(appName, eventType, appObject)
    -- hs.printf("%s = %s", "app watcher:", appName)

    if appName == "Music" then
        if eventType == hs.application.watcher.launched then
            -- Action to perform when Music launches
            hs.notify
                .new({ title = "Hammerspoon", informativeText = "Apple Music launched, launching helper app..." })
                :send()

            hs.timer.doAfter(3, function()
                hs.execute("killall Music")
                hs.notify.new({ title = "killing Music app", informativeText = "run it sucessfully" }):send()
            end)
            -- elseif eventType == hs.application.watcher.terminated then
            --     -- Action to perform when Music quits
            --     hs.notify
            --         .new({ title = "Hammerspoon", informativeText = "Apple Music terminated, killing helper app..." })
            --         :send()
        end
    end
end
