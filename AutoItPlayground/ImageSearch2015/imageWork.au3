#include <ImageSearch2015.au3> 

Func ItIsAlive()
   
    $x1 = 0
    $y1 = 0

    $picture = "C:\Users\Mark\Pictures\William.PNG"

    Do
        $result = _ImageSearch($picture,1,$x1,$y1,0,0)
        ConsoleWrite($result)
    Until $result = 1;

    If $result = 1 Then
        MouseMove($x1,$y1,10)
    EndIf

EndFunc

HotKeySet("^1","ItIsAlive")

While ( true )
    Sleep(500)
WEnd