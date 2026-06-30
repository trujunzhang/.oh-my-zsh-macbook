function Kill_App_Clashx()
    local app_name = "ClashX"
    hs.execute("killall " .. app_name)
    hs.execute("pkill -f 'Clash Verge'")

    hs.execute("killall V2rayU")

    hs.execute("killall FlClash")

    hs.notify.new({ title = "Killing the app: " .. app_name, informativeText = "killed it sucessfully" }):send()
end
