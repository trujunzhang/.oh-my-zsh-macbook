function YesNoDialogBox(ActionFunc)
    test = hs.chooser.new(ActionFunc)
    test:rows(2)
    test:placeholderText("Are you sure? Want to reboot?")
    test:choices({
        { ["text"] = "Yes", ["subText"] = "", ["id"] = "yes" },
        { ["text"] = "No", ["subText"] = "", ["id"] = "no" },
        { ["text"] = "ShutDown", ["subText"] = "", ["id"] = "shutdown" },
    })
    test:show()
end
function RebootIfChoice(input)
    if input.id == "yes" then
        ok, result = hs.osascript.applescript([[
            tell application "System Events" 
                 restart with state saving preference 
            end tell
            ]])
        hs.alert.show("Rebooting..." .. result)
    elseif input.id == "no" then
        hs.alert("Your choice was: no")
    elseif input.id == "shutdown" then
        ok, result = hs.osascript.applescript([[
            tell application "System Events" 
                 shut down with state saving preference 
            end tell
            ]])
        hs.alert.show("Shutting down..." .. result)
    end
end

hs.hotkey.bind({ "ctrl", "cmd" }, "r", function()
    YesNoDialogBox(RebootIfChoice)
end)
