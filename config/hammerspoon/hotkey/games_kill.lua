hs.hotkey.bind({ "Cmd", "Alt" }, "x", function()
    -- turn off aero
    hs.execute("killall u4.exe")
    hs.execute("killall wine64-preloader")
    hs.execute("killall h1_sp64_ship.exe")
    hs.execute("killall WatchDogs2.exe")
    hs.execute("killall HorizonZeroDawnRemastered.exe")
    hs.execute("killall GhostOfTsushima.exe")


    -- hs.execute("killall ")
    -- hs.execute("killall ")
    -- hs.execute("killall ")

    local app_name = "UNCHARTED.LoT.Collection.app"
    hs.notify.new({ title = "kill the app: " .. app_name, informativeText = "run it sucessfully" }):send()
end)
