;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
Class HButton	{
	;Gen 3 Button Class By Hellbent
	static init , Button := [] , Active , LastControl , HoldCtrl 
	
	__New( Input := "" , All := "" , Default := "" , Hover := "" , Pressed := "" ){
		
		local hwnd 
		
			;If this is the first time the class is being used.
		if( !HButton.init && HButton.init := 1 )
			
				;Set a timer to watch to see if the cursor goes over one of the controls.
			HButton._SetHoverTimer()
			
		This._CreateNewButtonObject( hwnd := This._CreateControl( Input ) , Input )
		
		This._BindButton( hwnd , Input )
		
		This._GetButtonBitmaps( hwnd , Input , All , Default , Hover , Pressed )
		
		This._DisplayButton( hwnd , HButton.Button[hwnd].Bitmaps.Default.hBitmap )
		
		return hwnd
	}

	_DisplayButton( hwnd , hBitmap){
		
		SetImage( hwnd , hBitmap )
		
	}
	
	_GetButtonBitmaps( hwnd , Input := "" , All := "" , Default := "" , Hover := "" , Pressed := "" ){
	
		HButton.Button[hwnd].Bitmaps := GuiButtonType1.CreateButtonBitmapSet( Input , All , Default , Hover , Pressed )
		
	}
	
	_CreateNewButtonObject( hwnd , Input ){
		
		local k , v  
		
		HButton.Button[ hwnd ] := {}
		
		for k , v in Input
			
			HButton.Button[ hwnd ][ k ] := v
		
		HButton.Button[ hwnd ].Hwnd := hwnd
		
	}
	
	_CreateControl( Input ){
		
		local hwnd
		
		Gui , % Input.Owner ":Add" , Pic , % "x" Input.X " y" Input.Y " w" Input.W " h" Input.H " hwndhwnd 0xE"  
		
		return hwnd
		
	}
	
	_BindButton( hwnd , Input ){
		
		local bd
		
		bd := This._OnClick.Bind( This )
		
		GuiControl, % Input.Owner ":+G" , % hwnd , % bd
		
	}
	
	_SetHoverTimer( timer := "" ){
		
		local HoverTimer 

		if( !HButton.HoverTimer ) 
			
			HButton.HoverTimer := ObjBindMethod( HButton , "_OnHover" ) 
		
		HoverTimer := HButton.HoverTimer
		
		SetTimer , % HoverTimer , % ( Timer ) ? ( Timer ) : ( 100 )
		
	}
	
	_OnHover(){
		
		local Ctrl
		
		MouseGetPos,,,,ctrl,2
		
		if( HButton.Button[ ctrl ] && !HButton.Active ){
			
			HButton.Active := 1
			
			HButton.LastControl := ctrl
			
			HButton._DisplayButton( ctrl , HButton.Button[ ctrl ].Bitmaps.Hover.hBitmap )
			
		}else if( HButton.Active && ctrl != HButton.LastControl ){
			
			HButton.Active := 0
			
			HButton._DisplayButton( HButton.LastControl , HButton.Button[ HButton.LastControl ].Bitmaps.Default.hBitmap )

		}
		
	}
	
	_OnClick(){
		
		local Ctrl, last
		
		HButton._SetHoverTimer( "Off" )
		
		MouseGetPos,,,, Ctrl , 2
		last := ctrl
		HButton._SetFocus( ctrl )
		HButton._DisplayButton( last , HButton.Button[ last ].Bitmaps.Pressed.hBitmap )
		
		While(GetKeyState("LButton"))
			sleep, 60
		
		HButton._SetHoverTimer()
		
		loop, 2
			This._OnHover()
		
		MouseGetPos,,,, Ctrl , 2
		
		if(ctrl!=last){
			
			HButton._DisplayButton( last , HButton.Button[ last ].Bitmaps.Default.hBitmap )
		
		}else{
			HButton._DisplayButton( last , HButton.Button[ last ].Bitmaps.Hover.hBitmap )
			if( HButton.Button[ last ].Label ){
			
			if(IsFunc( HButton.Button[ last ].Label ) )
				
				fn := Func( HButton.Button[ last ].Label )
				, fn.Call()
				
			else 
				
				gosub, % HButton.Button[ last ].Label
			}
		
		}
		
	}
	
	_SetFocus( ctrl ){
		
		GuiControl, % HButton.Button[ ctrl ].Owner ":Focus" , % ctrl
		
	}
	
	DeleteButton( hwnd ){
		
		for k , v in HButton.Button[ hwnd ].Bitmaps
				Gdip_DisposeImage( HButton.Button[hwnd].Bitmaps[k].pBitmap )
				, DeleteObject( HButton.Button[ hwnd ].Bitmaps[k].hBitmap )
				
		GuiControl , % HButton.Button[ hwnd ].Owner ":Move", % hwnd , % "x-1 y-1 w0 h0" 
		HButton.Button[ hwnd ] := ""
	}
	
}
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
Class GuiButtonType1	{

	static List := [ "Default" , "Hover" , "Pressed" ]
	
	_CreatePressedBitmap(){
		
		local arr := [] , Bitmap := {} , fObj := This.CurrentBitmapData.Pressed
		
		Bitmap.pBitmap := Gdip_CreateBitmap( fObj.W , fObj.H ) , G := Gdip_GraphicsFromImage( Bitmap.pBitmap ) , Gdip_SetSmoothingMode( G , 2 )
		
		Brush := Gdip_BrushCreateSolid( fObj.BackgroundColor ) , Gdip_FillRectangle( G , Brush , -1 , -1 , fObj.W+2 , fObj.H+2 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_BrushCreateSolid( fObj.ButtonOuterBorderColor ) , Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , fObj.W-7 , fObj.H-7 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , fObj.W , fObj.H , fObj.ButtonInnerBorderColor1 , fObj.ButtonInnerBorderColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , fObj.W-5 , fObj.H-8 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , fObj.W-7 , fObj.H-10 , fObj.ButtonMainColor1 , fObj.ButtonMainColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 5 , 5 , fObj.W-11 , fObj.H-12 , 5 ) , Gdip_DeleteBrush( Brush )
			
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextBottomColor1 , fObj.TextBottomColor2 , 1 , 1 )
		
		arr := [ { X: -1 , Y: -1 } , { X: 0 , Y: -1 } , { X: 1 , Y: -1 } , { X: -1 , Y: 0 } , { X: 1 , Y: 0 } , { X: -1 , Y: 1 } , { X: 0 , Y: 1 } , { X: 1 , Y: 1 } ]
		
		Loop, % 8
			
			Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 1 + arr[A_Index].X + fObj.TextOffsetX " y" 3 + arr[A_Index].Y + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextTopColor1 , fObj.TextTopColor2 , 1 , 1 )
		
		Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 1 + fObj.TextOffsetX " y" 3 + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
	if( fObj.ButtonAddGlossy ){
		
		Brush := Gdip_BrushCreateSolid( fObj.GlossTopColor ) , Gdip_FillRectangle( G , Brush , 5 , 10 , fObj.W-11 , ( fObj.H / 2 ) - 10   ) , Gdip_DeleteBrush( Brush )

		Brush := Gdip_BrushCreateSolid( fObj.GlossTopAccentColor ) , Gdip_FillRectangle( G , Brush , 10 , 12 , fObj.W-21 , fObj.H / 15 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_BrushCreateSolid( fObj.GlossBottomColor ) , Gdip_FillRectangle( G , Brush , 5  , 10 + ( fObj.H / 2 ) - 10 , fObj.W-11 , ( fObj.H / 2 ) - 7 ) , Gdip_DeleteBrush( Brush )
				
	}

		Gdip_DeleteGraphics( G )
		
		Bitmap.hBitmap := Gdip_CreateHBITMAPFromBitmap( Bitmap.pBitmap )
		
		return Bitmap
	}
	
	_CreateHoverBitmap(){
		
		local arr := [] , Bitmap := {} , fObj := This.CurrentBitmapData.Hover
		
		Bitmap.pBitmap := Gdip_CreateBitmap( fObj.W , fObj.H ) , G := Gdip_GraphicsFromImage( Bitmap.pBitmap ) , Gdip_SetSmoothingMode( G , 2 )
		
		Brush := Gdip_BrushCreateSolid( fObj.BackgroundColor ) , Gdip_FillRectangle( G , Brush , -1 , -1 , fObj.W+2 , fObj.H+2 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_BrushCreateSolid( fObj.ButtonOuterBorderColor ) , Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , fObj.W-5 , fObj.H-7 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_BrushCreateSolid( fObj.ButtonCenterBorderColor ) , Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , fObj.W-7 , fObj.H-9 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , fObj.W , fObj.H-10 , fObj.ButtonInnerBorderColor1 , fObj.ButtonInnerBorderColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 4 , 5 , fObj.W-9 , fObj.H-11 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 5 , 7 , fObj.W-11 , fObj.H-14 , fObj.ButtonMainColor1 , fObj.ButtonMainColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 5 , 7 , fObj.W-11 , fObj.H-14 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextBottomColor1 , fObj.TextBottomColor2 , 1 , 1 )
		
		arr := [ { X: -1 , Y: -1 } , { X: 0 , Y: -1 } , { X: 1 , Y: -1 } , { X: -1 , Y: 0 } , { X: 1 , Y: 0 } , { X: -1 , Y: 1 } , { X: 0 , Y: 1 } , { X: 1 , Y: 1 } ]
		
		Loop, % 8
			
			Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 0 + arr[A_Index].X + fObj.TextOffsetX " y" 2 + arr[A_Index].Y + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextTopColor1 , fObj.TextTopColor2 , 1 , 1 )
		
		Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 0 + fObj.TextOffsetX " y" 2 + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
		if( fObj.ButtonAddGlossy = 1 ){
			
			Brush := Gdip_BrushCreateSolid( fObj.GlossTopColor ) , Gdip_FillRectangle( G , Brush , 6 , 10 , fObj.W-13 , ( fObj.H / 2 ) - 10   ) , Gdip_DeleteBrush( Brush )
			
			Brush := Gdip_BrushCreateSolid( fObj.GlossTopAccentColor ) , Gdip_FillRectangle( G , Brush , 10 , 12 , fObj.W-21 , fObj.H / 15 ) , Gdip_DeleteBrush( Brush )
			
			Brush := Gdip_BrushCreateSolid( fObj.GlossBottomColor ) , Gdip_FillRectangle( G , Brush , 6  , 10 + ( fObj.H / 2 ) - 10 , fObj.W-13 , ( fObj.H / 2 ) - 7 ) , Gdip_DeleteBrush( Brush )
					
		}
	
		Gdip_DeleteGraphics( G )
		
		Bitmap.hBitmap := Gdip_CreateHBITMAPFromBitmap( Bitmap.pBitmap )
		
		return Bitmap
		
	}
	
	_CreateDefaultBitmap(){
		
		local arr := [] , Bitmap := {} , fObj := This.CurrentBitmapData.Default
		
		Bitmap.pBitmap := Gdip_CreateBitmap( fObj.W , fObj.H ) , G := Gdip_GraphicsFromImage( Bitmap.pBitmap ) , Gdip_SetSmoothingMode( G , 2 )
	
		Brush := Gdip_BrushCreateSolid( fObj.BackgroundColor ) , Gdip_FillRectangle( G , Brush , -1 , -1 , fObj.W+2 , fObj.H+2 ) , Gdip_DeleteBrush( Brush )
	
		Brush := Gdip_BrushCreateSolid( fObj.ButtonOuterBorderColor ) , Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , fObj.W-5 , fObj.H-7 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_BrushCreateSolid( fObj.ButtonCenterBorderColor ) , Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , fObj.W-7 , fObj.H-9 , 5 ) , Gdip_DeleteBrush( Brush )
	
		Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , fObj.W , fObj.H-10 , fObj.ButtonInnerBorderColor1 , fObj.ButtonInnerBorderColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 4 , 5 , fObj.W-9 , fObj.H-11 , 5 ) , Gdip_DeleteBrush( Brush )
	
		Brush := Gdip_CreateLineBrushFromRect( 5 , 7 , fObj.W-11 , fObj.H-14 , fObj.ButtonMainColor1 , fObj.ButtonMainColor2 , 1 , 1 ) , Gdip_FillRoundedRectangle( G , Brush , 5 , 7 , fObj.W-11 , fObj.H-14 , 5 ) , Gdip_DeleteBrush( Brush )
		
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextBottomColor1 , fObj.TextBottomColor2 , 1 , 1 )
		
		arr := [ { X: -1 , Y: -1 } , { X: 0 , Y: -1 } , { X: 1 , Y: -1 } , { X: -1 , Y: 0 } , { X: 1 , Y: 0 } , { X: -1 , Y: 1 } , { X: 0 , Y: 1 } , { X: 1 , Y: 1 } ]
		
		Loop, % 8
			
			Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 0 + arr[A_Index].X + fObj.TextOffsetX " y" 2 + arr[A_Index].Y + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
		Brush := Gdip_CreateLineBrushFromRect( 0 , 2 , fObj.W , fObj.H , fObj.TextTopColor1 , fObj.TextTopColor2 , 1 , 1 )
		
		Gdip_TextToGraphics( G , fObj.Text , "s" fObj.FontSize " " fObj.FontOptions " c" Brush " x" 0 + fObj.TextOffsetX " y" 2 + fObj.TextOffsetY , fObj.Font , fObj.W + fObj.TextOffsetW , fObj.H + fObj.TextOffsetH )
	
		if( fObj.ButtonAddGlossy ){
		
			Brush := Gdip_BrushCreateSolid( fObj.GlossTopColor ) , Gdip_FillRectangle( G , Brush , 6 , 10 , fObj.W-13 , ( fObj.H / 2 ) - 10   ) , Gdip_DeleteBrush( Brush )
			
			Brush := Gdip_BrushCreateSolid( fObj.GlossTopAccentColor ) , Gdip_FillRectangle( G , Brush , 10 , 12 , fObj.W-21 , fObj.H / 15 ) , Gdip_DeleteBrush( Brush )
			
			Brush := Gdip_BrushCreateSolid( fObj.GlossBottomColor ) , Gdip_FillRectangle( G , Brush , 6  , 10 + ( fObj.H / 2 ) - 10 , fObj.W-13 , ( fObj.H / 2 ) - 7 ) , Gdip_DeleteBrush( Brush )
				
		}
	
		Gdip_DeleteGraphics( G )
		
		Bitmap.hBitmap := Gdip_CreateHBITMAPFromBitmap( Bitmap.pBitmap )
		
		return Bitmap
		
	}
	
	_GetMasterDefaultValues(){ ;Default State
		
		local Default := {}
		
		Default.pBitmap := "" 
		, Default.hBitmap := ""
		, Default.Font := "Arial"
		, Default.FontOptions := " Bold Center vCenter "
		, Default.FontSize := "12"
		, Default.Text := "Button"
		, Default.W := 10
		, Default.H := 10
		, Default.TextBottomColor1 := "0x0002112F"
		, Default.TextBottomColor2 := Default.TextBottomColor1
		, Default.TextTopColor1 := "0xFFFFFFFF"
		, Default.TextTopColor2 := "0xFF000000"
		, Default.TextOffsetX := 0
		, Default.TextOffsetY := 0
		, Default.TextOffsetW := 0
		, Default.TextOffsetH := 0
		, Default.BackgroundColor := "0xFF22262A"
		, Default.ButtonOuterBorderColor := "0xFF161B1F"	
		, Default.ButtonCenterBorderColor := "0xFF262B2F"	
		, Default.ButtonInnerBorderColor1 := "0xFF3F444A"
		, Default.ButtonInnerBorderColor2 := "0xFF24292D"
		, Default.ButtonMainColor1 := "0xFF272C32"
		, Default.ButtonMainColor2 := "" Default.ButtonMainColor1
		, Default.ButtonAddGlossy := 0
		, Default.GlossTopColor := "0x11FFFFFF"
		, Default.GlossTopAccentColor := "0x05FFFFFF"	
		, Default.GlossBottomColor := "0x33000000"
		
		return Default
		
	}
	
	_GetMasterHoverValues(){ ;Hover State
		
		local Default := {}
		
		Default.pBitmap := ""
		, Default.hBitmap := ""
		, Default.Font := "Arial"
		, Default.FontOptions := " Bold Center vCenter "
		, Default.FontSize := "12"
		, Default.Text := "Button"
		, Default.W := 10
		, Default.H := 10
		, Default.TextBottomColor1 := "0x0002112F"
		, Default.TextBottomColor2 := Default.TextBottomColor1
		, Default.TextTopColor1 := "0xFFFFFFFF"
		, Default.TextTopColor2 := "0xFF000000"
		, Default.TextOffsetX := 0
		, Default.TextOffsetY := 0
		, Default.TextOffsetW := 0
		, Default.TextOffsetH := 0
		, Default.BackgroundColor := "0xFF22262A"
		, Default.ButtonOuterBorderColor := "0xFF161B1F"	
		, Default.ButtonCenterBorderColor := "0xFF262B2F"	
		, Default.ButtonInnerBorderColor1 := "0xFF3F444A"
		, Default.ButtonInnerBorderColor2 := "0xFF24292D"
		, Default.ButtonMainColor1 := "0xFF373C42"
		, Default.ButtonMainColor2 := "" Default.ButtonMainColor1
		, Default.ButtonAddGlossy := 0
		, Default.GlossTopColor := "0x11FFFFFF"
		, Default.GlossTopAccentColor := "0x05FFFFFF"	
		, Default.GlossBottomColor := "0x33000000"
		
		return Default
		
	}
	
	_GetMasterPressedValues(){ ;Pressed State
		
		local Default := {}
		
		Default.pBitmap := ""
		, Default.hBitmap := ""
		, Default.Font := "Arial"
		, Default.FontOptions := " Bold Center vCenter "
		, Default.FontSize := "12"
		, Default.Text := "Button"
		, Default.W := 10
		, Default.H := 10
		, Default.TextBottomColor1 := "0x0002112F"
		, Default.TextBottomColor2 := Default.TextBottomColor1
		, Default.TextTopColor1 := "0xFFFFFFFF"
		, Default.TextTopColor2 := "0xFF000000"
		, Default.TextOffsetX := 0
		, Default.TextOffsetY := 0
		, Default.TextOffsetW := 0
		, Default.TextOffsetH := 0
		, Default.BackgroundColor := "0xFF22262A"
		, Default.ButtonOuterBorderColor := "0xFF62666a"
		, Default.ButtonCenterBorderColor := "0xFF262B2F"	
		, Default.ButtonInnerBorderColor1 := "0xFF151A20"
		, Default.ButtonInnerBorderColor2 := "0xFF151A20"
		, Default.ButtonMainColor1 := "0xFF12161a"
		, Default.ButtonMainColor2 := "0xFF33383E"
		, Default.ButtonAddGlossy := 0
		, Default.GlossTopColor := "0x11FFFFFF"
		, Default.GlossTopAccentColor := "0x05FFFFFF"	
		, Default.GlossBottomColor := "0x33000000"
	
		return Default
		
	}
	
	SetSessionDefaults( All := "" , Default := "" , Hover := "" , Pressed := "" ){ ;Set the default values based on user input
		
		This.SessionBitmapData := {} 
		, This.Preset := 1
		, This.init := 0
		
		This._LoadDefaults("SessionBitmapData")
		
		This._SetSessionData( All , Default , Hover , Pressed )
		
	}
	
	_SetSessionData( All := "" , Default := "" , Hover := "" , Pressed := "" ){
		
		local index , k , v , i , j
	
		if( IsObject( All ) ){
			
			Loop, % GuiButtonType1.List.Length()	{
				index := A_Index
				For k , v in All
					This.SessionBitmapData[ GuiButtonType1.List[ index ] ][ k ] := v
			}
		}
		
		For k , v in GuiButtonType1.List
			if( isObject( %v% ) )
				For i , j in %v%
					This.SessionBitmapData[ GuiButtonType1.List[ k ] ][ i ] := j
				
	}
	
	_LoadDefaults( input := "" ){
		
		This.CurrentBitmapData := "" , This.CurrentBitmapData := {}
			
		For k , v in This.SessionBitmapData
			This.CurrentBitmapData[k] := {}
		
		This[ input ].Default := This._GetMasterDefaultValues()
		, This[ input ].Hover := This._GetMasterHoverValues()
		, This[ input ].Pressed := This._GetMasterPressedValues()
		
	}
	
	_SetCurrentBitmapDataFromSessionData(){
		
		local k , v , i , j
			
		This.CurrentBitmapData := "" , This.CurrentBitmapData := {}
			
		For k , v in This.SessionBitmapData
		{
			This.CurrentBitmapData[k] := {}
			
			For i , j in This.SessionBitmapData[k]
				
				This.CurrentBitmapData[k][i] := j

		}
		
	}
	
	_UpdateCurrentBitmapData( All := "" , Default := "" , Hover := "" , Pressed := "" ){
		
		local k , v , i , j
		
		if( IsObject( All ) ){
			
			Loop, % GuiButtonType1.List.Length()	{
				
				index := A_Index
			
				For k , v in All
					
					This.CurrentBitmapData[ GuiButtonType1.List[ index ] ][ k ] := v
					
			}
		}
		
		For k , v in GuiButtonType1.List
			
			if( isObject( %v% ) )
				
				For i , j in %v%
					
					This.CurrentBitmapData[ GuiButtonType1.List[ k ] ][ i ] := j
				
	}
	
	_UpdateInstanceData( obj := ""){
		
		For k , v in GuiButtonType1.List	
			
			This.CurrentBitmapData[v].Text := obj.Text
			, This.CurrentBitmapData[v].W := obj.W
			, This.CurrentBitmapData[v].H := obj.H
			
	}

	CreateButtonBitmapSet( obj := "" ,  All := "" , Default := "" , Hover := "" , Pressed := ""  ){ ;Create a new button
		
		local Bitmaps := {}
		
		if( This.Preset )
				
			This._SetCurrentBitmapDataFromSessionData()
			
		else
			
			This._LoadDefaults( "CurrentBitmapData" )
			
		This._UpdateCurrentBitmapData( All , Default , Hover , Pressed )
		
		This._UpdateInstanceData( obj )
		 
		Bitmaps.Default := This._CreateDefaultBitmap()
		, Bitmaps.Hover := This._CreateHoverBitmap()
		, Bitmaps.Pressed := This._CreatePressedBitmap()
		
		return Bitmaps
		
	}
	
}
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************
;****************************************************************************************************************************************************************************************

/*  ;Template for setting button session defaults

MasterTheme(){
	
	local Theme := {}

	Theme.All := {}
	
	Theme.All.pBitmap := ""
	, Theme.All.hBitmap := ""
	, Theme.All.Font := "Arial"
	, Theme.All.FontOptions := " Bold Center vCenter "
	, Theme.All.FontSize := "12"
	, Theme.All.Text := "Button"
	, Theme.All.W := 10
	, Theme.All.H := 10
	, Theme.All.TextBottomColor1 := "0x0002112F"
	, Theme.All.TextBottomColor2 := Theme.All.TextBottomColor1
	, Theme.All.TextTopColor1 := "0xFFFFFFFF"
	, Theme.All.TextTopColor2 := "0xFF000000"
	, Theme.All.TextOffsetX := 0
	, Theme.All.TextOffsetY := 0
	, Theme.All.TextOffsetW := 0
	, Theme.All.TextOffsetH := 0
	, Theme.All.BackgroundColor := "0xFF22262A"
	, Theme.All.ButtonOuterBorderColor := "0xFF62666a"
	, Theme.All.ButtonCenterBorderColor := "0xFF262B2F"	
	, Theme.All.ButtonInnerBorderColor1 := "0xFF151A20"
	, Theme.All.ButtonInnerBorderColor2 := "0xFF151A20"
	, Theme.All.ButtonMainColor1 := "0xFF12161a"
	, Theme.All.ButtonMainColor2 := "0xFF33383E"
	, Theme.All.ButtonAddGlossy := 0
	, Theme.All.GlossTopColor := "0x11FFFFFF"
	, Theme.All.GlossTopAccentColor := "0x05FFFFFF"	
	, Theme.All.GlossBottomColor := "0x33000000"
	
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	;<<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>>
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	
	Theme.Default := {}
	
	Theme.Default.pBitmap := "" 
	, Theme.Default.hBitmap := ""
	, Theme.Default.Font := "Arial"
	, Theme.Default.FontOptions := " Bold Center vCenter "
	, Theme.Default.FontSize := "12"
	, Theme.Default.Text := "Button"
	, Theme.Default.W := 10
	, Theme.Default.H := 10
	, Theme.Default.TextBottomColor1 := "0x0002112F"
	, Theme.Default.TextBottomColor2 := Theme.Default.TextBottomColor1
	, Theme.Default.TextTopColor1 := "0xFFFFFFFF"
	, Theme.Default.TextTopColor2 := "0xFF000000"
	, Theme.Default.TextOffsetX := 0
	, Theme.Default.TextOffsetY := 0
	, Theme.Default.TextOffsetW := 0
	, Theme.Default.TextOffsetH := 0
	, Theme.Default.BackgroundColor := "0xFF22262A"
	, Theme.Default.ButtonOuterBorderColor := "0xFF161B1F"	
	, Theme.Default.ButtonCenterBorderColor := "0xFF262B2F"	
	, Theme.Default.ButtonInnerBorderColor1 := "0xFF3F444A"
	, Theme.Default.ButtonInnerBorderColor2 := "0xFF24292D"
	, Theme.Default.ButtonMainColor1 := "0xFF272C32"
	, Theme.Default.ButtonMainColor2 := "" Theme.Default.ButtonMainColor1
	, Theme.Default.ButtonAddGlossy := 0
	, Theme.Default.GlossTopColor := "0x11FFFFFF"
	, Theme.Default.GlossTopAccentColor := "0x05FFFFFF"	
	, Theme.Default.GlossBottomColor := "0x33000000"
	
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	;<<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>>
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	
	Theme.Hover := {}
	
	Theme.Hover.pBitmap := ""
	, Theme.Hover.hBitmap := ""
	, Theme.Hover.Font := "Arial"
	, Theme.Hover.FontOptions := " Bold Center vCenter "
	, Theme.Hover.FontSize := "12"
	, Theme.Hover.Text := "Button"
	, Theme.Hover.W := 10
	, Theme.Hover.H := 10
	, Theme.Hover.TextBottomColor1 := "0x0002112F"
	, Theme.Hover.TextBottomColor2 := Theme.Hover.TextBottomColor1
	, Theme.Hover.TextTopColor1 := "0xFFFFFFFF"
	, Theme.Hover.TextTopColor2 := "0xFF000000"
	, Theme.Hover.TextOffsetX := 0
	, Theme.Hover.TextOffsetY := 0
	, Theme.Hover.TextOffsetW := 0
	, Theme.Hover.TextOffsetH := 0
	, Theme.Hover.BackgroundColor := "0xFF22262A"
	, Theme.Hover.ButtonOuterBorderColor := "0xFF161B1F"	
	, Theme.Hover.ButtonCenterBorderColor := "0xFF262B2F"	
	, Theme.Hover.ButtonInnerBorderColor1 := "0xFF3F444A"
	, Theme.Hover.ButtonInnerBorderColor2 := "0xFF24292D"
	, Theme.Hover.ButtonMainColor1 := "0xFF373C42"
	, Theme.Hover.ButtonMainColor2 := "" Theme.Hover.ButtonMainColor1
	, Theme.Hover.ButtonAddGlossy := 0
	, Theme.Hover.GlossTopColor := "0x11FFFFFF"
	, Theme.Hover.GlossTopAccentColor := "0x05FFFFFF"	
	, Theme.Hover.GlossBottomColor := "0x33000000"
	
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	;<<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>>
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	
	Theme.Pressed := {}
	
	Theme.Pressed.pBitmap := ""
	, Theme.Pressed.hBitmap := ""
	, Theme.Pressed.Font := "Arial"
	, Theme.Pressed.FontOptions := " Bold Center vCenter "
	, Theme.Pressed.FontSize := "12"
	, Theme.Pressed.Text := "Button"
	, Theme.Pressed.W := 10
	, Theme.Pressed.H := 10
	, Theme.Pressed.TextBottomColor1 := "0x0002112F"
	, Theme.Pressed.TextBottomColor2 := Theme.Pressed.TextBottomColor1
	, Theme.Pressed.TextTopColor1 := "0xFFFFFFFF"
	, Theme.Pressed.TextTopColor2 := "0xFF000000"
	, Theme.Pressed.TextOffsetX := 0
	, Theme.Pressed.TextOffsetY := 0
	, Theme.Pressed.TextOffsetW := 0
	, Theme.Pressed.TextOffsetH := 0
	, Theme.Pressed.BackgroundColor := "0xFF22262A"
	, Theme.Pressed.ButtonOuterBorderColor := "0xFF62666a"
	, Theme.Pressed.ButtonCenterBorderColor := "0xFF262B2F"	
	, Theme.Pressed.ButtonInnerBorderColor1 := "0xFF151A20"
	, Theme.Pressed.ButtonInnerBorderColor2 := "0xFF151A20"
	, Theme.Pressed.ButtonMainColor1 := "0xFF12161a"
	, Theme.Pressed.ButtonMainColor2 := "0xFF33383E"
	, Theme.Pressed.ButtonAddGlossy := 0
	, Theme.Pressed.GlossTopColor := "0x11FFFFFF"
	, Theme.Pressed.GlossTopAccentColor := "0x05FFFFFF"	
	, Theme.Pressed.GlossBottomColor := "0x33000000"
	
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	;<<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>><<<<<>>>>>(_____)<<<<<>>>>>
	;<*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	
	
	return Theme
}
