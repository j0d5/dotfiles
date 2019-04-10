--
-- All the window layout stuff is done here.
--
-- @author Johannes Steudle
--

-- define all the known displays
local display4k = "U3277WB"
local display4kHome = "U28E590"
local displayInternal = "Color LCD"

local function applyWindowLayout() -- default window layout
  local numberOfScreens = #hs.screen.allScreens()
  local screens = hs.screen.allScreens()
  local windowLayout

  local max = hs.layout.maximized
  local left85  = {0.0, 0.0, 0.85, 1.0}
  local right50 = hs.layout.right50
  local left50  = hs.layout.left50

  for i = 1, numberOfScreens do
    hs.alert.show(screens[i]:name())
  end

  if numberOfScreens == 3 then -- apply 3 screen layout
    local mainScreen   = screens[1]:name()
    local secondScreen = screens[3]:name()
    local thirdScreen  = screens[2]:name()

    windowLayout = {

-- Layout for coding stuff
      {"Xcode",        nil, mainScreen,     max, nil, nil},
      {"Sublime Text", nil, mainScreen, right50, nil, nil},
      {"MacVim",       nil, mainScreen, right50, nil, nil},
      {"Sourcetree",   nil, mainScreen,  left85, nil, nil},
      {"Fork",         nil, mainScreen,  left85, nil, nil},
      {"iTerm2",       nil, mainScreen,    {0.0, 0.5,  0.5, 0.5}, nil, nil},

-- Layout for browsers
      {"Safari",        nil, secondScreen, left85, nil, nil},
      {"Firefox",       nil, secondScreen, left85, nil, nil},
      {"Google Chrome", nil, secondScreen, left85, nil, nil},

-- Layout for productivity stuff
      {"Mail",                           nil, thirdScreen,    max, nil,  nil},
      {"Microsoft Outlook",              nil, thirdScreen,    max, nil,  nil},
      {"Microsoft Lync",    "Microsoft Lync", secondScreen, {0.85, 0,    0.15, 0.5},  nil, nil},
      {"Rocket.Chat",                    nil, thirdScreen,  {0.25, 0.15, 0.75, 0.85}, nil, nil},

-- Layout for multimedia
      {"iTunes",  "iTunes", secondScreen, max, nil, nil},
      {"Spotify",      nil, secondScreen, max, nil, nil},
    }
  elseif numberOfScreens == 2 then -- apply 2 screen layout
    local mainScreen = screens[1]:name()
    local secondScreen = screens[2]:name()
    windowLayout = {

-- Layout for coding stuff
      {"Xcode",      nil, mainScreen,      max, nil, nil},
      {"Sourcetree", nil, secondScreen, left85, nil, nil},
      {"Fork",       nil, secondScreen, left85, nil, nil},

-- Layout for browsers
      {"Safari",        nil, secondScreen, left85, nil, nil},
      {"Firefox",       nil, secondScreen, left85, nil, nil},
      {"Google Chrome", nil, secondScreen, left85, nil, nil},

-- Layout for productivity stuff
      {"Mail",                           nil, secondScreen, left85, nil,  nil},
      {"Microsoft Outlook",              nil, secondScreen, left85, nil,  nil},
      {"Rocket.Chat",                    nil, secondScreen,  {0.25, 0.15, 0.75, 0.85}, nil, nil},
      {"Microsoft Lync",    "Microsoft Lync", secondScreen,  {0.85, 0,    0.15, 0.5},  nil, nil},

-- Layout for multimedia
      {"iTunes",  "iTunes", secondScreen, left85, nil, nil},
      {"Spotify",      nil, secondScreen, left85, nil, nil},
    }
  else
    local mainScreen = screens[1]:name() -- apply 1 screen layout

    if mainScreen == display4k or mainScreen == display4kHome then
      hs.alert.show("Detected 4K Monitor, applying special layout")
      windowLayout = {

-- Layout for coding stuff
        {"Xcode",        nil, mainScreen,     max, nil, nil},
        {"Sublime Text", nil, mainScreen, right50, nil, nil},
        {"MacVim",       nil, mainScreen, right50, nil, nil},
        {"Sourcetree",   nil, mainScreen,  left50, nil, nil},
        {"Fork",         nil, mainScreen,  left50, nil, nil},
        {"iTerm2",       nil, mainScreen,    {0.0, 0.5,  0.5, 0.5}, nil, nil},

-- Layout for browsers
        {"Safari",        nil, mainScreen, left50, nil, nil},
        {"Firefox",       nil, mainScreen, left50, nil, nil},
        {"Google Chrome", nil, mainScreen, left50, nil, nil},

-- Layout for productivity stuff
        {"Mail",                           nil, mainScreen, {0.0, 0.0, 0.5, 0.5}, nil, nil},
        {"Fantastical",                    nil, mainScreen, {0.0, 0.5, 0.5, 0.5}, nil, nil},
        {"Calendar",                       nil, mainScreen, {0.0, 0.5, 0.5, 0.5}, nil, nil},
        {"Things",                         nil, mainScreen, {0.0, 0.0, 0.15, 0.4}, nil, nil},
        {"Rocket.Chat",                    nil, mainScreen, {0.5, 0.5, 0.5, 0.5}, nil, nil},
        {"Microsoft Outlook",              nil, mainScreen, {0.0, 0.0, 0.5, 0.5}, nil, nil},
        {"Microsoft Lync",    "Microsoft Lync", mainScreen, {0.85, 0.0, 0.15, 0.5}, nil, nil},

-- Layout for multimedia
        {"iTunes",  "iTunes", mainScreen,  max, nil, nil},
        {"Spotify",      nil, mainScreen, {0.5, 0.0,  0.5, 0.5}, nil, nil},
      }
    else
      windowLayout = {

-- Layout for coding stuff
        {"Xcode",        nil, mainScreen, max, nil, nil},
        {"Sublime Text", nil, mainScreen, max, nil, nil},
        {"Sourcetree",   nil, mainScreen, max, nil, nil},
        {"Fork",         nil, mainScreen, max, nil, nil},
        {"iTerm2",       nil, mainScreen, max, nil, nil},

-- Layout for browsers
        {"Safari",        nil, mainScreen, max, nil, nil},
        {"Firefox",       nil, mainScreen, max, nil, nil},
        {"Google Chrome", nil, mainScreen, max, nil, nil},

-- Layout for productivity stuff
        {"Mail",                           nil, mainScreen,    max, nil, nil},
        {"Fantastical",                    nil, mainScreen,    max, nil, nil},
        {"Things",                         nil, mainScreen, {0.0, 0.0, 0.15, 0.4}, nil, nil},
        {"Rocket.Chat",                    nil, mainScreen,    max, nil, nil},
        {"Microsoft Outlook",              nil, mainScreen, left85, nil, nil},
        {"Microsoft Lync",    "Microsoft Lync", mainScreen,  {0.85, 0,   0.15, 0.5}, nil, nil},

-- Layout for multimedia
        {"iTunes",  "iTunes", mainScreen, max, nil, nil},
        {"Spotify",      nil, mainScreen, max, nil, nil},
      }
    end
  end
  hs.layout.apply(windowLayout)
end
applyWindowLayout()
