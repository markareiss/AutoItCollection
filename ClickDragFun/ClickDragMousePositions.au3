;_ScreenCapture_CaptureWnd($testimage, $hWin, 0, 0, -1, -1, False);_ScreenCapture_CaptureWnd ( $sFileName, $hWnd [, $iLeft = 0 [, $iTop = 0 [, $iRight = -1 [, $iBottom = -1 [, $bCursor = True]]]]] )
;~ $result
;~ ConsoleWrite($result)
;MsgBox($MB_SYSTEMMODAL, "Mouse x, y:", $aPos[0] & ", " & $aPos[1])


#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <ScreenCapture.au3>

;~ $result = MsgBox($MB_OKCANCEL, "Capture mouse?", "Capture mouse?")

Local $hDLL = DllOpen("user32.dll")
Local $initialMousePosition
Local $finishedMousePosition
Local $count = 0
Local $timeDiff = 0
Local $startTime = 0

$triggerHighlight = False

$waitingForClickAndDrag = true

While ( $waitingForClickAndDrag )
    If _IsPressed("01", $hDLL) Then

        $triggerHighlight = false
        $startTime = TimerInit() 
        $initialMousePosition = MouseGetPos()
  
        While _IsPressed("01", $hDLL) 

            Sleep(10)
            $timeDiff = TimerDiff($startTime) 

            if($timeDiff > 200) Then
                $triggerHighlight = true
            EndIf
        WEnd

        If ($triggerHighlight) Then
            
                $finishedMousePosition = MouseGetPos()

                if($initialMousePosition[0] > $finishedMousePosition[0] ) Then
                    $startX = $finishedMousePosition[0]
                    $endX = $initialMousePosition[0]
                else
                    $startX = $initialMousePosition[0]
                    $endX = $finishedMousePosition[0]
                EndIf
                

                if($initialMousePosition[1] > $finishedMousePosition[1] ) Then
                    $startY = $finishedMousePosition[1]
                    $endY = $initialMousePosition[1]
                else
                    $startY = $initialMousePosition[1]
                    $endY = $finishedMousePosition[1]
                EndIf
                
                $count = $count + 1
                ConsoleWrite("Click " & $count & @CRLF)
                ConsoleWrite("---------------------" & @CRLF)
                ConsoleWrite("startX,startY = " & $startX & "," & $startY & @CRLF)
                ConsoleWrite("endX,endY = " & $endX & "," & $endY & @CRLF)
                ConsoleWrite("                     " & @CRLF)

                $screenShot = _ScreenCapture_Capture("", $startX, $startY, $endX, $endY)
                $result = _ScreenCapture_SaveImage("C:\Users\Mark\Desktop\ImageSearch2015\pic_" & $count & ".jpg", $screenShot)

        Else
                ConsoleWrite("---------------------" & @CRLF)
                ConsoleWrite("Too quick!" & @CRLF)
                ConsoleWrite("                     " & @CRLF)
        EndIf
    EndIf
WEnd

