-- local hyper = { 'ctrl', 'cmd' }
local hyper = { "alt", "cmd" }

-- hs.hotkey.bind({ 'alt', "cmd" }, "G", hs.caffeinate.systemSleep)

function fancyNotify(t, m)
    hs.notify.new({ title = t, informativeText = m }):send()
end

-- hs.hotkey.bind(
--     { 'Cmd', 'Alt' },
--     "F",
--     function()
--         local bluetoothDevice = "DualSense Wireless Controller"
--
--         local deviceAddress = "90-b6-85-65-d4-5d"
--
--         -- blueutil connect <device_mac_address>
--         local shell_command = "/opt/homebrew/bin/blueutil --connect 90-b6-85-65-d4-5d"
--         hs.execute(shell_command)
--
--         hs.notify.new({ title = "connect PS5 bluetooth device", informativeText = "connect it sucessfully" }):send()
--     end)
