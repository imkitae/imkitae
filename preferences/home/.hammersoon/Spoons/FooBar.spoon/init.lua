local obj = {}

-- Metadata
obj.name = "FooBar"
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
    foo = hs.hotkey.bind(mapping["foo"][1], mapping["foo"][2], function() self:doFoo() end),
    bar = hs.hotkey.bind(mapping["bar"][1], mapping["bar"][2], function() self:doBar() end),
  }

  return self
end

function obj:doFoo()
  print("obj:doFoo()")
  return self
end

function obj:doBar()
  print("obj:doBar()")
  return self
end

return obj
