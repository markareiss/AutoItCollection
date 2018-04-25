HotKeySet("^`", "CloseWindow") ; Ctrl + `
HotKeySet("^g", "GoGoogle") ; Ctrl + g
HotKeySet("^{NUMPADSUB}", "ADSearch") ; Ctrl + -
HotKeySet("^8","PasteType") ; Ctrl + 8
HotKeySet("^{NUMPAD8}","PasteType") ; Ctrl + NumPad8

;Notepad Hotkeys ► Windows + n
;HotKeySet("#n", "GoSublime")
HotKeySet("#n", "GoVSCode") 

; Closes Window
Func CloseWindow()
	Send("!{F4}")
EndFunc

; Launch default browser to google.com
Func GoGoogle()
	ShellExecute("http://www.google.com")
EndFunc

; Launch VS Code
Func GoVSCode()
	ShellExecute("C:\Program Files (x86)\Microsoft VS Code\Code.exe")
EndFunc

Func GoSublime()
	ShellExecute("C:\Program Files\Sublime Text 2\sublime_text.exe")
EndFunc

Func ADSearch()
	ShellExecute("C:\Windows\System32\dsa.msc")
	Sleep(100)
EndFunc   ;

; Fake Paste - Types out clipboard instead of "Pasting" 
Func PasteType()
	Sleep(200)
	Local $sData = ClipGet()
	Sleep(200)
	Send($sData,1)
EndFunc

; --------------------------------------------------------------------------------------------------------
; --------------------------------------------------------------------------------------------------------

; Loop of hotkey exe
While 1
	Sleep(100)
WEnd
