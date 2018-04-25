#include <Misc.au3>
HotKeySet("{F4}", "_Detected")

MsgBox(0, "HotKey Detection", "Test if the F4 key has been pressed 1 or 2 times.")
While 1
    Sleep(10)
WEnd

Func _Detected()
    If _IsPressed("73") Then
        $start = TimerInit()
        While _IsPressed("73")
            Sleep(50)
        WEnd
        $diff = TimerDiff($start)
        Sleep(10)
        If $diff >= 100 Then MsgBox(0, "F4 Detected", "Single Click: F4 pressed 1 time")
        If ($diff > 0) And ($diff < 100) Then MsgBox(0, "F4 Detected", "Double Click: F4 pressed 2 times")
    EndIf
EndFunc   ;==>_Detected