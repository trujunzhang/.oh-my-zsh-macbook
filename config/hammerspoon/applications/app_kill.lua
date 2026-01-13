function Kill_App_Clashx()
    local app_name = "ClashX"
    hs.execute("killall " .. app_name)
    hs.notify.new({ title = "Killing the app: " .. app_name, informativeText = "killed it sucessfully" }):send()
end
