#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$Form1 = GUICreate("AutoIt For Me", 561, 314, 223, 150)
$Label1 = GUICtrlCreateLabel("Description", 16, 48, 57, 17)
$Label2 = GUICtrlCreateLabel("WhoPays", 16, 106, 50, 17)
$Label3 = GUICtrlCreateLabel("PayType", 16, 164, 46, 17)
$Label4 = GUICtrlCreateLabel("SomethingElse", 16, 222, 74, 17)

$ExecuteButton = GUICtrlCreateButton("Execute", 128, 267, 403, 25)

$FirstPassCheckbox = GUICtrlCreateCheckbox("FirstPass", 128, 16, 169, 17)
$SecondPassCheckbox = GUICtrlCreateCheckbox("SecondPass", 360, 16, 169, 17)

GUICtrlSetState($FirstPassCheckbox, $GUI_CHECKED)
GUICtrlSetState($SecondPassCheckbox, $GUI_CHECKED)

$DescriptionCombo1 = GUICtrlCreateCombo("", 128, 40, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$DescriptionCombo2 = GUICtrlCreateCombo("", 360, 40, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$WhoPaysCombo1 = GUICtrlCreateCombo("", 128, 103, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$WhoPaysCombo2 = GUICtrlCreateCombo("", 360, 103, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$PayTypeCombo1 = GUICtrlCreateCombo("", 128, 161, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$PayTypeCombo2 = GUICtrlCreateCombo("", 360, 161, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$OtherCombo1 = GUICtrlCreateCombo("", 128, 221, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$OtherCombo2 = GUICtrlCreateCombo("", 360, 221, 169, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))

$Description1 = ""
$Description2 = ""
$WhoPays1 = ""
$WhoPays2 = ""
$PayType1 = ""
$PayType2 = ""
$Other1 = ""
$Other2 = ""

Local $Import_ini = "Combo.ini"

Local $DescriptionList = IniReadSection($Import_ini, "Description")

$DescriptionItems = ""
For $i = 1 To $DescriptionList[0][0]
    $DescriptionItems &= "|" & $DescriptionList[$i][1]
Next

Local $WhoPaysList = IniReadSection($Import_ini, "WhoPays")

$WhoPaysItems = ""
For $i = 1 To $WhoPaysList[0][0]
    $WhoPaysItems &= "|" & $WhoPaysList[$i][1]
Next

GUICtrlSetData($DescriptionCombo1, $DescriptionItems,$DescriptionList[1][1])
GUICtrlSetData($DescriptionCombo2, $DescriptionItems,$DescriptionList[1][1])

GUICtrlSetData($WhoPaysCombo1, $WhoPaysItems, $WhoPaysList[1][1])
GUICtrlSetData($WhoPaysCombo2, $WhoPaysItems, $WhoPaysList[2][1])

GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
        Case $FirstPassCheckbox
            If _IsChecked($FirstPassCheckbox) Then
                ActivateFirstPassGui()
            Else
                DeactivateFirstPassGui()
            EndIf
        
        Case $SecondPassCheckbox
            If _IsChecked($SecondPassCheckbox) Then
                ActivateSecondPassGui()
            Else
                DeactivateSecondPassGui()
            EndIf

        Case $ExecuteButton
            GetValuesFromComboBoxes()
            
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

Func _IsChecked($CheckBox)
    If GUICtrlRead($CheckBox) = $GUI_CHECKED Then
        Return True
    Else
        Return False
    EndIf
EndFunc

Func GetValuesFromComboBoxes()
    If _IsChecked($FirstPassCheckbox) Then
        GetValuesFromPass1()
        OutputFirstPass()
    Else
        
    EndIf
    
    If _IsChecked($SecondPassCheckbox) Then
        GetValuesFromPass2()
        OutputSecondPass()
    Else

    EndIf

EndFunc

Func ConsoleWriteLine($value)
    ConsoleWrite($value & @CRLF)
EndFunc

Func OutputFirstPass()
    ConsoleWriteLine("First Pass")
    ConsoleWriteLine("----------")
    ConsoleWriteLine($Description1)
    ConsoleWriteLine($WhoPays1)
    ConsoleWriteLine($PayType1)
    ConsoleWriteLine($Other1)
    ConsoleWriteLine(" ")
EndFunc

Func OutputSecondPass()
    ConsoleWriteLine("Second Pass")
    ConsoleWriteLine("----------")
    ConsoleWriteLine($Description2)
    ConsoleWriteLine($WhoPays2)
    ConsoleWriteLine($PayType2)
    ConsoleWriteLine($Other2)
    ConsoleWriteLine(" ")
EndFunc

Func GetValuesFromPass1()
    $Description1 = GUICtrlRead($DescriptionCombo1)
    $WhoPays1 = GUICtrlRead($WhoPaysCombo1)
    $PayType1 = GUICtrlRead($PayTypeCombo1)
    $Other1 = GUICtrlRead($OtherCombo1)
EndFunc

Func GetValuesFromPass2()
    $Description2 = GUICtrlRead($DescriptionCombo2)
    $WhoPays2 = GUICtrlRead($WhoPaysCombo2)
    $PayType2 = GUICtrlRead($PayTypeCombo2)
    $Other2 = GUICtrlRead($OtherCombo2)
EndFunc


Func DeactivateFirstPassGui()
    GUICtrlSetState($DescriptionCombo1, $GUI_DISABLE)
    GUICtrlSetState($WhoPaysCombo1, $GUI_DISABLE)
    GUICtrlSetState($PayTypeCombo1, $GUI_DISABLE)
    GUICtrlSetState($OtherCombo1, $GUI_DISABLE)
EndFunc

Func DeactivateSecondPassGui()
    GUICtrlSetState($DescriptionCombo2, $GUI_DISABLE)
    GUICtrlSetState($WhoPaysCombo2, $GUI_DISABLE)
    GUICtrlSetState($PayTypeCombo2, $GUI_DISABLE)
    GUICtrlSetState($OtherCombo2, $GUI_DISABLE)
EndFunc

Func ActivateFirstPassGui()
    GUICtrlSetState($DescriptionCombo1, $GUI_ENABLE)
    GUICtrlSetState($WhoPaysCombo1, $GUI_ENABLE)
    GUICtrlSetState($PayTypeCombo1, $GUI_ENABLE)
    GUICtrlSetState($OtherCombo1, $GUI_ENABLE)
EndFunc

Func ActivateSecondPassGui()
    GUICtrlSetState($DescriptionCombo2, $GUI_ENABLE)
    GUICtrlSetState($WhoPaysCombo2, $GUI_ENABLE)
    GUICtrlSetState($PayTypeCombo2, $GUI_ENABLE)
    GUICtrlSetState($OtherCombo2, $GUI_ENABLE)
EndFunc
