print("=================== load djzhang's config===============================")

require("applications.app_shutdown")
require("applications.app_sleep")
require("applications.app_custom_shortcuts")
require("applications.mac_apps_watch")

-- Create and start the watcher
local appMusicWatcher = hs.application.watcher.new(Macbook_PRO_Apps_Watcher)
appMusicWatcher:start()
