// cs.Checkbox

Class extends _widget

property _name : Text
property _label : Text
property _options : Object
property _is_checked : Boolean

Class constructor($dialog : cs:C1710.Dialog; $label : Text)
	Super:C1705($dialog)
	This:C1470._label:=$label
	This:C1470._is_checked:=False:C215
	This:C1470._options:={\
		bold: False:C215; \
		italic: False:C215; \
		size: 0; \
		indent: 0}
	This:C1470.name("cb_"+Generate UUID:C1066)
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function name($name : Text) : cs:C1710.Checkbox
	This:C1470._name:=$name
	return This:C1470
	
Function bold() : cs:C1710.Checkbox
	This:C1470._options.bold:=True:C214
	return This:C1470
	
Function italic() : cs:C1710.Checkbox
	This:C1470._options.italic:=True:C214
	return This:C1470
	
Function size($size : Integer) : cs:C1710.Checkbox
	This:C1470._options.size:=$size
	return This:C1470
	
Function indent($indent : Integer) : cs:C1710.Checkbox
	This:C1470._options.indent:=$indent
	return This:C1470
	
Function is_checked() : cs:C1710.Checkbox
	This:C1470._is_checked:=True:C214
	return This:C1470
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json()->$widget : Object
	var $best_size : Object
	$best_size:=This:C1470._dialog._get_text_best_size(This:C1470._label; This:C1470._options)
	This:C1470._dialog._form_data[This:C1470._name]:=This:C1470._is_checked
	
	$widget:={\
		type: "checkbox"; \
		text: This:C1470._label; \
		top: 20; \
		left: This:C1470._options.indent; \
		width: $best_size.width+40; \
		height: $best_size.height; \
		dataSourceTypeHint: "boolean"; \
		events: ["onClick"]; \
		dataSource: "Form."+This:C1470._name}
	
	If (This:C1470._options.bold)
		$widget.fontWeight:="bold"
	End if 
	If (This:C1470._options.italic)
		$widget.fontStyle:="italic"
	End if 
	If (This:C1470._options.size>0)
		$widget.fontSize:=This:C1470._options.size
	End if 