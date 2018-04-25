HotKeySet("^{NUMPAD8}","PasteType")
HotKeySet("^8","PasteType")
HotKeySet("{F1}", "ExitHotkey") ; HotKey set to F1

Func ExitHotkey()
    Exit ; Code for action here, in this case to exit the script (i.e. close the program)
EndFunc

Func PasteType()
	Sleep(200)
	Local $sData = ClipGet()
	Sleep(200)
	Send($sData,1)
EndFunc

Opt("MouseCoordMode", 0)
Opt("WinTitleMatchMode", 1) ;1=start, 2=subStr, 3=exact, 4=advanced, -1 to -4=Nocase

While 1
	Sleep(100)
WEnd