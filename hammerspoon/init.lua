-- All the initialization is done here.
--
-- @author Johannes Steudle
--
require "windowLayout"
require "layoutHotkeys"

hs.window.animationDuration = 0
-- hs.window.setFrameCorrectness = 1

local function reloadConfig()
  hs.reload()
  hs.alert.show("Config loaded")
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", reloadConfig)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

local homeSSID = "Mustermann"
local lastSSID = hs.wifi.currentNetwork()

local function ssidChangedCallback()
  local newSSID = hs.wifi.currentNetwork()

  if newSSID == homeSSID and lastSSID ~= homeSSID then
    -- We just joined our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(25)
  elseif newSSID ~= homeSSID and lastSSID == homeSSID then
    -- We just departed our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(0)
  end
  lastSSID = newSSID
end

local wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

