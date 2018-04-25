#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $hDLL = DllOpen("user32.dll")

While 1
    If _IsPressed("01", $hDLL) Then

        ConsoleWrite("_IsPressed - Left Click was pressed." & @CRLF)
        ; Wait until key is released.
        While _IsPressed("10", $hDLL)
            Sleep(250)
        WEnd
        ConsoleWrite("_IsPressed - Left Click was released." & @CRLF)
    ElseIf _IsPressed("1B", $hDLL) Then
        MsgBox($MB_SYSTEMMODAL, "_IsPressed", "The Esc Key was pressed, therefore we will close the application.")
        ExitLoop
    EndIf
    Sleep(250)
WEnd

DllClose($hDLL)
