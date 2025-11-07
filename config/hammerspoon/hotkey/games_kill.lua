hs.hotkey.bind({ "Cmd", "Alt" }, "x", function()
    -- turn off aero
    local shell_command = "killall u4.exe"
    hs.execute(shell_command)

    local app_name = "UNCHARTED.LoT.Collection.app"
    hs.notify.new({ title = "kill the app: " .. app_name, informativeText = "run it sucessfully" }):send()
end)
