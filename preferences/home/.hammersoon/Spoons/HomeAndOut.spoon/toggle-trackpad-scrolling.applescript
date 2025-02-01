do shell script "open x-apple.systempreferences:com.apple.Trackpad-Settings.extension"
delay 1.0

tell application "System Events"
  tell process "System Settings"
    click radio button 2 of tab group 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1

    try
      set scrollingToggle to checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1

      if value of scrollingToggle = 1 then
        click checkbox "Natural scrolling" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
      end if
    on error e number n
      display dialog "toggle-trackpad-scrolling.applescript: " & (e as string)
    end try

    tell application "System Settings" to quit
  end tell
end tell
