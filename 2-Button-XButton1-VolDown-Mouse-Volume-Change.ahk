#Requires AutoHotkey v2.0
#SingleInstance Force    ; Prevents multiple instances of the script from running.

; Line 5 to 12 are suposed to prevent anti cheat false positives.
;@Ahk2Exe-Let Version = 3.0
;@Ahk2Exe-IgnoreBegin
;@Ahk2Exe-IgnoreEnd
;@Ahk2Exe-SetVersion %U_Version%
;@Ahk2Exe-SetName 2-Button-XButton1-VolDown-Mouse-Volume-Change
;@Ahk2Exe-SetDescription 2-Button-XButton1-VolDown-Mouse-Volume-Change
;@Ahk2Exe-Bin Unicode 64*
;@Ahk2Exe-Obey U_au, = "%A_IsUnicode%" ? 2 : 1 ; .Bin file ANSI or Unicode?


global VolDownState := false
global VolUpState := false

XButton1::
{
    global VolDownState
    VolDownState := true
    return
}

XButton1 Up::
{
    global VolDownState
    VolDownState := false
    return
}

XButton2::
{
    global VolUpState
    VolUpState := true
    return
}

XButton2 Up::
{
    global VolUpState
    VolUpState := false
    return
}

#HotIf VolDownState
WheelDown::Send "{Volume_Down}"
WheelUp::Send "{Volume_Down}"

#HotIf VolUpState
WheelDown::Send "{Volume_Up}"
WheelUp::Send "{Volume_Up}"

#HotIf