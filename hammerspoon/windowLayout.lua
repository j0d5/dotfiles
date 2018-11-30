--
-- All the window layout stuff is done here.
--
-- @author Johannes Steudle
--

-- define all the known displays
local display4k = "U3277WB"
local displayInteral = "Color LCD"

function applyWindowLayout() -- default window layout
  local numberOfScreens = #hs.screen.allScreens()
  local screens = hs.screen.allScreens()

  local max = hs.layout.maximized
  local left85 = {0.0, 0.0, 0.85, 1.0}
  local tweetbotLocation = {0.81, 0.535, 0.19, 0.2}

  for i = 1, numberOfScreens do
    hs.alert.show(screens[i]:name())
  end

  if numberOfScreens == 3 then -- apply 3 screen layout
    local mainScreen = screens[1]:name()
    local secondScreen = screens[3]:name()
    local thirdScreen = screens[2]:name()

    windowLayout = {
      {"Xcode",             nil,              mainScreen,   max, nil, nil},
      {"Android Studio",    nil,              mainScreen,   max, nil, nil},
      {"Sourcetree",        nil,              secondScreen, left85,              nil, nil},
      {"Fork",              nil,              secondScreen, left85,              nil, nil},

      {"Safari",            nil,              secondScreen, left85,              nil, nil},
      {"Firefox",           nil,              secondScreen, left85,              nil, nil},
      {"Google Chrome",     nil,              secondScreen, left85,              nil, nil},

      {"Mail",              nil,              thirdScreen,  max, nil, nil},
      {"Microsoft Outlook", nil,              thirdScreen,  max, nil, nil},
      {"Microsoft Lync",    "Microsoft Lync", secondScreen, {0.85, 0, 0.15, 0.5}, nil, nil},
      {"Rocket.Chat+",      nil,              thirdScreen,  {0.25, 0.15, 0.75, 0.85}, nil, nil},

      {"iTunes",            "iTunes",         secondScreen, max, nil, nil},
      {"iTunes",            "MiniPlayer",     secondScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
      {"Spotify",           nil,              secondScreen, max, nil, nil},
      {"Affinity Designer", nil,              mainScreen,   max, nil, nil},
      {"Affinity Photo",    nil,              mainScreen,   max, nil, nil},
      {"Tweetbot",          nil,              secondScreen, tweetbotLocation,    nil, nil},
    }
  elseif numberOfScreens == 2 then -- apply 2 screen layout
    local mainScreen = screens[1]:name()
    local secondScreen = screens[2]:name()
    windowLayout = {
      {"Xcode",             nil,              mainScreen,   max, nil, nil},
      {"Android Studio",    nil,              mainScreen,   max, nil, nil},
      {"Sourcetree",        nil,              secondScreen, left85,              nil, nil},
      {"Fork",              nil,              secondScreen, left85,              nil, nil},

      {"Safari",            nil,              secondScreen, left85,              nil, nil},
      {"Firefox",           nil,              secondScreen, left85,              nil, nil},
      {"Google Chrome",     nil,              secondScreen, left85,              nil, nil},

      {"Mail",              nil,              secondScreen, left85,              nil, nil},
      {"Microsoft Outlook", nil,              secondScreen, left85,              nil, nil},
      {"Rocket.Chat+",      nil,              secondScreen, {0.25, 0.15, 0.75, 0.85}, nil, nil},
      {"Microsoft Lync",    "Microsoft Lync", secondScreen, {0.85, 0, 0.15, 0.5}, nil, nil},

      {"iTunes",            "iTunes",         secondScreen, left85,              nil, nil},
      {"iTunes",            "MiniPlayer",     secondScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
      {"Spotify",           nil,              secondScreen, left85,              nil, nil},
      {"Affinity Designer", nil,              mainScreen,   max, nil, nil},
      {"Affinity Photo",    nil,              mainScreen,   max, nil, nil},
      {"Tweetbot",          nil,              secondScreen, tweetbotLocation,    nil, nil},
    }
  else
    local mainScreen = screens[1]:name() -- apply 1 screen layout

    if mainScreen == display4k then
      hs.alert.show("Detected 4K Monitor, applying special layout")
      windowLayout = {
        {"Xcode",        nil,          mainScreen, max, nil, nil},
        {"Android Studio", nil,        mainScreen, max, nil, nil},
        {"Sublime Text", nil,          mainScreen, max, nil, nil},
        {"MacVim",       nil,          mainScreen, hs.layout.right50,   nil, nil},
        {"Sourcetree",   nil,          mainScreen, hs.layout.left50, nil, nil},
        {"Fork",         nil,          mainScreen, hs.layout.left50, nil, nil},

        {"Safari",       nil,          mainScreen, max, nil, nil},
        {"Firefox",      nil,          mainScreen, max, nil, nil},
        {"Google Chrome",nil,          mainScreen, max, nil, nil},

        {"Rocket.Chat+", nil,          mainScreen, {0.25, 0.15, 0.75, 0.85}, nil, nil},
        {"Microsoft Outlook", nil,     mainScreen, hs.layout.left50,    nil, nil},
        {"Mail",         nil,          mainScreen, hs.layout.left50,    nil, nil},

        {"iTunes",       "iTunes",     mainScreen, max, nil, nil},
        {"iTunes",       "MiniPlayer", mainScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
        {"Spotify",      nil,          mainScreen, hs.layout.left50,    nil, nil},
        {"Affinity Designer", nil,     mainScreen, max, nil, nil},
        {"Affinity Photo",    nil,     mainScreen, max, nil, nil},
        {"Tweetbot",     nil,          mainScreen, tweetbotLocation,    nil, nil},
      }
    else
      windowLayout = {
        {"Xcode",        nil,          mainScreen, max, nil, nil},
        {"Sublime Text", nil,          mainScreen, max, nil, nil},
        {"Sourcetree",   nil,          mainScreen, max, nil, nil},
        {"Fork",         nil,          mainScreen, max, nil, nil},

        {"Safari",       nil,          mainScreen, max, nil, nil},
        {"Firefox",      nil,          mainScreen, max, nil, nil},
        {"Google Chrome",nil,          mainScreen, max, nil, nil},

        {"Rocket.Chat+", nil,          mainScreen, {0.25, 0.15, 0.75, 0.85}, nil, nil},
        {"Microsoft Outlook", nil,     mainScreen, left85,              nil, nil},
        {"Mail",         nil,          mainScreen, max, nil, nil},

        {"iTunes",       "iTunes",     mainScreen, max, nil, nil},
        {"iTunes",       "MiniPlayer", mainScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
        {"Spotify",      nil,          mainScreen, max, nil, nil},
        {"Affinity Designer", nil,     mainScreen, max, nil, nil},
        {"Affinity Photo",    nil,     mainScreen, max, nil, nil},
        {"Tweetbot",     nil,          mainScreen, tweetbotLocation,    nil, nil},
      }
    end
  end
  hs.layout.apply(windowLayout)
end
applyWindowLayout()
