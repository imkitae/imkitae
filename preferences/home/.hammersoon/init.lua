local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('capslock', 'f18')
remapper:register()

hs.loadSpoon('MoveWindow')
spoon.MoveWindow:bindHotkeys({
	prev = { {"ctrl", "alt"}, "up" },
	next = { {"ctrl", "alt"}, "down" },
	full = { {"ctrl", "alt"}, "f" },
	center = { {"ctrl", "alt"}, "d" },
	small = { {"ctrl", "alt"}, "s" },
})

hs.loadSpoon('HomeAndOut')
spoon.HomeAndOut:bindHotkeys({
	toggle = { {"cmd", "shift"}, "home" }
})

hs.loadSpoon('Secret')
spoon.Secret:bindHotkeys({
	toggle = { {"ctrl", "alt", "shift"}, "escape" }
})

-- --------------------------
-- # Boilerplate
-- --------------------------
-- hs.loadSpoon('FooBar')
-- spoon.FooBar:bindHotkeys({
-- 	foo = { {"cmd", "shift"}, "1" }
-- 	bar = { {"cmd", "shift"}, "2" }
-- })
