--
-- All the hotkeys for layouting are defined here.
--
-- @author Johannes Steudle
--

-- move focused window to left half
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Left", function()
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

-- move focused window to left three-fourths
hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 4 * 3
    f.h = max.h
    win:setFrame(f)
end)

-- move focused window to right half
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Right", function()
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

-- move focused window to right three-fourths
hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 4)
    f.y = max.y
    f.w = max.w / 4 * 3
    f.h = max.h
    win:setFrame(f)
end)

-- set focused window to fullscreen
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Up", function()
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

-- set focused window to upper half
hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

-- set focused window to lower half
hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)
