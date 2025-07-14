// cs.Text

Class extends _widget

property _text : Text
property _options : Object

Class constructor($dialog : cs:C1710.Dialog; $text : Text)
	Super:C1705($dialog)
	This:C1470._text:=$text
	This:C1470._options:={\
		bold: False:C215; \
		italic: False:C215; \
		size: 0; \
		indent: 0}
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function bold() : cs:C1710.Text
	This:C1470._options.bold:=True:C214
	return This:C1470
	
Function italic() : cs:C1710.Text
	This:C1470._options.italic:=True:C214
	return This:C1470
	
Function size($size : Integer) : cs:C1710.Text
	This:C1470._options.size:=$size
	return This:C1470
	
Function indent($indent : Integer) : cs:C1710.Text
	This:C1470._options.indent:=$indent
	return This:C1470
	
Function no_newline() : cs:C1710.Text
	Super:C1706.no_newline()
	return This:C1470
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json()->$widget : Object
	var $best_size : Object
	$best_size:=This:C1470._dialog._get_text_best_size(This:C1470._text; This:C1470._options)
	
	$widget:={\
		type: "text"; \
		text: This:C1470._text; \
		top: 20; \
		left: This:C1470._options.indent; \
		width: $best_size.width; \
		height: $best_size.height}
	
	If (This:C1470._options.bold)
		$widget.fontWeight:="bold"
	End if 
	If (This:C1470._options.italic)
		$widget.fontStyle:="italic"
	End if 
	If (This:C1470._options.size>0)
		$widget.fontSize:=This:C1470._options.size
	End if 