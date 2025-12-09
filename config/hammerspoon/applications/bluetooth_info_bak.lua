function GxxxetBluetoothBattery()
    local info = hs.battery.otherBatteryInfo() -- Gets info for connected BT devices
    local report = "Bluetooth Batteries:\n"
    local found = false

    if info then
        for deviceName, details in pairs(info) do
            hs.printf("%s = %s", "bluetooth info:", deviceName)
            found = true
            report = report .. string.format(" - %s:\n", deviceName)
            if details.batteryPercentLeft then
                report = report .. string.format("    Left: %d%%", details.batteryPercentLeft)
                if details.leftInEar == "YES" then
                    report = report .. " (In Ear)"
                end
                report = report .. "\n"
            end
            if details.batteryPercentRight then
                report = report .. string.format("    Right: %d%%", details.batteryPercentRight)
                if details.rightInEar == "YES" then
                    report = report .. " (In Ear)"
                end
                report = report .. "\n"
            end
            if details.batteryPercent and not details.batteryPercentLeft then
                -- For single battery devices
                report = report .. string.format("    Battery: %d%%\n", details.batteryPercent)
            end
            -- Add case info for AirPods
            if details.casePercent then
                report = report .. string.format("    Case: %d%%\n", details.casePercent)
            end
        end
    end

    if not found then
        report = "No Bluetooth devices with battery info found."
    end

    return report
end

-- Example usage: Display in Notification Center
function SxxxhowBatteryNotification()
    local batteryText = GetBluetoothBattery()
    hs.notify.show("Bluetooth Battery Status", "", batteryText)
end

-- Example usage: Add to the menu bar (uncomment to use)
-- function menuBarBattery()
--     local info = hs.battery.otherBatteryInfo()
--     local menuItems = {}
--     if info then
--         for deviceName, details in pairs(info) do
--             local submenu = {}
--             if details.batteryPercentLeft then
--                 table.insert(submenu, hs.menuitem.new(string.format("Left: %d%%", details.batteryPercentLeft), nil, nil))
--             end
--             if details.batteryPercentRight then
--                 table.insert(submenu, hs.menuitem.new(string.format("Right: %d%%", details.batteryPercentRight), nil, nil))
--             end
--             if details.casePercent then
--                 table.insert(submenu, hs.menuitem.new(string.format("Case: %d%%", details.casePercent), nil, nil))
--             end
--             table.insert(menuItems, hs.menuitem.new(deviceName, nil, submenu))
--         end
--     end
--     local menu = hs.menubar.new("BT Battery", nil, menuItems)
--     menu:setTitle("🔋") -- You can use an emoji or text
--     return menu
-- end
-- menuBarBattery()

-- Trigger the notification on a hotkey (e.g., Ctrl+Alt+B)
-- hs.hotkey.bind(GameHotkeyMods, "b", ShowBatteryNotification)

-- Or just log it to the Console for testing
-- hs.alert.show(getBluetoothBattery())
