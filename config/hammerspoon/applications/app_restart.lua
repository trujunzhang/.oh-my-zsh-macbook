function YesNoDialogBox(ActionFunc)
    test = hs.chooser.new(ActionFunc)
    test:rows(2)
    test:placeholderText("Are you sure? Want to reboot?")
    test:choices({
        { ["text"] = "Yes", ["subText"] = "", ["id"] = "yes" },
        { ["text"] = "No", ["subText"] = "", ["id"] = "no" },
    })
    test:show()
end
function RebootIfChoice(input)
    if input.id == "yes" then
        hs.alert("Your choice was: yes")
        hs.application.launchOrFocus("MacOS_Restart.app")
    else
        hs.alert("Your choice was: no")
    end
end

hs.hotkey.bind({ "ctrl", "cmd" }, "r", function()
    YesNoDialogBox(RebootIfChoice)
end)
