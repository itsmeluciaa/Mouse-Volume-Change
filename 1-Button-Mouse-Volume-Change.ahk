#Requires AutoHotkey v2.0
#SingleInstance Force    ; Prevents multiple instances of the script from running.

; Line 5 to 12 are suposed to prevent anti cheat false positives.
;@Ahk2Exe-Let Version = 3.0
;@Ahk2Exe-IgnoreBegin
;@Ahk2Exe-IgnoreEnd
;@Ahk2Exe-SetVersion %U_Version%
;@Ahk2Exe-SetName 1-Button-Mouse-Volume-Change
;@Ahk2Exe-SetDescription 1-Button-Mouse-Volume-Change
;@Ahk2Exe-Bin Unicode 64*
;@Ahk2Exe-Obey U_au, = "%A_IsUnicode%" ? 2 : 1 ; .Bin file ANSI or Unicode?


global HotkeyState := false

XButton1::
{
    global HotkeyState
    while GetKeyState("XButton1","P") {
        HotkeyState := true
        Sleep(250)
    }
    HotkeyState := false
    return
}

XButton1 Up::
{
    global HotkeyState
    HotkeyState := false
    If (A_PriorHotkey == "XButton1")
            Send("{{XButton1}}")
    return
}

#HotIf HotkeyState
WheelUp::
{
    Send "{Volume_Up}"
}

WheelDown::
{
    Send "{Volume_Down}"
}
#HotIf