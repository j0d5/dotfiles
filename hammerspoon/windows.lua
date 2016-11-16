-- move focused window to left half
hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- move focused window to right half
hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- set focused window to fullscreen
hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

function applyWindowLayout() -- default window layout
  local numberOfScreens = #hs.screen.allScreens()
  local left85 = {0.0, 0.0, 0.85, 1.0}
  local tweetbotLocation = {0.81, 0.535, 0.19, 0.2}

  for i = 1, numberOfScreens do
    hs.alert.show(hs.screen.allScreens()[i]:name())
  end

  if numberOfScreens == 3 then -- apply 3 screen layout
    local mainScreen = hs.screen.allScreens()[1]:name()
    local secondScreen = hs.screen.allScreens()[3]:name()
    local thirdScreen = hs.screen.allScreens()[2]:name()
    windowLayout = {
        {"Xcode",             nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Android Studio",    nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Affinity Designer", nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Affinity Photo",    nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"SourceTree",        nil,              secondScreen, left85,              nil, nil},
        {"Safari",            nil,              secondScreen, left85,              nil, nil},
        {"Firefox",           nil,              secondScreen, left85,              nil, nil},
        {"Mail",              nil,              thirdScreen,  hs.layout.maximized, nil, nil},
        {"Airmail",           nil,              thirdScreen,  hs.layout.maximized, nil, nil},
        {"Microsoft Outlook", nil,              thirdScreen,  hs.layout.maximized, nil, nil},
        {"Spotify",           nil,              secondScreen, hs.layout.maximized, nil, nil},
        {"iTunes",            "iTunes",         secondScreen, hs.layout.maximized, nil, nil},
        {"iTunes",            "MiniPlayer",     secondScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
        {"Microsoft Lync",    "Microsoft Lync", secondScreen, {0.85, 0, 0.15, 0.5}, nil, nil},
        {"Tweetbot",          nil,              secondScreen, tweetbotLocation,    nil, nil},
    }
  elseif numberOfScreens == 2 then -- apply 2 screen layout
    local mainScreen = hs.screen.allScreens()[1]:name()
    local secondScreen = hs.screen.allScreens()[2]:name()
    windowLayout = {
        {"Xcode",             nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Android Studio",    nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Affinity Designer", nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"Affinity Photo",    nil,              mainScreen,   hs.layout.maximized, nil, nil},
        {"SourceTree",        nil,              secondScreen, left85,              nil, nil},
        {"Safari",            nil,              secondScreen, left85,              nil, nil},
        {"Firefox",           nil,              secondScreen, left85,              nil, nil},
        {"Mail",              nil,              secondScreen, left85,              nil, nil},
        {"Airmail",           nil,              secondScreen, left85,              nil, nil},
        {"Microsoft Outlook", nil,              secondScreen, left85,              nil, nil},
        {"Spotify",           nil,              secondScreen, left85,              nil, nil},
        {"iTunes",            "iTunes",         secondScreen, left85,              nil, nil},
        {"iTunes",            "MiniPlayer",     secondScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
        {"Microsoft Lync",    "Microsoft Lync", secondScreen, {0.85, 0, 0.15, 0.5}, nil, nil},
        {"Tweetbot",          nil,              secondScreen, tweetbotLocation,    nil, nil},
    }
  else
    -- apply 1 screen layout
    local mainScreen = hs.screen.allScreens()[1]:name()
    windowLayout = {
        {"Xcode",        nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"Affinity Designer", nil,     mainScreen, hs.layout.maximized, nil, nil},
        {"Affinity Photo",    nil,     mainScreen, hs.layout.maximized, nil, nil},
        {"Sublime Text", nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"SourceTree",   nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"Safari",       nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"Firefox",      nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"Mail",         nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"Airmail",      nil,          mainScreen, hs.layout.maximized, nil, nil},
        {"iTunes",       "iTunes",     mainScreen, hs.layout.maximized, nil, nil},
        {"iTunes",       "MiniPlayer", mainScreen, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
        {"Tweetbot",     nil,          mainScreen, tweetbotLocation,    nil, nil},
    }
  end
  hs.layout.apply(windowLayout)
end
applyWindowLayout()
