hs.hotkey.bind({ "Cmd", "Alt" }, "x", function()
    hs.execute("pkill -f wine")

    -- close all games process
    hs.execute("killall u4.exe")
    hs.execute("killall wine64-preloader")
    hs.execute("killall h1_sp64_ship.exe")
    hs.execute("killall WatchDogs2.exe")
    hs.execute("killall HorizonZeroDawnRemastered.exe")
    hs.execute("killall GhostOfTsushima.exe")

    hs.execute("killall JustCause4.exe")

    -- hs.execute("killall ")
    -- hs.execute("killall ")
    -- hs.execute("killall ")
    -- hs.execute("killall ")

    -- ls -l /proc/*/exe 2>/dev/null | grep -E 'wine(64)?-preloader|wineserver' | perl -pe 's;^.*/proc/(\d+)/exe.*$;$1;g;' | xargs -n 1 kill

    -- hs.execute("kill -9 $(ps aux | grep 'Music' | awk '{print $2}')")

    -- kill -9 $(ps aux | grep -E 'wine(64)?-preloader|wineserver' | awk '{print $2}')

    local app_name = "UNCHARTED.LoT.Collection.app"
    hs.notify.new({ title = "killing the app: " .. app_name, informativeText = "killed it sucessfully" }):send()
end)
