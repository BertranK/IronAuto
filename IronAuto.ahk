;Author BertranKim
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

#include lib\FindText.ahk
#include lib\Gdip_all.ahk
#include lib\Gen3.ahk
#include lib\dpi.ahk
#SingleInstance, Force
Gdip_Startup()

Theme1 := SysButton()
GuiButtonType1.SetSessionDefaults( Theme1.All , Theme1.Default , Theme1.Hover , Theme1.Pressed )
SysLogo := New HButton( { Owner: 1 , X: 30 , Y: 25 , W: (800 * ( A_ScreenDPI / 96 )) , H: (70 * ( A_ScreenDPI / 96 )) , Text: "IronAuto ver0.3" , Label: "SysLogo"}, {FontSize : (40 * ( A_ScreenDPI / 96 )) })
SysMinimize := New HButton( { Owner: 1 , X: 880 , Y: 25 , W: (125 * ( A_ScreenDPI / 96 )) , H: (70 * ( A_ScreenDPI / 96 )) , Text: "^_^" , Label: "SysMinimize" })
SysClose := New HButton( { Owner: 1 , X: 1020 , Y: 25 , W: (70 * ( A_ScreenDPI / 96 )) , H: (70 * ( A_ScreenDPI / 96 )) , Text: "X" , Label: "SysClose" })

Gui, Add, Picture, x0 y0 w1110 h830 0x4000000, img\background.jpg ;backgroud image
Gui, Font, cWhite ;font color
Gui, Color, Black, Black ;background color
MyColor1 := "cFFCC00" ;groubbox text(number) color

Theme1 := BKButton()
GuiButtonType1.SetSessionDefaults( Theme1.All , Theme1.Default , Theme1.Hover , Theme1.Pressed )
Save := New HButton( { Owner: 1 , X: 870 , Y: 500 , W: (220 * ( A_ScreenDPI / 96 )) , H: (100 * ( A_ScreenDPI / 96 )) , Text: "Save" , Label: "Save" })
Reb := New HButton( { Owner: 1 , X: 870 , Y: 650 , W: (220 * ( A_ScreenDPI / 96 )) , H: (100 * ( A_ScreenDPI / 96 )) , Text: "Rebolusion!`n (Scroll Lock)" , Label: "Rebolusion" })

Theme1 := BKOButton()
GuiButtonType1.SetSessionDefaults( Theme1.All , Theme1.Default , Theme1.Hover , Theme1.Pressed )
CFirst := New HButton( { Owner: 1 , X: 870 , Y: 165 , W: (220 * ( A_ScreenDPI / 96 )) , H: (60 * ( A_ScreenDPI / 96 )) , Text: "Pick up the first`n More Catalog button" , Label: "CFirst" })
CSecond := New HButton( { Owner: 1 , X: 870 , Y: 230 , W: (220 * ( A_ScreenDPI / 96 )) , H: (60 * ( A_ScreenDPI / 96 )) , Text: "Pick up the second`n More Catalog button" , Label: "CSecond" })
CThird := New HButton( { Owner: 1 , X: 870 , Y: 295 , W: (220 * ( A_ScreenDPI / 96 )) , H: (60 * ( A_ScreenDPI / 96 )) , Text: "Pick up the third`n More Catalog button" , Label: "CThird" })

BKButton(){
	local Reb := {}
	Reb.All := {}
	Reb.Default := {}
	Reb.Hover := {}
	Reb.Pressed := {}
	;********************************
	;All
	Reb.All.W := 200 , Reb.All.H := 70 , Reb.All.Text := "Rebolusion! (Scroll Lock)" , Reb.All.Font := "Calibri" , Reb.All.FontSize := "30" , Reb.All.BackgroundColor := "0xFF22262A" , Reb.All.ButtonMainColor1 := "0xFFFF0000" , Reb.All.ButtonMainColor2 := "0x55FF0000" , Reb.All.ButtonAddGlossy := "1"
	;********************************
	;Default
	Reb.Default.W := 200 , Reb.Default.H := 70 , Reb.Default.Text := "Rebolusion! (Scroll Lock)" , Reb.Default.Font := "Calibri" , Reb.Default.FontOptions := " Bold Center vCenter " , Reb.Default.FontSize := "30" , Reb.Default.H := "0x6602112F" , Reb.Default.TextBottomColor2 := "0x6602112F" , Reb.Default.TextTopColor1 := "0xFFFFFFFF" , Reb.Default.TextTopColor2 := "0xFFFFFFFF" , Reb.Default.TextOffsetX := "0" , Reb.Default.TextOffsetY := "0" , Reb.Default.TextOffsetW := "0" , Reb.Default.TextOffsetH := "0" , Reb.Default.BackgroundColor := "0xFF00000" , Reb.Default.ButtonMainColor1 := "0xFFFF0000" , Reb.Default.ButtonMainColor2 := "0xFFFF0000" , Reb.Default.ButtonAddGlossy := "1" , Reb.Default.GlossTopColor := "0x00FFFFFF" , Reb.Default.GlossTopAccentColor := "00FFFFFF" , Reb.Default.GlossBottomColor := "33000000"
	;********************************
	;Hover
	Reb.Hover.W := 200 , Reb.Hover.H := 70 , Reb.Hover.Text := "Rebolusion! (Scroll Lock)" , Reb.Hover.Font := "Calibri" , Reb.Hover.FontOptions := " Bold Center vCenter " , Reb.Hover.FontSize := "40" , Reb.Hover.H := "0x6602112F" , Reb.Hover.TextBottomColor2 := "0x6602112F" , Reb.Hover.TextTopColor1 := "0xFFFFFFFF" , Reb.Hover.TextTopColor2 := "0xFFFFFFFF" , Reb.Hover.TextOffsetX := "0" , Reb.Hover.TextOffsetY := "0" , Reb.Hover.TextOffsetW := "0" , Reb.Hover.TextOffsetH := "0" , Reb.Hover.BackgroundColor := "0xFF00000" , Reb.Hover.ButtonMainColor1 := "0xFFFF0000" , Reb.Hover.ButtonMainColor2 := "0xFFFF0000" , Reb.Hover.ButtonAddGlossy := "1" , Reb.Hover.GlossTopColor := "0x66FFFFFF" , Reb.Hover.GlossTopAccentColor := "00FFFFFF" , Reb.Hover.GlossBottomColor := "00000000"
	;********************************
	;Pressed
	Reb.Pressed.W := 200 , Reb.Pressed.H := 70 , Reb.Pressed.Text := "Rebolusion! (Scroll Lock)" , Reb.Pressed.Font := "Calibri" , Reb.Pressed.FontOptions := " Bold Center vCenter " , Reb.Pressed.FontSize := "30" , Reb.Pressed.H := "0x00FFFFFF" , Reb.Pressed.TextBottomColor2 := "0x00FFFFFF" , Reb.Pressed.TextTopColor1 := "0x77000000" , Reb.Pressed.TextTopColor2 := "0x77000000" , Reb.Pressed.TextOffsetX := "0" , Reb.Pressed.TextOffsetY := "0" , Reb.Pressed.TextOffsetW := "0" , Reb.Pressed.TextOffsetH := "0" , Reb.Pressed.BackgroundColor := "0xFF00000" , Reb.Pressed.ButtonOuterBorderColor := "0x77000000" , Reb.Pressed.ButtonCenterBorderColor := "0x77000000" , Reb.Pressed.ButtonInnerBorderColor1 := "0xAA000000" , Reb.Pressed.ButtonInnerBorderColor2 := "0xAA000000" , Reb.Pressed.ButtonMainColor1 := "0xFFAA0000" , Reb.Pressed.ButtonMainColor2 := "0xFFAA0000" , Reb.Pressed.ButtonAddGlossy := "1" , Reb.Pressed.GlossTopColor := "0x00333333" , Reb.Pressed.GlossTopAccentColor := "00FF0000" , Reb.Pressed.GlossBottomColor := "00FF3366"
	;********************************
	
	return Reb
}
BKOButton(){
	local Reb := {}
	Reb.All := {}
	Reb.Default := {}
	Reb.Hover := {}
	Reb.Pressed := {}
	;********************************
	;All
	Reb.All.W := 200 , Reb.All.H := 70 , Reb.All.Text := "Rebolusion! (Scroll Lock)" , Reb.All.Font := "Calibri" , Reb.All.FontSize := "22" , Reb.All.BackgroundColor := "0xFF22262A" , Reb.All.ButtonMainColor1 := "0xFFFF6699" , Reb.All.ButtonMainColor2 := "0xFFFF6699"
	;********************************
	;Default
	Reb.Default.W := 200 , Reb.Default.H := 70 , Reb.Default.Text := "Rebolusion! (Scroll Lock)" , Reb.Default.Font := "Calibri" , Reb.Default.FontOptions := " Bold Center vCenter " , Reb.Default.FontSize := "22" , Reb.Default.H := "0x6602112F" , Reb.Default.TextBottomColor2 := "0x6602112F" , Reb.Default.TextTopColor1 := "0xFFFFFFFF" , Reb.Default.TextTopColor2 := "0xFFFFFFFF" , Reb.Default.TextOffsetX := "0" , Reb.Default.TextOffsetY := "0" , Reb.Default.TextOffsetW := "0" , Reb.Default.TextOffsetH := "0" , Reb.Default.BackgroundColor := "0xFF00000" , Reb.Default.ButtonMainColor1 := "0xFFFF6699" , Reb.Default.ButtonMainColor2 := "0xFFFF6699" , Reb.Default.ButtonAddGlossy := "1" , Reb.Default.GlossTopColor := "0x00FFFFFF" , Reb.Default.GlossTopAccentColor := "00FFFFFF" , Reb.Default.GlossBottomColor := "33000000"
	;********************************
	;Hover
	Reb.Hover.W := 200 , Reb.Hover.H := 70 , Reb.Hover.Text := "Rebolusion! (Scroll Lock)" , Reb.Hover.Font := "Calibri" , Reb.Hover.FontOptions := " Bold Center vCenter " , Reb.Hover.FontSize := "24" , Reb.Hover.H := "0x6602112F" , Reb.Hover.TextBottomColor2 := "0x6602112F" , Reb.Hover.TextTopColor1 := "0xFFFFFFFF" , Reb.Hover.TextTopColor2 := "0xFFFFFFFF" , Reb.Hover.TextOffsetX := "0" , Reb.Hover.TextOffsetY := "0" , Reb.Hover.TextOffsetW := "0" , Reb.Hover.TextOffsetH := "0" , Reb.Hover.BackgroundColor := "0xFF00000" , Reb.Hover.ButtonMainColor1 := "0xFFFF6699" , Reb.Hover.ButtonMainColor2 := "0xFFFF6699" , Reb.Hover.ButtonAddGlossy := "1" , Reb.Hover.GlossTopColor := "0x66FFFFFF" , Reb.Hover.GlossTopAccentColor := "00FFFFFF" , Reb.Hover.GlossBottomColor := "00000000"
	;********************************
	;Pressed
	Reb.Pressed.W := 200 , Reb.Pressed.H := 70 , Reb.Pressed.Text := "Rebolusion! (Scroll Lock)" , Reb.Pressed.Font := "Calibri" , Reb.Pressed.FontOptions := " Bold Center vCenter " , Reb.Pressed.FontSize := "22" , Reb.Pressed.H := "0x00FFFFFF" , Reb.Pressed.TextBottomColor2 := "0x00FFFFFF" , Reb.Pressed.TextTopColor1 := "0x77000000" , Reb.Pressed.TextTopColor2 := "0x77000000" , Reb.Pressed.TextOffsetX := "0" , Reb.Pressed.TextOffsetY := "0" , Reb.Pressed.TextOffsetW := "0" , Reb.Pressed.TextOffsetH := "0" , Reb.Pressed.BackgroundColor := "0xFF00000" , Reb.Pressed.ButtonOuterBorderColor := "0x77000000" , Reb.Pressed.ButtonCenterBorderColor := "0x77000000" , Reb.Pressed.ButtonInnerBorderColor1 := "0xAA000000" , Reb.Pressed.ButtonInnerBorderColor2 := "0xAA000000" , Reb.Pressed.ButtonMainColor1 := "0xFFFF6699" , Reb.Pressed.ButtonMainColor2 := "0xFFFF6699" , Reb.Pressed.ButtonAddGlossy := "1" , Reb.Pressed.GlossTopColor := "0x00333333" , Reb.Pressed.GlossTopAccentColor := "00FF0000" , Reb.Pressed.GlossBottomColor := "00FF3366"
	;********************************
	
	return Reb
}

SysButton(){
	local MyButtonDesign := {}
	MyButtonDesign.All := {}
	MyButtonDesign.Default := {}
	MyButtonDesign.Hover := {}
	MyButtonDesign.Pressed := {}
	;********************************
	;All
	MyButtonDesign.All.W := 60 , MyButtonDesign.All.H := 60 , MyButtonDesign.All.Text := "-" , MyButtonDesign.All.FontSize := "40" , MyButtonDesign.All.BackgroundColor := "0xFF22262A" , MyButtonDesign.All.ButtonMainColor1 := "0x55FF0000" , MyButtonDesign.All.ButtonMainColor2 := "0xFFFF0000"
	;********************************
	;Default
	MyButtonDesign.Default.W := 60 , MyButtonDesign.Default.H := 60 , MyButtonDesign.Default.Text := "-" , MyButtonDesign.Default.Font := "Arial" , MyButtonDesign.Default.FontOptions := " Bold Center vCenter " , MyButtonDesign.Default.FontSize := "40" , MyButtonDesign.Default.H := "0x0002112F" , MyButtonDesign.Default.TextBottomColor2 := "0x0002112F" , MyButtonDesign.Default.TextTopColor1 := "0xFFFFFFFF" , MyButtonDesign.Default.TextTopColor2 := "0xFFFFFFFF" , MyButtonDesign.Default.TextOffsetX := "0" , MyButtonDesign.Default.TextOffsetY := "0" , MyButtonDesign.Default.TextOffsetW := "0" , MyButtonDesign.Default.TextOffsetH := "0" , MyButtonDesign.Default.BackgroundColor := "0xFF22262A" , MyButtonDesign.Default.ButtonOuterBorderColor := "0xFF161B1F" , MyButtonDesign.Default.ButtonCenterBorderColor := "0xFF262B2F" , MyButtonDesign.Default.ButtonInnerBorderColor1 := "0xFF3F444A" , MyButtonDesign.Default.ButtonInnerBorderColor2 := "0xFF24292D" , MyButtonDesign.Default.ButtonMainColor1 := "0x55FF0000" , MyButtonDesign.Default.ButtonMainColor2 := "0xFFFF0000" , MyButtonDesign.Default.ButtonAddGlossy := "1" , MyButtonDesign.Default.GlossTopColor := "0x11FFFFFF" , MyButtonDesign.Default.GlossTopAccentColor := "05FFFFFF" , MyButtonDesign.Default.GlossBottomColor := "33000000"
	;********************************
	;Hover
	MyButtonDesign.Hover.W := 60 , MyButtonDesign.Hover.H := 60 , MyButtonDesign.Hover.Text := "-" , MyButtonDesign.Hover.Font := "Arial" , MyButtonDesign.Hover.FontOptions := " Bold Center vCenter " , MyButtonDesign.Hover.FontSize := "50" , MyButtonDesign.Hover.H := "0x0002112F" , MyButtonDesign.Hover.TextBottomColor2 := "0x0002112F" , MyButtonDesign.Hover.TextTopColor1 := "0xFFFFFFFF" , MyButtonDesign.Hover.TextTopColor2 := "0xFFFFFFFF" , MyButtonDesign.Hover.TextOffsetX := "0" , MyButtonDesign.Hover.TextOffsetY := "0" , MyButtonDesign.Hover.TextOffsetW := "0" , MyButtonDesign.Hover.TextOffsetH := "0" , MyButtonDesign.Hover.BackgroundColor := "0xFF22262A" , MyButtonDesign.Hover.ButtonOuterBorderColor := "0xFF161B1F" , MyButtonDesign.Hover.ButtonCenterBorderColor := "0xFF262B2F" , MyButtonDesign.Hover.ButtonInnerBorderColor1 := "0xFF3F444A" , MyButtonDesign.Hover.ButtonInnerBorderColor2 := "0xFF24292D" , MyButtonDesign.Hover.ButtonMainColor1 := "0x55FF0000" , MyButtonDesign.Hover.ButtonMainColor2 := "0xFFFF0000" , MyButtonDesign.Hover.ButtonAddGlossy := "1" , MyButtonDesign.Hover.GlossTopColor := "0x11FFFFFF" , MyButtonDesign.Hover.GlossTopAccentColor := "05FFFFFF" , MyButtonDesign.Hover.GlossBottomColor := "33000000"
	;********************************
	;Pressed
	MyButtonDesign.Pressed.W := 60 , MyButtonDesign.Pressed.H := 60 , MyButtonDesign.Pressed.Text := "-" , MyButtonDesign.Pressed.Font := "Arial" , MyButtonDesign.Pressed.FontOptions := " Bold Center vCenter " , MyButtonDesign.Pressed.FontSize := "40" , MyButtonDesign.Pressed.H := "0x0002112F" , MyButtonDesign.Pressed.TextBottomColor2 := "0x0002112F" , MyButtonDesign.Pressed.TextTopColor1 := "0xFFFFFFFF" , MyButtonDesign.Pressed.TextTopColor2 := "0xFFFFFFFF" , MyButtonDesign.Pressed.TextOffsetX := "0" , MyButtonDesign.Pressed.TextOffsetY := "0" , MyButtonDesign.Pressed.TextOffsetW := "0" , MyButtonDesign.Pressed.TextOffsetH := "0" , MyButtonDesign.Pressed.BackgroundColor := "0xFF22262A" , MyButtonDesign.Pressed.ButtonOuterBorderColor := "0xFF62666a" , MyButtonDesign.Pressed.ButtonCenterBorderColor := "0xFF262B2F" , MyButtonDesign.Pressed.ButtonInnerBorderColor1 := "0xFF151A20" , MyButtonDesign.Pressed.ButtonInnerBorderColor2 := "0xFF151A20" , MyButtonDesign.Pressed.ButtonMainColor1 := "0x55FF0000" , MyButtonDesign.Pressed.ButtonMainColor2 := "0xFFFF0000" , MyButtonDesign.Pressed.ButtonAddGlossy := "0" , MyButtonDesign.Pressed.GlossTopColor := "0x11FFFFFF" , MyButtonDesign.Pressed.GlossTopAccentColor := "05FFFFFF" , MyButtonDesign.Pressed.GlossBottomColor := "33000000"
	;********************************
	
	return MyButtonDesign
}

Toggle := 1 ;relative with on/off msgbox

;config load;
IniRead, FX, config.ini, C, FX
IniRead, FY, config.ini, C, FY
IniRead, SX, config.ini, C, SX
IniRead, SY, config.ini, C, SY
IniRead, TX, config.ini, C, TX
IniRead, TY, config.ini, C, TY
;IniRead, TL, config.ini, ToggleLock, TL
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
IniRead, HK%Col%, config.ini, Hotkeys, Userkey1_%Col%
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
IniRead, Radio11, config.ini, CatalogRadio, R11
IniRead, Radio12, config.ini, CatalogRadio, R12
IniRead, Radio13, config.ini, CatalogRadio, R13
IniRead, Radio21, config.ini, CatalogRadio, R21
IniRead, Radio22, config.ini, CatalogRadio, R22
IniRead, Radio23, config.ini, CatalogRadio, R23
IniRead, Radio31, config.ini, CatalogRadio, R31
IniRead, Radio32, config.ini, CatalogRadio, R32
IniRead, Radio33, config.ini, CatalogRadio, R33
IniRead, Radio41, config.ini, CatalogRadio, R41
IniRead, Radio42, config.ini, CatalogRadio, R42
IniRead, Radio43, config.ini, CatalogRadio, R43
IniRead, Radio51, config.ini, CatalogRadio, R51
IniRead, Radio52, config.ini, CatalogRadio, R52
IniRead, Radio53, config.ini, CatalogRadio, R53
IniRead, Radio61, config.ini, CatalogRadio, R61
IniRead, Radio62, config.ini, CatalogRadio, R62
IniRead, Radio63, config.ini, CatalogRadio, R63
IniRead, Radio71, config.ini, CatalogRadio, R71
IniRead, Radio72, config.ini, CatalogRadio, R72
IniRead, Radio73, config.ini, CatalogRadio, R73
IniRead, Radio81, config.ini, CatalogRadio, R81
IniRead, Radio82, config.ini, CatalogRadio, R82
IniRead, Radio83, config.ini, CatalogRadio, R83
IniRead, Radio91, config.ini, CatalogRadio, R91
IniRead, Radio92, config.ini, CatalogRadio, R92
IniRead, Radio93, config.ini, CatalogRadio, R93
IniRead, Radio101, config.ini, CatalogRadio, R101
IniRead, Radio102, config.ini, CatalogRadio, R102
IniRead, Radio103, config.ini, CatalogRadio, R103

UCT=
(
User's comments`nex) name of the catraoutg
)
Gui, Font, s14 cFFFFFF , Calibri bold
Gui, Add, Text, BackgroundTrans x35 y100 w140 h50 , Inpud Shorcud`n Do not include [Alt] Key ;Userkey1_
Gui, Add, Text, BackgroundTrans x+10 w80 h50  , Catarogs colom ;Userkey2_
Gui, Add, Text, BackgroundTrans x+35 w200 h50  , For Multiple Catalog browers ;Radio buttons
Gui, Add, Text, BackgroundTrans x+40 w280 h50 , %UCT% ;UC_
;Gui, Add, Text, BackgroundTrans x+30 w110 h50 , Oder of cadalog's iterm ;Userkey3_
;Gui, Add, Text, BackgroundTrans x+30 w250 h50 , CHooze behaviro of punsion ;Userkey4_
;divider
;Gui, Add, Hotkey, x870 y370 w220 h30 vToggleLock, TL
;Gui, Add, Text, BackgroundTrans y+30 w200 h50  , Toggle key for Lock or Unlock dimension

Gui, Font, s14 cFFFFFF , Calibri

;1
Gui, Add, GroupBox, x30 y150 w800 h60 %MyColor1%, 1
Gui, Add, Hotkey, x50 y170 w110 h30 vHK1, %HK1%
Gui, Add, Edit, x+30 w50 h30 vi1 Center -E0x200 -Border, %i1%
Gui, Add, Radio, x+30 vRadio11, First
Gui, Add, Radio, x+10 vRadio12, Second
Gui, Add, Radio, x+10 vRadio13, Third
GuiControl, , Radio11, %Radio11%
GuiControl, , Radio12, %Radio12%
GuiControl, , Radio13, %Radio13%
Gui, Add, Edit, x+30 w260 h30 vUC1 Center -E0x200 -Border, %UC1%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;2
Gui, Add, GroupBox, x30 y210 w800 h60 %MyColor1%, 2
Gui, Add, Hotkey, x50 y230 w110 h30 vHK2, %HK2%
Gui, Add, Edit, x+30 w50 h30 vi2 Center -E0x200 -Border, %i2%
Gui, Add, Radio, x+30 vRadio21, First
Gui, Add, Radio, x+10 vRadio22, Second
Gui, Add, Radio, x+10 vRadio23, Third
GuiControl, , Radio21, %Radio21%
GuiControl, , Radio22, %Radio22%
GuiControl, , Radio23, %Radio23%
Gui, Add, Edit, x+30 w260 h30 vUC2 Center -E0x200 -Border, %UC2%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;3
Gui, Add, GroupBox, x30 y270 w800 h60 %MyColor1%, 3
Gui, Add, Hotkey, x50 y290 w110 h30 vHK3, %HK3%
Gui, Add, Edit, x+30 w50 h30 vi3 Center -E0x200 -Border, %i3%
Gui, Add, Radio, x+30 vRadio31, First
Gui, Add, Radio, x+10 vRadio32, Second
Gui, Add, Radio, x+10 vRadio33, Third
GuiControl, , Radio31, %Radio31%
GuiControl, , Radio32, %Radio32%
GuiControl, , Radio33, %Radio33%
Gui, Add, Edit, x+30 w260 h30 vUC3 Center -E0x200 -Border, %UC3%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;4
Gui, Add, GroupBox, x30 y330 w800 h60 %MyColor1%, 4
Gui, Add, Hotkey, x50 y350 w110 h30 vHK4, %HK4%
Gui, Add, Edit, x+30 w50 h30 vi4 Center -E0x200 -Border, %i4%
Gui, Add, Radio, x+30 vRadio41, First
Gui, Add, Radio, x+10 vRadio42, Second
Gui, Add, Radio, x+10 vRadio43, Third
GuiControl, , Radio41, %Radio41%
GuiControl, , Radio42, %Radio42%
GuiControl, , Radio43, %Radio43%
Gui, Add, Edit, x+30 w260 h30 vUC4 Center -E0x200 -Border, %UC4%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;5
Gui, Add, GroupBox, x30 y390 w800 h60 %MyColor1%, 5
Gui, Add, Hotkey, x50 y410 w110 h30 vHK5, %HK5%
Gui, Add, Edit, x+30 w50 h30 vi5 Center -E0x200 -Border, %i5%
Gui, Add, Radio, x+30 vRadio51, First
Gui, Add, Radio, x+10 vRadio52, Second
Gui, Add, Radio, x+10 vRadio53, Third
GuiControl, , Radio51, %Radio51%
GuiControl, , Radio52, %Radio52%
GuiControl, , Radio53, %Radio53%
Gui, Add, Edit, x+30 w260 h30 vUC5 Center -E0x200 -Border, %UC5%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;6
Gui, Add, GroupBox, x30 y450 w800 h60 %MyColor1%, 6
Gui, Add, Hotkey, x50 y470 w110 h30 vHK6, %HK6%
Gui, Add, Edit, x+30 w50 h30 vi6 Center -E0x200 -Border, %i6%
Gui, Add, Radio, x+30 vRadio61, First
Gui, Add, Radio, x+10 vRadio62, Second
Gui, Add, Radio, x+10 vRadio63, Third
GuiControl, , Radio61, %Radio61%
GuiControl, , Radio62, %Radio62%
GuiControl, , Radio63, %Radio63%
Gui, Add, Edit, x+30 w260 h30 vUC6 Center -E0x200 -Border, %UC6%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;7
Gui, Add, GroupBox, x30 y510 w800 h60 %MyColor1%, 7
Gui, Add, Hotkey, x50 y530 w110 h30 vHK7, %HK7%
Gui, Add, Edit, x+30 w50 h30 vi7 Center -E0x200 -Border, %i7%
Gui, Add, Radio, x+30 vRadio71, First
Gui, Add, Radio, x+10 vRadio72, Second
Gui, Add, Radio, x+10 vRadio73, Third
GuiControl, , Radio71, %Radio71%
GuiControl, , Radio72, %Radio72%
GuiControl, , Radio73, %Radio73%
Gui, Add, Edit, x+30 w260 h30 vUC7 Center -E0x200 -Border, %UC7%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;8
Gui, Add, GroupBox, x30 y570 w800 h60 %MyColor1%, 8
Gui, Add, Hotkey, x50 y590 w110 h30 vHK8, %HK8%
Gui, Add, Edit, x+30 w50 h30 vi8 Center -E0x200 -Border, %i8%
Gui, Add, Radio, x+30 vRadio81, First
Gui, Add, Radio, x+10 vRadio82, Second
Gui, Add, Radio, x+10 vRadio83, Third
GuiControl, , Radio81, %Radio81%
GuiControl, , Radio82, %Radio82%
GuiControl, , Radio83, %Radio83%
Gui, Add, Edit, x+30 w260 h30 vUC8 Center -E0x200 -Border, %UC8%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;9
Gui, Add, GroupBox, x30 y630 w800 h60 %MyColor1%, 9
Gui, Add, Hotkey, x50 y650 w110 h30 vHK9, %HK9%
Gui, Add, Edit, x+30 w50 h30 vi9 Center -E0x200 -Border, %i9%
Gui, Add, Radio, x+30 vRadio91, First
Gui, Add, Radio, x+10 vRadio92, Second
Gui, Add, Radio, x+10 vRadio93, Third
GuiControl, , Radio91, %Radio91%
GuiControl, , Radio92, %Radio92%
GuiControl, , Radio93, %Radio93%
Gui, Add, Edit, x+30 w260 h30 vUC9 Center -E0x200 -Border, %UC9%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
;10
Gui, Add, GroupBox, x30 y690 w800 h60 %MyColor1%, 10
Gui, Add, Hotkey, x50 y710 w110 h30 vHK10, %HK10%
Gui, Add, Edit, x+30 w50 h30 vi10 Center -E0x200 -Border, %i10%
Gui, Add, Radio, x+30 vRadio101, First
Gui, Add, Radio, x+10 vRadio102, Second
Gui, Add, Radio, x+10 vRadio103, Third
GuiControl, , Radio101, %Radio101%
GuiControl, , Radio102, %Radio102%
GuiControl, , Radio103, %Radio103%
Gui, Add, Edit, x+30 w260 h30 vUC10 Center -E0x200 -Border, %UC10%
;Gui, Add, Edit, x+30 w110 h30 , Do not touch
;Gui, Add, Radio, x+30 w100 h30 , Ofen cadalog
;Gui, Add, Radio, x+30 w140 h30 , Open+drag and drop
;Gui, Add, Radio, x+30 w80 h30 , large
;Gui, Add, Radio, x+30 w90 h30 , small
;Gui, Add, Radio, x+30 w90 h30 , list
; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;
;Gui, Add, Button, x870 y10 w200 h60 gCFirst, Pick up the first More Catalog button
;Gui, Add, Button, x870 y80 w200 h60 gCSecond, Pick up the second More Catalog button
;Gui, Add, Button, x870 y150 w200 h60 gCThird, Pick up the third More Catalog button
;Gui, Add, Button, x250 y670 w200 h70 gSave, Save
;Gui, Add, Button, x630 y670 w200 h70 gRebolusion vReb, Rebolusion! (Scroll Lock)
WinSet, Region, 0-0 w(1100 * ( A_ScreenDPI / 96 )) h(900 * ( A_ScreenDPI / 96 )) R40-40, ahk_id %GUIHwnd% ;DPI Issue
Gui, Show,x20 y100 w1100 h800, IronAuto 0.3
Gui -MaximizeBox -MinimizeBox -Caption
Gui, +hwndGUIHwnd
return

;SetTitleMatchMode, 2
;#IfWinActive ahk_class AutoHotkey ;ctrl+s shortcut for save button, failed to work only if this window is activated

CFirst:
ToolTipText := "Right Click to save a current mouse position to`nFirst More Catalog button's position"
SetTimer, Timer2, 10
IfWinExist ahk_exe IronCAD.exe
{
	winactivate ahk_exe IronCAD.exe
	WinWaitActive ahk_exe IronCAD.exe
	Keywait, RButton, D
	SetTimer, Timer2, Off
	FFToolTip()
	SoundBeep, 500, 300
	MouseGetPos, FX, FY
	IniWrite, %FX%, config.ini, C, FX
	IniWrite, %FY%, config.ini, C, FY
	winactivate ahk_exe IronAuto.exe
}
else
{
	SetTimer, Timer2, Off
	FFToolTip()
	MsgBox, , What the stupid capitalist?, Run IronCAD before clicking this button a moron
}
return

CSecond:
ToolTipText := "Right Click to save a current mouse position to`nSecond More Catalog button's position"
SetTimer, Timer2, 10
IfWinExist ahk_exe IronCAD.exe
{
	winactivate ahk_exe IronCAD.exe
	WinWaitActive ahk_exe IronCAD.exe
	Keywait, RButton, D
	SetTimer, Timer2, Off
	FFToolTip()
	SoundBeep, 500, 300
	MouseGetPos, SX, SY
	IniWrite, %SX%, config.ini, C, SX
	IniWrite, %SY%, config.ini, C, SY
	winactivate ahk_exe IronAuto.exe
}
else
{
	SetTimer, Timer2, Off
	FFToolTip()
	MsgBox, , What the stupid capitalist?, Run IronCAD before clicking this button a moron
}
return

CThird:
ToolTipText := "Right Click to save a current mouse position to`nThird More Catalog button's position"
SetTimer, Timer2, 10
IfWinExist ahk_exe IronCAD.exe
{
	winactivate ahk_exe IronCAD.exe
	WinWaitActive ahk_exe IronCAD.exe
	Keywait, RButton, D
	SetTimer, Timer2, Off
	FFToolTip()
	SoundBeep, 500, 300
	MouseGetPos, TX, TY
	IniWrite, %TX%, config.ini, C, TX
	IniWrite, %TY%, config.ini, C, TY
	winactivate ahk_exe IronAuto.exe
}
else
{
	SetTimer, Timer2, Off
	FFToolTip()
	MsgBox, , What the stupid capitalist?, Run IronCAD before clicking this button a moron
}
return

Timer2:
FFToolTip(ToolTipText)
Return

;#^s::
Save:
   Gui, Submit, NoHide
   IniWrite, %Radio11%, config.ini, CatalogRadio, R11
   IniWrite, %Radio12%, config.ini, CatalogRadio, R12
   IniWrite, %Radio13%, config.ini, CatalogRadio, R13
   IniWrite, %Radio21%, config.ini, CatalogRadio, R21
   IniWrite, %Radio22%, config.ini, CatalogRadio, R22
   IniWrite, %Radio23%, config.ini, CatalogRadio, R23
   IniWrite, %Radio31%, config.ini, CatalogRadio, R31
   IniWrite, %Radio32%, config.ini, CatalogRadio, R32
   IniWrite, %Radio33%, config.ini, CatalogRadio, R33
   IniWrite, %Radio41%, config.ini, CatalogRadio, R41
   IniWrite, %Radio42%, config.ini, CatalogRadio, R42
   IniWrite, %Radio43%, config.ini, CatalogRadio, R43
   IniWrite, %Radio51%, config.ini, CatalogRadio, R51
   IniWrite, %Radio52%, config.ini, CatalogRadio, R52
   IniWrite, %Radio53%, config.ini, CatalogRadio, R53
   IniWrite, %Radio61%, config.ini, CatalogRadio, R61
   IniWrite, %Radio62%, config.ini, CatalogRadio, R62
   IniWrite, %Radio63%, config.ini, CatalogRadio, R63
   IniWrite, %Radio71%, config.ini, CatalogRadio, R71
   IniWrite, %Radio72%, config.ini, CatalogRadio, R72
   IniWrite, %Radio73%, config.ini, CatalogRadio, R73
   IniWrite, %Radio81%, config.ini, CatalogRadio, R81
   IniWrite, %Radio82%, config.ini, CatalogRadio, R82
   IniWrite, %Radio83%, config.ini, CatalogRadio, R83
   IniWrite, %Radio91%, config.ini, CatalogRadio, R91
   IniWrite, %Radio92%, config.ini, CatalogRadio, R92
   IniWrite, %Radio93%, config.ini, CatalogRadio, R93
   IniWrite, %Radio101%, config.ini, CatalogRadio, R101
   IniWrite, %Radio102%, config.ini, CatalogRadio, R102
   IniWrite, %Radio103%, config.ini, CatalogRadio, R103
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
   ;divider
;   IniWrite, %TL%, config.ini, ToggleLock, TL
   Reload
   SoundBeep, 500, 500
return

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
   SoundBeep, 500, 500
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
;   Hotkey, %TL%, ToggleLock, on
   winactivate ahk_exe IronCAD.exe
   Msgbox, , Workers of the world unite!, Rebolusion rises!!, 5000
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
   SoundBeep, 200, 500
   SoundBeep, 200, 500
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
;   Hotkey, %TL%, ToggleLock, off
   Msgbox, , Workers of the world unite!, Rebolusion is over!, 5000
   }
return

1:
SetControlDelay -1
gui, submit, nohide
Dnum:=i1
MouseGetPos, xpos, ypos
if (Radio11=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio12=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio13=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

2:
SetControlDelay -1
gui, submit, nohide
Dnum:=i2
MouseGetPos, xpos, ypos
if (Radio21=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio22=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio23=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

3:
SetControlDelay -1
gui, submit, nohide
Dnum:=i3
MouseGetPos, xpos, ypos
if (Radio31=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio32=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio33=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

4:
SetControlDelay -1
gui, submit, nohide
Dnum:=i4
MouseGetPos, xpos, ypos
if (Radio41=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio42=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio43=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

5:
SetControlDelay -1
gui, submit, nohide
Dnum:=i5
MouseGetPos, xpos, ypos
if (Radio51=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio52=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio53=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

6:
SetControlDelay -1
gui, submit, nohide
Dnum:=i6
MouseGetPos, xpos, ypos
if (Radio61=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio62=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio63=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

7:
SetControlDelay -1
gui, submit, nohide
Dnum:=i7
MouseGetPos, xpos, ypos
if (Radio71=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio72=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio73=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

8:
SetControlDelay -1
gui, submit, nohide
Dnum:=i8
MouseGetPos, xpos, ypos
if (Radio81=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio82=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio83=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

9:
SetControlDelay -1
gui, submit, nohide
Dnum:=i9
MouseGetPos, xpos, ypos
if (Radio91=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio92=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio93=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

10:
SetControlDelay -1
gui, submit, nohide
Dnum:=i10
MouseGetPos, xpos, ypos
if (Radio101=1){
	MouseMove, FX, FY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio102=1){
	MouseMove, SX, SY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
if (Radio103=1){
	MouseMove, TX, TY
	Click, 1
	Send, {NumpadDown %Dnum%}
	Send, {Enter}
	MouseMove, %xpos%, %ypos%
}
return

~ESC::
if (A_ScreenDPI = 96) {
	Text:="|<>*140$50.y0YUE0008k184000240G10000VCYXlm8jcH994WH/+4WGF8ZIWV8YYG9J8cW994WAm/kWGD728WU"
	if (ok:=FindText(X, Y, 3445-150000, 2144-150000, 3445+150000, 2144+150000, 0, 0, Text))
	{
		MouseGetPos, xpos, ypos
		BlockInput, On
		FindText().Click(X, Y, "L")
		Send, {Home}
		Send, {Enter}
		MouseMove, %xpos%, %ypos%
	}
}
else if (A_ScreenDPI = 120) {
	Text:="|<>*152$60.z04Y100000kU0Y100000kE0Y100000kGoYT7a8fWkH4YnAGNAmkG4YV8GN8EkG4YV8GJ8Ekm4YV8Fb8ElW4YnAFa8Gz24YR7VW8GU"
	if (ok:=FindText(X, Y, 3445-150000, 2144-150000, 3445+150000, 2144+150000, 0, 0, Text))
	{
		MouseGetPos, xpos, ypos
		BlockInput, On
		FindText().Click(X, Y, "L")
		Send, {Home}
		Send, {Enter}
		MouseMove, %xpos%, %ypos%
	}
}
else if (A_ScreenDPI = 144) {
	Text:="|<>*160$70.000nA0k00003y03Ak300000AC00n0A00000kA03A0k000030nPAkz3lX6rg1CAn4QMWAPWk4knAkn38lAD0H3Am384rYkw3AAn8AUHGn3kAknAUm15+AD0X3An3AAQskwAAAnAQMVnX3zUknASkw66AC"
	if (ok:=FindText(X, Y, 3445-150000, 2144-150000, 3445+150000, 2144+150000, 0, 0, Text))
	{
		MouseGetPos, xpos, ypos
		BlockInput, On
		FindText().Click(X, Y, "L")
		Send, {Home}
		Send, {Enter}
		MouseMove, %xpos%, %ypos%
	}
}	
else {
MsgBox, Your current screen DPI is not supported!`nAsk about this msg to Bertrand Kim!`nExiting...
}
return

;;;;;;;;;;;;;Browser of Scene and Properties Switching Start
i := 0
toggle := 0
~Appskey::
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

^D:: ; Dimension ToggleLock
ifWinActive, ahk_exe IronCAD.exe
SetControlDelay -1
{
	MouseGetPos, xpos, ypos
	Click, 2
	Sleep, 333
	IfWinExist, Edit Smart Dimension ahk_class #32770
	{
		ControlClick, Lock, ahk_exe IRONCAD.EXE, , , NA
		Send {Enter}
	}
	else IfWinExist, Edit Length ahk_class #32770
	{
		ControlClick, &Lock, ahk_exe IRONCAD.EXE, , , NA
		Send {Enter}
	}
	else IfWinExist, Edit Angle ahk_class #32770
	{
		ControlClick, &Lock, ahk_exe IRONCAD.EXE, , , NA
		Send {Enter}
	}
	MouseMove, %xpos%, %ypos%
}
return

;!F4::
;#IfWinActive ahk_id IronAuto 
;ExitApp

Timer_Spam:
;TrayTip, Counter, %i%
    i++
return
;;;;;;;;;;;;;Browser of Scene and Properties Switching End

return

SysLogo:
i := 0
Loop, 5
{
	MsgBox, , Wanring,  Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n Awww Do not touch me you such a currupted stupid idiot capitalist!!!, this is notthing!!! Just Click OK 5-%i% times!!!`n
	i++1
}
return

SysMinimize:
WinMinimize, ahk_id %GUIHwnd%
return
SysClose:
WinClose, ahk_id %GUIHwnd%
return

GuiClose:
ExitApp


; ===============================================================================================================================
; FFToolTip(Text:="", X:="", Y:="", WhichToolTip:=1)
; Function:       Creates a tooltip window on any screen in a multiple monitor environment. Unlike the built-in ToolTip command,
;                 calling this function repeatedly will not cause the tooltip window to flicker. Furthermore, if one or both of
;                 the coordinates is not specified, the tooltip window will not hide the bottom-right corner of any of the
;                 monitors. Use this function without the first three parameters, i.e. FFToolTip(), in order to hide the tooltip.
; Parameters:     Text - The text to display in the tooltip. To create a multi-line tooltip, use the linefeed character (`n) in
;                    between each line, e.g. Line1`nLine2. If blank or omitted, the existing tooltip will be hidden.
;                 X - The x position of the tooltip. This position is relative to the active window, the active window's client
;                    area, or the entire screen depending on the coordinate mode (see the CoordMode command). In the default
;                    mode, the coordinates that are relative to the active window.
;                 Y - The y position of the tooltip. See the above X parameter for more information. If both the X and Y
;                    coordinates are omitted, the tooltip will be shown near the mouse cursor.
;                 WhichToolTip - A number between 1 and 20 to indicate which tooltip window to operate upon. If unspecified, the
;                    default is 1.
; Return values:  None
; Global vars:    None
; Dependencies:   MDMF Library (https://www.autohotkey.com/boards/viewtopic.php?p=266388#p266388)
; Tested with:    AHK 1.1.30.01 (A32/U32/U64)
; Tested on:      Win 7 (x64)
; Written by:     iPhilip
; ===============================================================================================================================
; MSDN Links:
; https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-getcursorpos - GetCursorPos function
; https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-clienttoscreen - ClientToScreen function
; https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-movewindow - MoveWindow function
; ===============================================================================================================================

FFToolTip(Text:="", X:="", Y:="", WhichToolTip:=1) {
   static ID := [], Xo, Yo, W, H, SavedText, Monitors
        , PID := DllCall("GetCurrentProcessId")
        , _ := VarSetCapacity(Point, 8)
   
   if not Monitors
      Monitors := MDMF_Enum()
   if (Text = "") {  ; Hide the tooltip
      ToolTip, , , , WhichToolTip
      ID.Delete(WhichToolTip)
   } else if not ID[WhichToolTip] {  ; First call
      ToolTip, %Text%, X, Y, WhichToolTip
      ID[WhichToolTip] := WinExist("ahk_class tooltips_class32 ahk_pid " PID)
      WinGetPos, , , W, H, % "ahk_id " ID[WhichToolTip]
      SavedText := Text
   } else if (Text != SavedText) {  ; The tooltip text changed
      ToolTip, %Text%, X, Y, WhichToolTip
      WinGetPos, , , W, H, % "ahk_id " ID[WhichToolTip]
      SavedText := Text
   } else {  ; The tooltip is being repositioned
      if (Flag := X = "" || Y = "") {
         DllCall("GetCursorPos", "Ptr", &Point, "Int")
         MouseX := NumGet(Point, 0, "Int"), MouseY := NumGet(Point, 4, "Int")
         hMonitor := MDMF_FromPoint(X = "" ? MouseX : X, Y = "" ? MouseY : Y)
         MonitorRight := Monitors[hMonitor].Right
         MonitorBottom := Monitors[hMonitor].Bottom
      }
      ;
      ; Convert input coordinates to screen coordinates
      ;
      if (A_CoordModeToolTip = "Window") {
         WinGetPos, WinX, WinY, , , A
         X := X = "" ? MouseX + 16 : X + WinX
         Y := Y = "" ? MouseY + 16 : Y + WinY
      } else if (A_CoordModeToolTip = "Client") {
         NumPut(X, Point, 0, "Int"), NumPut(Y, Point, 4, "Int")
         DllCall("ClientToScreen", "Ptr", WinExist("A"), "Ptr", &Point, "Int")
         X := X = "" ? MouseX + 16 : NumGet(Point, 0, "Int")
         Y := Y = "" ? MouseY + 16 : NumGet(Point, 4, "Int")
      } else {  ; A_CoordModeToolTip = "Screen"
         X := X = "" ? MouseX + 16 : X
         Y := Y = "" ? MouseY + 16 : Y
      }
      ;
      ; Deal with the bottom and right edges of the current monitor
      ;
      if Flag {
         X := X + W >= MonitorRight  ? MonitorRight  - W - 1 : X
         Y := Y + H >= MonitorBottom ? MonitorBottom - H - 1 : Y
         if (MouseX >= X && MouseX <= X + W && MouseY >= Y && MouseY <= Y + H)
            X := MouseX - W - 3, Y := MouseY - H - 3
      }
      ;
      ; If necessary, store the coordinates and move the tooltip window
      ;
      if (X != Xo || Y != Yo) {
         Xo := X, Yo := Y
         DllCall("MoveWindow", "Ptr", ID[WhichToolTip], "Int", X, "Int", Y, "Int", W, "Int", H, "Int", false, "Int")
      }
   }
}

; ----------------------------------------------------------------------------------------------------------------------
; Name ..........: MDMF - Multiple Display Monitor Functions
; Description ...: Various functions for multiple display monitor environments
; Tested with ...: AHK 1.1.30.01 (A32/U32/U64) and 2.0-a100-52515e2 (U32/U64)
; Original Author: just me (https://www.autohotkey.com/boards/viewtopic.php?f=6&t=4606)
; Mod Author ....: iPhilip
; Changes .......: Modified MDMF_Enum() so that it works under both AHK v1 and v2.
; ................ Modified MDMF_EnumProc() to provide Count and Primary keys to the Monitors array.
; ................ Modified MDMF_FromHWND() to allow flag values that determine the function's return value if the
; ................    window does not intersect any display monitor.
; ................ Modified MDMF_FromPoint() to allow the cursor position to be returned ByRef if not specified and
; ................    allow flag values that determine the function's return value if the point is not contained within
; ................    any display monitor.
; ................ Modified MDMF_FromRect() to allow flag values that determine the function's return value if the
; ................    rectangle does not intersect any display monitor.
;................. Modified MDMF_GetInfo() with minor changes.
; ----------------------------------------------------------------------------------------------------------------------
;
; ======================================================================================================================
; Multiple Display Monitors Functions -> msdn.microsoft.com/en-us/library/dd145072(v=vs.85).aspx =======================
; ======================================================================================================================
; Enumerates display monitors and returns an object containing the properties of all monitors or the specified monitor.
; ======================================================================================================================
MDMF_Enum(HMON := "") {
   Static CallbackFunc := Func(A_AhkVersion < "2" ? "RegisterCallback" : "CallbackCreate")
   Static EnumProc := CallbackFunc.Call("MDMF_EnumProc")
   Static Monitors := {}
   If (HMON = "") ; new enumeration
      Monitors := {Count: 0}
   If (Monitors.MaxIndex() = "") ; enumerate
      If !DllCall("User32.dll\EnumDisplayMonitors", "Ptr", 0, "Ptr", 0, "Ptr", EnumProc, "Ptr", &Monitors, "Int")
         Return False
   Return (HMON = "") ? Monitors : Monitors.HasKey(HMON) ? Monitors[HMON] : False
}
; ======================================================================================================================
;  Callback function that is called by the MDMF_Enum function.
; ======================================================================================================================
MDMF_EnumProc(HMON, HDC, PRECT, ObjectAddr) {
   Monitors := Object(ObjectAddr)
   Monitors[HMON] := MDMF_GetInfo(HMON)
   Monitors.Count++
   If (Monitors[HMON].Primary)
      Monitors.Primary := HMON
   Return True
}
; ======================================================================================================================
; Retrieves the display monitor that has the largest area of intersection with a specified window.
; The following flag values determine the function's return value if the window does not intersect any display monitor:
;    MONITOR_DEFAULTTONULL    = 0 - Returns NULL.
;    MONITOR_DEFAULTTOPRIMARY = 1 - Returns a handle to the primary display monitor. 
;    MONITOR_DEFAULTTONEAREST = 2 - Returns a handle to the display monitor that is nearest to the window.
; ======================================================================================================================
MDMF_FromHWND(HWND, Flag := 0) {
   Return DllCall("User32.dll\MonitorFromWindow", "Ptr", HWND, "UInt", Flag, "Ptr")
}
; ======================================================================================================================
; Retrieves the display monitor that contains a specified point.
; If either X or Y is empty, the function will use the current cursor position for this value and return it ByRef.
; The following flag values determine the function's return value if the point is not contained within any
; display monitor:
;    MONITOR_DEFAULTTONULL    = 0 - Returns NULL.
;    MONITOR_DEFAULTTOPRIMARY = 1 - Returns a handle to the primary display monitor. 
;    MONITOR_DEFAULTTONEAREST = 2 - Returns a handle to the display monitor that is nearest to the window.
; ======================================================================================================================
MDMF_FromPoint(ByRef X := "", ByRef Y := "", Flag := 0) {
   If (X = "") || (Y = "") {
      VarSetCapacity(PT, 8, 0)
      DllCall("User32.dll\GetCursorPos", "Ptr", &PT, "Int")
      If (X = "")
         X := NumGet(PT, 0, "Int")
      If (Y = "")
         Y := NumGet(PT, 4, "Int")
   }
   Return DllCall("User32.dll\MonitorFromPoint", "Int64", (X & 0xFFFFFFFF) | (Y << 32), "UInt", Flag, "Ptr")
}
; ======================================================================================================================
; Retrieves the display monitor that has the largest area of intersection with a specified rectangle.
; Parameters are consistent with the common AHK definition of a rectangle, which is X, Y, W, H instead of
; Left, Top, Right, Bottom.
; The following flag values determine the function's return value if the rectangle does not intersect any
; display monitor:
;    MONITOR_DEFAULTTONULL    = 0 - Returns NULL.
;    MONITOR_DEFAULTTOPRIMARY = 1 - Returns a handle to the primary display monitor. 
;    MONITOR_DEFAULTTONEAREST = 2 - Returns a handle to the display monitor that is nearest to the window.
; ======================================================================================================================
MDMF_FromRect(X, Y, W, H, Flag := 0) {
   VarSetCapacity(RC, 16, 0)
   NumPut(X, RC, 0, "Int"), NumPut(Y, RC, 4, "Int"), NumPut(X + W, RC, 8, "Int"), NumPut(Y + H, RC, 12, "Int")
   Return DllCall("User32.dll\MonitorFromRect", "Ptr", &RC, "UInt", Flag, "Ptr")
}
; ======================================================================================================================
; Retrieves information about a display monitor.
; ======================================================================================================================
MDMF_GetInfo(HMON) {
   NumPut(VarSetCapacity(MIEX, 40 + (32 << !!A_IsUnicode)), MIEX, 0, "UInt")
   If DllCall("User32.dll\GetMonitorInfo", "Ptr", HMON, "Ptr", &MIEX, "Int")
      Return {Name:      (Name := StrGet(&MIEX + 40, 32))  ; CCHDEVICENAME = 32
            , Num:       RegExReplace(Name, ".*(\d+)$", "$1")
            , Left:      NumGet(MIEX, 4, "Int")    ; display rectangle
            , Top:       NumGet(MIEX, 8, "Int")    ; "
            , Right:     NumGet(MIEX, 12, "Int")   ; "
            , Bottom:    NumGet(MIEX, 16, "Int")   ; "
            , WALeft:    NumGet(MIEX, 20, "Int")   ; work area
            , WATop:     NumGet(MIEX, 24, "Int")   ; "
            , WARight:   NumGet(MIEX, 28, "Int")   ; "
            , WABottom:  NumGet(MIEX, 32, "Int")   ; "
            , Primary:   NumGet(MIEX, 36, "UInt")} ; contains a non-zero value for the primary monitor.
   Return False
}