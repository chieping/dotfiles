-- ShiftIt
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

-- Caffeine
hs.loadSpoon("Caffeine")
spoon.Caffeine:start()

-- RotateDisplay
hs.hotkey.bind({"cmd", "option"}, "r", function() hs.execute("ToggleRotateDisplay.sh", true) end)

-- InputSourceSwitch
hs.loadSpoon("InputSourceSwitch")
spoon.InputSourceSwitch:setApplications({
    ["iTerm2"] = "Alphanumeric (Google)",
    ["Ghostty"] = "Alphanumeric (Google)",
})

spoon.InputSourceSwitch:start()

-- Raycastでクリップボード履歴を開く時にカーソル位置のアイテムが選択されることを防ぐ
local function openClipboardHistorySafely()
    -- 現在カーソルがあるディスプレイの作業領域を取得
    local screen = hs.mouse.getCurrentScreen()
    local frame = screen:frame()

    -- Raycastのポップアップと重ならない場所へ移動
    local safePoint = {
        x = frame.x + 20,
        y = frame.y + 20
    }

    hs.mouse.absolutePosition(safePoint)

    -- カーソル移動が反映されてからRaycastを開く
    hs.timer.doAfter(0.05, function()
        hs.eventtap.keyStroke({"ctrl", "option", "cmd"}, "h", 10000)
    end)
end

hs.hotkey.bind(
    {"ctrl", "cmd"}, "h",
    openClipboardHistorySafely
)
