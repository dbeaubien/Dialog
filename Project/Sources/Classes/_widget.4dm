// cs._widget

property _json : Text
property _dialog : cs:C1710.Dialog
property _append_newline : Boolean


Class constructor($dialog : cs:C1710.Dialog)
	$dialog._add_widget(This:C1470)
	This:C1470._append_newline:=True:C214
	This:C1470._dialog:=$dialog
	This:C1470._json:=""
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function no_newline() : cs:C1710._widget
	This:C1470._append_newline:=False:C215
	return This:C1470
	
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json() : Object
	ASSERT:C1129(False:C215; "This function should have been defined by the child class.")
	
	
Function _calc_height_of_text($text : Text)->$height : Integer
	$height:=0