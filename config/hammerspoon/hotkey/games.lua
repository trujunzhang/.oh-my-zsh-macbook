-- local GamesFolder = "/Volumes/MacGame/AppGames/Kegworks"
local GamesFolder = "/Volumes/MacGame/AppGames/"
local KegworksGames = GamesFolder .. 'Kegworks/'

-- Assassins-creed-three.app
-- 'Assassins Creed IV Black Flag.app'
-- Assassins-creed-rogue.app
-- Assassins-creed-unity.app
-- Cyberpunk.2077..app

local function activeWindow()
    hs.timer.doAfter(30, function()
        hs.eventtap.leftClick(hs.mouse.getAbsolutePosition())
        -- hs.notify.new({ title = "Active game window", informativeText = "click it sucessfully" }):send()
        hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
            hs.window.focusedWindow():application():name(),
            hs.window.focusedWindow():application():name(),
            hs.keycodes.currentSourceID()))
    end)
end

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "R",
    function()
        hs.application.launchOrFocus(GamesFolder .. "Resident Evil Village.app")
        hs.notify.new({ title = "Resident Evil Village.app", informativeText = "run it sucessfully" }):send()
    end)


hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "M",
    function()
        hs.application.launchOrFocus(GamesFolder .. "MetroExodus.app")
        hs.notify.new({ title = "MetroExodus.app", informativeText = "run it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "1",
    function()
        hs.application.launchOrFocus(GamesFolder .. "Shadow of the Tomb Raider.app")
        hs.notify.new({ title = "Shadow of the Tomb Raider.app", informativeText = "run it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "2",
    function()
        hs.application.launchOrFocus(GamesFolder .. "Rise of the Tomb Raide.app")
        hs.notify.new({ title = "Rise of the Tomb Raide.app", informativeText = "run it sucessfully" }):send()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "3",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-creed-three.app")
        hs.notify.new({ title = "Assassins-creed-three.app", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)


hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "4",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins Creed IV Black Flag.app")
        hs.notify.new({ title = "Assasins Creed - black flag", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "5",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-creed-rogue.app")
        hs.notify.new({ title = "Assassins-creed-rogue.app", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "6",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Assassins-creed-unity.app")
        hs.notify.new({ title = "Assassins-creed-unity.app", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)

hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "7",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Need-for-speed-payback.app")
        hs.notify.new({ title = "Need-for-speed-payback.app", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)


hs.hotkey.bind(
    { 'Cmd', 'Alt' },
    "C",
    function()
        hs.application.launchOrFocus(KegworksGames .. "Cyberpunk.2077..app")
        hs.notify.new({ title = "Cyberpunk.2077..app", informativeText = "run it sucessfully" }):send()

        activeWindow()
    end)
