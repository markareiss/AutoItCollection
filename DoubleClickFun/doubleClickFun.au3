#include <Misc.au3>

Local $hDLL = DllOpen("user32.dll")
Local $click = 0
Local $timeDiff = 0
Local $startTime = 0

While ( true )
    If _IsPressed("01", $hDLL) Then

        If $startTime <> 0 Then
            $timeDiff = TimerDiff($startTime) 
            if($timeDiff < 400) Then
                ConsoleWrite("Double click! " & $timeDiff & @CRLF)
                Send("^{RIGHT}")
                Sleep(100)
                Send("!^{LEFT}")
            EndIf
        EndIf

        While _IsPressed("01", $hDLL) 
            Sleep(10)
        WEnd

        $startTime = TimerInit()       
    EndIf
WEnd


;~ Until TimerDiff($ts) > $m_checkParam[3]
