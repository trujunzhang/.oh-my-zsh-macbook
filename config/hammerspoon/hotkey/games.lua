hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "R",
    function()
        -- local appPath = "/Volumes/MacGame/AppGames/Resident Evil Village.app"
        -- hs.application:open("/Volumes/MacGame/AppGames/Resident Evil Village.app")

        hs.application.launchOrFocus("Resident Evil Village.app")

        hs.notify.new({ title = "Resident Evil Village.app", informativeText = "run it sucessfully" }):send():release()
    end)


hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "M",
    function()
        -- local appPath = "/Volumes/MacGame/AppGames/MetroExodus.app"
        -- hs.application:open('/Volumes/MacGame/AppGames/MetroExodus.app')

        hs.application.launchOrFocus("MetroExodus.app")

        hs.notify.new({ title = "MetroExodus.app", informativeText = "run it sucessfully" }):send():release()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "1",
    function()
        -- local appPath = "/Volumes/MacGame/AppGames/MetroExodus.app"
        -- hs.application:open('/Volumes/MacGame/AppGames/MetroExodus.app')

        hs.application.launchOrFocus("Assassin's Creed Shadows.app")

        hs.notify.new({ title = "Assassin's Creed Shadows.app", informativeText = "run it sucessfully" }):send():release()
    end)



hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "4",
    function()
        -- hs.application:open("/Applications/CrossOver.app")

        hs.application.launchOrFocus("/Applications/CrossOver.app")
        -- hs.notify.new({ title = "CrossOver", informativeText = "run it sucessfully" }):send():release()

        hs.timer.doAfter(1.0, function()
            hs.application.launchOrFocus("AC4BFSP")

            hs.notify.new({ title = "Assasins Creed - black flag", informativeText = "run it sucessfully" }):send()
                :release()
        end)
    end)
