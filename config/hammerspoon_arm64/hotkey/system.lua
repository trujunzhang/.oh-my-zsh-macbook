local function muteOnWake(eventType)
    if eventType == hs.caffeinate.watcher.systemDidWake then
        -- local output = hs.audiodevice.defaultOutputDevice()
        -- output:setMuted(true)
        -- hs.logger.new('wanghao log', 'info')
        -- hs.eventtap.keyStroke({ "" }, "space")
    end
end

-- caffeinateWatcher = hs.caffeinate.watcher.new(muteOnWake)
-- caffeinateWatcher:start()

hs.hotkey.bind(
    -- { 'Cmd', 'Alt' },
    { "Cmd", "Alt", "Ctrl" },
    "K",
    function()
        -- hs.eventtap.keyStroke({ "" }, "space")
        -- hs.inspect(hs.keycodes.map)
        local keycodes = hs.keycodes.map
        -- for k, v in pairs(hs.keycodes.map) do
        --     hs.printf("%s = %s", tostring(k), tostring(v))
        -- end
        for k, v in pairs(hs.keycodes.map) do
            if type(k) == "string" then
                hs.printf("string, %s = %s", tostring(k), tostring(v))
            else
                hs.printf("other,  %s = %s", tostring(k), tostring(v))
            end
        end

        hs.printf("%s = %s", "wanghao key:", keycodes.underscore)

        -- keycodes[1] == "s"
        -- 94 = underscore
        -- 102 = eisu
        -- 104 = kana
        --
        -- hs.eventtap.keyStroke({ "" }, keycodes[104])
        -- hs.eventtap.event.newKeyEvent(hs.keycodes.map[104], true):post()
        -- hs.eventtap.event.newKeyEvent({}, hs.keycodes.map.kana, true):post()
        hs.notify.new({ title = "toggle Aerospace", informativeText = "toggle it sucessfully" }):send()
    end
)
