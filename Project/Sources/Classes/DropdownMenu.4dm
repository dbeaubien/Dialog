// cs.DropdownMenu

Class extends _widget

property _name : Text
property _value : Text
property _indent : Integer
property _width : Integer
property _placeholder : Text
property _default_value : Text
property _dropdown_menu_choices : Collection

Class constructor($dialog : cs:C1710.Dialog)
	Super:C1705($dialog)
	This:C1470.name("input_"+Generate UUID:C1066)
	This:C1470.default_value("")
	This:C1470.width(250)
	This:C1470.indent(0)
	This:C1470._dropdown_menu_choices:=[]
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function name($name : Text) : cs:C1710.DropdownMenu
	ASSERT:C1129(Count parameters:C259=1)
	This:C1470._name:=$name
	return This:C1470
	
	
Function default_value($default_value : Variant) : cs:C1710.DropdownMenu
	ASSERT:C1129(Count parameters:C259=1)
	This:C1470._default_value:=String:C10($default_value)
	return This:C1470
	
	
Function width($width : Integer) : cs:C1710.DropdownMenu
	ASSERT:C1129(Count parameters:C259=1)
	This:C1470._width:=$width
	return This:C1470
	
	
Function indent($indent : Integer) : cs:C1710.DropdownMenu
	ASSERT:C1129(Count parameters:C259=1)
	This:C1470._indent:=$indent
	return This:C1470
	
	
Function choices($dropdown_menu_choices : Collection) : cs:C1710.DropdownMenu
	ASSERT:C1129(Count parameters:C259=1)
	ASSERT:C1129($dropdown_menu_choices#Null:C1517)
	ASSERT:C1129($dropdown_menu_choices.length>0)
	This:C1470._dropdown_menu_choices:=$dropdown_menu_choices.copy()
	return This:C1470
	
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _widget_json()->$widget : Object
	This:C1470._dialog._form_data[This:C1470._name]:=This:C1470._convert_menu_choices_to_object()
	
	$widget:={\
		type: "dropdown"; \
		top: 20; \
		left: This:C1470._indent; \
		width: This:C1470._width; \
		height: 27; \
		events: []; \
		dataSourceTypeHint: "object"; \
		dataSource: "Form."+This:C1470._name}
	
	
Function _convert_menu_choices_to_object()->$menu_object : Object
	var $item : Variant
	$menu_object:={}
	$menu_object.currentValue:=This:C1470._default_value
	$menu_object.values:=[]
	For each ($item; This:C1470._dropdown_menu_choices)
		$menu_object.values.push(String:C10($item))
	End for each 
	$menu_object.index:=$menu_object.values.indexOf(This:C1470._default_value)
	If ($menu_object.index<=0)
		$menu_object.index:=1
	End if 
	