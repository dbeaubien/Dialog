// cs.Input

Class extends _widget

property _name : Text
property _value : Text
property _width : Integer
property _options : Object
property _placeholder : Text

Class constructor($dialog : cs:C1710.Dialog)
	Super:C1705($dialog)
	This:C1470._width:=250
	This:C1470._options:={\
		bold: False:C215; \
		italic: False:C215; \
		size: 0; \
		indent: 0}
	This:C1470.name("input_"+Generate UUID:C1066)
	This:C1470.value("")
	This:C1470.placeholder("")
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function bold() : cs:C1710.Input
	This:C1470._options.bold:=True:C214
	return This:C1470
	
Function italic() : cs:C1710.Input
	This:C1470._options.italic:=True:C214
	return This:C1470
	
Function size($size : Integer) : cs:C1710.Input
	This:C1470._options.size:=$size
	return This:C1470
	
Function name($name : Text) : cs:C1710.Input
	This:C1470._name:=$name
	return This:C1470
	
Function placeholder($placeholder : Text) : cs:C1710.Input
	This:C1470._placeholder:=$placeholder
	return This:C1470
	
Function indent($indent : Integer) : cs:C1710.Input
	This:C1470._options.indent:=$indent
	return This:C1470
	
Function width($width : Integer) : cs:C1710.Input
	This:C1470._width:=$width
	return This:C1470
	
Function value($value : Text) : cs:C1710.Input
	This:C1470._value:=$value
	return This:C1470
	
Function no_newline() : cs:C1710.Input
	Super:C1706.no_newline()
	return This:C1470
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json()->$widget : Object
	$widget:={}
	This:C1470._dialog._form_data[This:C1470._name]:=This:C1470._value
	
	$widget:={\
		type: "input"; \
		top: 20; \
		left: This:C1470._options.indent; \
		width: This:C1470._width+40; \
		height: 17; \
		dataSource: "Form."+This:C1470._name}
	
	If (This:C1470._placeholder#"")
		$widget.placeholder:=This:C1470._placeholder
	End if 
	
	If (This:C1470._options.bold)
		$widget.fontWeight:="bold"
	End if 
	If (This:C1470._options.italic)
		$widget.fontStyle:="italic"
	End if 
	If (This:C1470._options.size>0)
		$widget.fontSize:=This:C1470._options.size
		$widget.height:=This:C1470._options.size+6
	End if 