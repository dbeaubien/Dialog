// cs._widget

property _dialog : cs:C1710.Dialog
property _json : Text

Class constructor($dialog : cs:C1710.Dialog)
	$dialog._add_widget(This:C1470)
	This:C1470._dialog:=$dialog
	This:C1470._json:=""
	
	
	//Mark:-************ PUBLIC FUNCTIONS
	
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json() : Object
	ASSERT:C1129(False:C215; "This function should have been defined by the child class.")
	
	
Function _calc_height_of_text($text : Text)->$height : Integer
	$height:=0