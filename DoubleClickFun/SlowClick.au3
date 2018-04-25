#include <Misc.au3>

Local $hDLL = DllOpen("user32.dll")
Local $click = 0
Local $timeDiff = 0
Local $startTime = 0

While ( true )
    If _IsPressed("01", $hDLL) Then
        $triggerHighlight = false
        $startTime = TimerInit() 
        $initialMousePosition = MouseGetPos()
        ;ConsoleWrite("Old " & $initialMousePosition[0] & @CRLF)

        While _IsPressed("01", $hDLL)
            Sleep(10)
            $timeDiff = TimerDiff($startTime) 

            if($timeDiff > 650) Then
                $newMousePosition = MouseGetPos()
                ;ConsoleWrite("New " & $newMousePosition[0] & @CRLF)
                
                if (($initialMousePosition[0] + 5 >= $newMousePosition[0]) and $initialMousePosition[0] - 5 <= $newMousePosition[0]) and (($initialMousePosition[1] + 5 >= $newMousePosition[1]) and $initialMousePosition[1] - 5 <= $newMousePosition[1]) Then

                    ;ConsoleWrite("Slowclicking! " & $timeDiff & @CRLF)
                    $triggerHighlight = true
                EndIf
            EndIf
        WEnd

        if($triggerHighlight) Then
            TriggerHighlight()
        EndIf
    EndIf
WEnd

Func TriggerHighlight()
    Sleep(100)
    Send("^{LEFT}")
    Sleep(100)
    Send("{SHIFTDOWN}^{RIGHT}{SHIFTUP}")
    Sleep(100)
EndFunc