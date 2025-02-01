local obj = {}

-- Metadata
obj.name = "Secret"
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
    toggle = hs.hotkey.bind(mapping["toggle"][1], mapping["toggle"][2], function() self:toggle() end),
  }

  return self
end

function obj:toggle()
  unicorn_https = hs.application.get("Unicorn HTTPS")
  chrome = hs.application.get("Google Chrome")
  sublime = hs.application.get("Sublime Text")

  if not unicorn_https then
    unicorn_https = hs.application.open("Unicorn HTTPS")

    if chrome then
      chrome:selectMenuItem({"File", "New Incognito Window"})
    end

    hs.execute("subl -n ~/Documents/ismett", true)
  else
    unicorn_https:kill()

    if sublime then
      ismett = sublime:findWindow("ismett")
      if ismett then
        ismett:close()
      end
    end
  
    hs.osascript.applescript([[
      tell application "Google Chrome" to close (every window whose mode is "incognito")

      launch application "System Events"
      delay 0.2
      ignoring application responses        
        tell application "System Events" to tell process "Clipy"
          click menu bar item 1 of menu bar 2
        end tell
      end ignoring
      do shell script "killall System\\ Events"
      delay 0.1
      tell application "System Events" to tell process "Clipy"
        click menu item "Clear History" of menu 1 of menu bar item 1 of menu bar 2
      end tell
    ]])
  end

  return self
end

return obj
