hs.hotkey.bind({ "cmd" }, "L", function()
    ok, result = hs.osascript.applescript([[
              do shell script "pmset displaysleepnow"
            ]])
end)

hs.hotkey.bind({ "cmd" }, "K", function()
    ok, result = hs.osascript.applescript([[
              tell application "System Events" to sleep
            ]])
end)
