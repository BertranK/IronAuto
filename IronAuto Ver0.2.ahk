#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include FindText.ahk

CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Toggle := 1 ;relative with on/off msgbox

Gui, Add, Picture, x0 y0 w1100 h800 0x4000000, background.jpg ;backgroud image
Gui, Font, cWhite ;font color
Gui, Color, Black, Black ;background color
MyColor1 := "cFFCC00" ;groubbox text(number) color

;config load;
Col=1
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=2
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=3
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=4
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=5
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=6
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=7
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=8
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=9
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%
Col=10
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, i%Col%, config.ini, ComlumnofCatalog, Userkey2_%Col%
IniRead, UC%Col%, config.ini, UserComment, UC_%Col%

UCT=
(
User's comments
(User's descriptions of this macro)
)
Gui, Font, s14 cFFFFFF , Calibri bold
Gui, Add, Text, BackgroundTrans x260 y10 w110 h40 , Inpud Shorcud ;Userkey1_
Gui, Add, Text, BackgroundTrans x+30 w80 h40  , Catarogs colom ;Userkey2_
Gui, Add, Text, BackgroundTrans x+30 w280 h40 , %UCT% ;UC_
;Gui, Add, Text, BackgroundTrans x252 w110 h40 , Oder of cadalog's iterm ;Userkey3_
;Gui, Add, Text, BackgroundTrans x382 w250 h40 , CHooze behaviro of punsion ;Userkey4_
;Gui, Add, Text, BackgroundTrans x952 w140 h40 , Edit this value if you have several catalog window (docked or floated)

Gui, Font, s14 cFFFFFF , Calibri

;1
Gui, Add, GroupBox, x240 y50 w600 h60 %MyColor1%, 1
Gui, Add, Hotkey, x260 y70 w110 h30 vHK1, %HK1%
Gui, Add, Edit, x+30 w80 h30 vi1 Number , %i1%
Gui, Add, Edit, x+30 w300 h30 vUC1, %UC1%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;2
Gui, Add, GroupBox, x240 y110 w600 h60 %MyColor1%, 2
Gui, Add, Hotkey, x260 y130 w110 h30 vHK2, %HK2%
Gui, Add, Edit, x+30 w80 h30 vi2 Number, %i2%
Gui, Add, Edit, x+30 w300 h30 vUC2, %UC2%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;3
Gui, Add, GroupBox, x240 y170 w600 h60 %MyColor1%, 3
Gui, Add, Hotkey, x260 y190 w110 h30 vHK3, %HK3%
Gui, Add, Edit, x+30 w80 h30 vi3 Number, %i3%
Gui, Add, Edit, x+30 w300 h30 vUC3, %UC3%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;4
Gui, Add, GroupBox, x240 y230 w600 h60 %MyColor1%, 4
Gui, Add, Hotkey, x260 y250 w110 h30 vHK4, %HK4%
Gui, Add, Edit, x+30 w80 h30 vi4 Number, %i4%
Gui, Add, Edit, x+30 w300 h30 vUC4, %UC4%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;5
Gui, Add, GroupBox, x240 y290 w600 h60 %MyColor1%, 5
Gui, Add, Hotkey, x260 y310 w110 h30 vHK5, %HK5%
Gui, Add, Edit, x+30 w80 h30 vi5 Number, %i5%
Gui, Add, Edit, x+30 w300 h30 vUC5, %UC5%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;6
Gui, Add, GroupBox, x240 y350 w600 h60 %MyColor1%, 6
Gui, Add, Hotkey, x260 y370 w110 h30 vHK6, %HK6%
Gui, Add, Edit, x+30 w80 h30 vi6 Number, %i6%
Gui, Add, Edit, x+30 w300 h30 vUC6, %UC6%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;7
Gui, Add, GroupBox, x240 y410 w600 h60 %MyColor1%, 7
Gui, Add, Hotkey, x260 y430 w110 h30 vHK7, %HK7%
Gui, Add, Edit, x+30 w80 h30 vi7 Number, %i7%
Gui, Add, Edit, x+30 w300 h30 vUC7, %UC7%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;8
Gui, Add, GroupBox, x240 y470 w600 h60 %MyColor1%, 8
Gui, Add, Hotkey, x260 y490 w110 h30 vHK8, %HK8%
Gui, Add, Edit, x+30 w80 h30 vi8 Number, %i8%
Gui, Add, Edit, x+30 w300 h30 vUC8, %UC8%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;9
Gui, Add, GroupBox, x240 y530 w600 h60 %MyColor1%, 9
Gui, Add, Hotkey, x260 y550 w110 h30 vHK9, %HK9%
Gui, Add, Edit, x+30 w80 h30 vi9 Number, %i9%
Gui, Add, Edit, x+30 w300 h30 vUC9, %UC9%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
;10
Gui, Add, GroupBox, x240 y590 w600 h60 %MyColor1%, 10
Gui, Add, Hotkey, x260 y610 w110 h30 vHK10, %HK10%
Gui, Add, Edit, x+30 w80 h30 vi10 Number, %i10%
Gui, Add, Edit, x+30 w300 h30 vUC10, %UC10%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;Gui, Add, Edit, x+30 w80 h30 , I'm an Edit, edit me!
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
Gui, Add, Button, x250 y670 w200 h70 gSave, Save
Gui, Add, Button, x630 y670 w200 h70 gRebolusion vReb, Rebolusion! (Scroll Lock)
Gui, Show, x20 y200 w1100 h800, IronAuto 0.1 by Bertrand Kim
return

;SetTitleMatchMode, 2
;#IfWinActive ahk_class AutoHotkey ;ctrl+s shortcut for save button, failed to work only if this window is activated
;#^s::
Save:
   Gui, Submit, NoHide
   Col=1
   IniWrite, %HK1%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i1%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC1%, config.ini, UserComment, UC_%Col%
   Col=2
   IniWrite, %HK2%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i2%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC2%, config.ini, UserComment, UC_%Col%
   Col=3
   IniWrite, %HK3%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i3%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC3%, config.ini, UserComment, UC_%Col%
   Col=4
   IniWrite, %HK4%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i4%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC4%, config.ini, UserComment, UC_%Col%
   Col=5
   IniWrite, %HK5%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i5%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC5%, config.ini, UserComment, UC_%Col%
   Col=6
   IniWrite, %HK6%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i6%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC6%, config.ini, UserComment, UC_%Col%
   Col=7
   IniWrite, %HK7%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i7%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC7%, config.ini, UserComment, UC_%Col%
   Col=8
   IniWrite, %HK8%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i8%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC8%, config.ini, UserComment, UC_%Col%
   Col=9
   IniWrite, %HK9%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i9%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC9%, config.ini, UserComment, UC_%Col%
   Col=10
   IniWrite, %HK10%, config.ini, Hotkeys, Userkey1_%Col%
   IniWrite, %i10%, config.ini, ComlumnofCatalog, Userkey2_%Col%
   IniWrite, %UC10%, config.ini, UserComment, UC_%Col%
   Col=1
   Reload
return
#IfWinActive

;PrintScreen::
ScrollLock::
Rebolusion:
Toggle:=!Toggle
If Toggle = 0
   {
   GuiControl, text, Reb, Off (Scroll Lock)
   Col=1
   loop, 10
   {
   GuiControl, Disable, HK%Col%
   GuiControl, Disable, i%Col%
   Col++1
   }
   Hotkey, %HK1% , 1, on
   Hotkey, %HK2% , 2, on
   Hotkey, %HK3% , 3, on
   Hotkey, %HK4% , 4, on
   Hotkey, %HK5% , 5, on
   Hotkey, %HK6% , 6, on
   Hotkey, %HK7% , 7, on
   Hotkey, %HK8% , 8, on
   Hotkey, %HK9% , 9, on
   Hotkey, %HK10% , 10, on
   Msgbox Rebolusion rises!!
   }
Else
   {
   GuiControl, text, Reb,  Rebolusion! (Scroll Lock)
   Col=1
   loop, 10
   {
   GuiControl, Enable, HK%Col%
   GuiControl, Enable, i%Col%
   Col++1
   }
   Hotkey, %HK1% , 1, off
   Hotkey, %HK2% , 2, off
   Hotkey, %HK3% , 3, off
   Hotkey, %HK4% , 4, off
   Hotkey, %HK5% , 5, off
   Hotkey, %HK6% , 6, off
   Hotkey, %HK7% , 7, off
   Hotkey, %HK8% , 8, off
   Hotkey, %HK9% , 9, off
   Hotkey, %HK10% , 10, off
   Msgbox Rebolusion is over!
   }
return

1:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i1%
{
Send, {NumpadDown}
}
Send, {Enter}
return

2:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i2%
{
Send, {NumpadDown}
}
Send, {Enter}
return

3:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i3%
{
Send, {NumpadDown}
}
Send, {Enter}
return

4:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i4%
{
Send, {NumpadDown}
}
Send, {Enter}
return

5:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i5%
{
Send, {NumpadDown}
}
Send, {Enter}
return

6:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i6%
{
Send, {NumpadDown}
}
Send, {Enter}
return

7:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i7%
{
Send, {NumpadDown}
}
Send, {Enter}
return

8:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i8%
{
Send, {NumpadDown}
}
Send, {Enter}
return

9:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i9%
{
Send, {NumpadDown}
}
Send, {Enter}
return

10:
SetControlDelay -1
ControlClick, More Catalogs, ahk_exe IRONCAD.EXE, , , NA
Loop %i10%
{
Send, {NumpadDown}
}
Send, {Enter}
return

;;;;;;;;;;;;;Browser of Scene and Properties Switching Start
i := 0
toggle := 0
Appskey::
    toggle := !toggle
    if (toggle) {
		MouseGetPos, xpos, ypos 
		BlockInput, On
		Sleep, 100
        SetTimer, Timer_Spam, 10
		t1:=A_TickCount, X:=Y:=""
		Text:="|<>**40$11.zz07zg5M+kJsfzKEBzN0k1jv1a0Dzs"

		if (ok:=FindText(X, Y, 72-150000, 1401-150000, 72+150000, 1401+150000, 0, 0, Text))
		{
		   FindText().Click(X, Y, "L")
		}
		MouseMove, %xpos%, %ypos%
		BlockInput, Off
    } else {
		MouseGetPos, xpos, ypos
		BlockInput, On
		Sleep, 100
        SetTImer, Timer_Spam, Off
		t1:=A_TickCount, X:=Y:=""

		Text:="|<>*218$12.001U1E1k3E28287Q5I7Q8Y8YBaJORy00U"

		if (ok:=FindText(X, Y, 12-150000, 1401-150000, 12+150000, 1401+150000, 0, 0, Text))
		{
		   FindText().Click(X, Y, "L")
		}
		MouseMove, %xpos%, %ypos%
		BlockInput, Off
    }
return

Timer_Spam:
;TrayTip, Counter, %i%
    i++
return
;;;;;;;;;;;;;Browser of Scene and Properties Switching End

return
GuiClose:
ExitApp