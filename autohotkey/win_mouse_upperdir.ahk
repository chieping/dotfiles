#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

#IfWinActive ahk_class ExploreWClass
    ~LButton & RButton::
#IfWinActive ahk_class CabinetWClass
    ~LButton & RButton::
        Send !{Up}
    return
#IfWinActive
