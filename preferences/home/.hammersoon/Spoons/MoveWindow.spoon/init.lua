local obj = {}

-- Metadata
obj.name = "MoveWindow"
obj.version = "1.0"
obj.author = "KT Kang <imkitae@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.hotkeys = nil

function obj:bindHotkeys(mapping)
  if (self.hotkeys) then
    for _, hotkey in pairs(self.hotkeys) do
      hotkey:delete()
    end

  end

  self.hotkeys = {
    prev = hs.hotkey.bind(mapping["prev"][1], mapping["prev"][2], function() self:moveWindowToDisplay(-1) end),
    next = hs.hotkey.bind(mapping["next"][1], mapping["next"][2], function() self:moveWindowToDisplay(1) end),
    full = hs.hotkey.bind(mapping["full"][1], mapping["full"][2], function() self:center(1, 1) end),
    center = hs.hotkey.bind(mapping["center"][1], mapping["center"][2], function() self:center(0.7, 0.75) end),
    small = hs.hotkey.bind(mapping["small"][1], mapping["small"][2], function() self:small() end),
  }

  return self
end

function obj:moveWindowToDisplay(diff)
  local all_screens = hs.screen.allScreens()
  local focused_win = hs.window.focusedWindow()
  local focused_screen = hs.window.focusedWindow():screen()

  local all_screens_cnt = 0
  local focused_screen_idx = 0
  for i, scr in pairs(all_screens) do
    all_screens_cnt = all_screens_cnt + 1
    if scr == focused_screen then
      focused_screen_idx = i
    end
  end

  local new_screen = all_screens[((focused_screen_idx - 1) + diff ) % all_screens_cnt + 1]

  focused_win:moveToScreen(new_screen, false, true, 0)

  return self
end

function obj:center(wRatio, hRatio)
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  local screenFrame, winFrame = screen:fullFrame(), win:frame()
  local screenLowerRight = hs.geometry(
    screenFrame.w * (1 - wRatio) * 0.5,
    screenFrame.h * (1 - hRatio) * 0.5
  )

  local pos = screen:localToAbsolute(screenLowerRight)
  local size = hs.geometry(nil, nil, screenFrame.w * wRatio, screenFrame.h * hRatio)
  win:setFrame(hs.geometry(pos, size), 0)

  return self
end

function obj:small()
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  local screenFrame, winFrame = screen:fullFrame(), win:frame()
  local screenLowerLeft = hs.geometry(0, screenFrame.h)
  local sizeRatio = hs.geometry(0.4, 0.3)

  local pos = screen:localToAbsolute(screenLowerLeft * (hs.geometry(1, 1) - sizeRatio))
  local size = screenFrame * sizeRatio
  win:setFrameInScreenBounds(hs.geometry(pos, size), 0)

  return self
end

return obj
