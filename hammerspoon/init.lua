--
-- @author Johannes Steudle
--
--
require "windows"

function reloadConfig()
  hs.reload()
  hs.alert.show("Config loaded")
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", reloadConfig)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

local wifiWatcher = nil
local homeSSID = "Mustermann5G"
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end
    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

-- create an usb watcher and look for known devices
local usbWatcher = nil
function usbDeviceCallback(data)
    if (data["productName"] == "dynadock U3.0") then
        if (data["eventType"] == "added") then
          hs.alert.show("dynadock U3.0 connected")
        elseif (data["eventType"] == "removed") then
          --  app = hs.appfinder.appFromName("ScanSnap Manager")
          --  app:kill()
          hs.alert.show("dynadock U3.0 disconnected")
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()


-- local bambooState = hs.menubar.new()

-- function parseResult(responseStatus, responseBody, responseHeader)
--   hs.pasteboard.setContents(responseBody)

-- end

-- function getServerPage()
--   -- fetch serverpage and extract branch state
--   hs.http.asyncGet("http://bsot-macsrv2.hi.de.bosch.com:8085/telemetry.action?filter=favourites", nil, parseResult)
-- end

-- if bambooState then
--   bambooState:setTitle("All clear")
--   bambooState:setClickCallback(getServerPage)
--   -- bambooState:setIcon() -- place small icon in hammerspoon folder
-- end

-- local caffeine = hs.menubar.new()
-- function setCaffeineDisplay(state)
--     if state then
--         caffeine:setTitle("AWAKE")
--     else
--         caffeine:setTitle("SLEEPY")
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end


