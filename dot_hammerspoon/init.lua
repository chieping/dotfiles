-- ShiftIt
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

-- Caffeine
hs.loadSpoon("Caffeine")
spoon.Caffeine:start()

-- RotateDisplay
hs.hotkey.bind({"cmd", "option"}, "r", function() hs.execute("ToggleRotateDisplay.sh", true) end)
