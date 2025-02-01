local obj = {}

-- Metadata
obj.name = "HomeAndOut"
obj.version = "1.0"
obj.author = "KT Kang <imkitae@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.hotkeys = nil

function obj:bindHotkeys(mapping)
  if self.hotkeys then
    for _, hotkey in pairs(self.hotkeys) do
      hotkey:delete()
    end

  end

  self.hotkeys = {
    toggle = hs.hotkey.bind(mapping["toggle"][1], mapping["toggle"][2], function() self:toggle() end),
  }

  return self
end

function obj:toggle()
  global_preferences = hs.plist.read("~/Library/Preferences/.GlobalPreferences.plist")
  scroll_direction = global_preferences["com.apple.swipescrolldirection"]

  if scroll_direction then
    hs.alert.show("Natual scrolling off, Wifi off")
    toggle_to_change = 1
  else
    hs.alert.show("Natual scrolling on, Wifi on")
    toggle_to_change = 0
  end

  hs.osascript.applescript([[
    do shell script "open x-apple.systempreferences:com.apple.Trackpad-Settings.extension"
    delay 2.0

    try
      tell application "System Events"
        tell process "System Settings"
          click radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
          
          set scrollingToggle to checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1

          if value of scrollingToggle = ]] .. toggle_to_change .. [[ then
            click checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
          end if
          
          tell application "System Settings" to quit
        end tell
      end tell
    on error e number n
      display dialog "applescript error: " & (e as string)
    end try
  ]])

  hs.wifi.setPower(not scroll_direction)

  return self
end

return obj
