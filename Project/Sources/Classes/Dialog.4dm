// cs.Dialog

property _default_font_size : Integer
property _width : Integer
property _title : Text
property _top_next_widget : Integer
property _widgets : Collection
property _button_OK_label : Text
property _button_Third_label : Text
property _button_Cancel_label : Text
property _form : Object
property _form_data : Object
property _auto_cancel_in_seconds : Integer

Class constructor
	This:C1470._form_data:={}
	This:C1470.default_font_size(13)
	This:C1470.width(600)
	This:C1470.ok_button("OK")
	This:C1470.cancel_button("")
	This:C1470.other_button("")
	This:C1470.title("")
	This:C1470._widgets:=[]
	This:C1470._top_next_widget:=10
	This:C1470.auto_cancel_in_seconds(0)
	
	
	//Mark:-************ PUBLIC FUNCTIONS
Function title($title : Text) : cs:C1710.Dialog
	This:C1470._title:=$title
	return This:C1470
	
Function default_font_size($font_size : Integer) : cs:C1710.Dialog
	This:C1470._default_font_size:=$font_size
	return This:C1470
	
Function width($width : Integer) : cs:C1710.Dialog
	This:C1470._width:=$width
	return This:C1470
	
Function ok_button($label : Text) : cs:C1710.Dialog
	This:C1470._button_OK_label:=$label
	return This:C1470
	
Function cancel_button($label : Text) : cs:C1710.Dialog
	This:C1470._button_Cancel_label:=$label
	return This:C1470
	
Function other_button($label : Text) : cs:C1710.Dialog
	This:C1470._button_Third_label:=$label
	return This:C1470
	
Function auto_cancel_in_seconds($num_seconds_to_auto_cancel : Integer) : cs:C1710.Dialog
	This:C1470._form_data.auto_cancel_in_seconds:=$num_seconds_to_auto_cancel
	return This:C1470
	
Function display()->$result : Object
	var $form_raw_json : Text
	$form_raw_json:=Folder:C1567("/PROJECT")\
		.folder("Sources")\
		.folder("Forms")\
		.folder("Template")\
		.file("form.4DForm")\
		.getText()
	
	This:C1470._form:=JSON Parse:C1218($form_raw_json)
	This:C1470._form.width:=This:C1470._width
	
	FORM LOAD:C1103("Template")  // used by This._get_text_best_size()
	This:C1470._append_widgets_to_form()
	This:C1470._move_buttons_to_last_object()
	This:C1470._adjust_buttons()
	This:C1470._handle_auto_close_message()
	OB REMOVE:C1226(This:C1470._form.pages[1].objects; "text_best_sizer")  // remove our temp object used for text sizing
	FORM UNLOAD:C1299
	
	var $rect : Object
	This:C1470._form.height:=This:C1470._top_next_widget+15
	$rect:=This:C1470._get_dialog_rect()
	
	var $window_ref : Integer
	$window_ref:=Open window:C153($rect.left; $rect.top\
		; $rect.right; $rect.bottom\
		; Movable dialog box:K34:7)
	SET WINDOW TITLE:C213(This:C1470._title; $window_ref)
	This:C1470._form_data.button_pressed:=""
	DIALOG:C40(This:C1470._form; This:C1470._form_data)
	CLOSE WINDOW:C154($window_ref)
	$result:=This:C1470._form_data
	
	
	
	//Mark:-************ PRIVATE FUNCTIONS
Function _add_widget($widget : cs:C1710._widget)
	This:C1470._widgets.push($widget)
	
	
Function _move_buttons_to_last_object()
	// Move the buttons to be the last 3 objects on the form to maintain the tab order
	var $button : Object
	$button:=This:C1470._form.pages[1].objects.btn_ok
	OB REMOVE:C1226(This:C1470._form.pages[1].objects; "btn_ok")
	This:C1470._form.pages[1].objects.btn_ok:=$button
	
	$button:=This:C1470._form.pages[1].objects.btn_cancel
	OB REMOVE:C1226(This:C1470._form.pages[1].objects; "btn_cancel")
	This:C1470._form.pages[1].objects.btn_cancel:=$button
	
	$button:=This:C1470._form.pages[1].objects.btn_third
	OB REMOVE:C1226(This:C1470._form.pages[1].objects; "btn_third")
	This:C1470._form.pages[1].objects.btn_third:=$button
	
	
Function _adjust_buttons()
	var $best_size : Object
	var $button_right_edge_position : Integer
	$button_right_edge_position:=This:C1470._form.width-20
	This:C1470._top_next_widget+=10
	
	$best_size:=This:C1470._get_text_best_size(This:C1470._button_OK_label; {min_width: 60})
	This:C1470._form.pages[1].objects.btn_ok.method:="Button_OK_pressed"
	This:C1470._form.pages[1].objects.btn_ok.text:=This:C1470._button_OK_label
	This:C1470._form.pages[1].objects.btn_ok.top:=This:C1470._top_next_widget
	This:C1470._form.pages[1].objects.btn_ok.width:=$best_size.width+40
	This:C1470._form.pages[1].objects.btn_ok.height:=This:C1470._default_font_size+10
	This:C1470._form.pages[1].objects.btn_ok.left:=$button_right_edge_position-This:C1470._form.pages[1].objects.btn_ok.width
	This:C1470._form.pages[1].objects.btn_ok.fontSize:=This:C1470._default_font_size
	$button_right_edge_position-=This:C1470._form.pages[1].objects.btn_ok.width
	$button_right_edge_position-=10  // button gap
	This:C1470._top_next_widget+=This:C1470._form.pages[1].objects.btn_ok.height
	
	If (This:C1470._button_Cancel_label="")
		OB REMOVE:C1226(This:C1470._form.pages[1].objects; "btn_cancel")
	Else 
		$best_size:=This:C1470._get_text_best_size(This:C1470._button_Cancel_label; {min_width: 60})
		This:C1470._form.pages[1].objects.btn_cancel.method:="Button_Cancel_pressed"
		This:C1470._form.pages[1].objects.btn_cancel.text:=This:C1470._button_Cancel_label
		This:C1470._form.pages[1].objects.btn_cancel.top:=This:C1470._form.pages[1].objects.btn_ok.top
		This:C1470._form.pages[1].objects.btn_cancel.width:=$best_size.width+40
		This:C1470._form.pages[1].objects.btn_cancel.height:=This:C1470._form.pages[1].objects.btn_ok.height
		This:C1470._form.pages[1].objects.btn_cancel.left:=$button_right_edge_position-This:C1470._form.pages[1].objects.btn_cancel.width
	End if 
	
	If (This:C1470._button_Third_label="")
		OB REMOVE:C1226(This:C1470._form.pages[1].objects; "btn_third")
	Else 
		$best_size:=This:C1470._get_text_best_size(This:C1470._button_Third_label; {min_width: 60})
		This:C1470._form.pages[1].objects.btn_third.method:="Button_Other_pressed"
		This:C1470._form.pages[1].objects.btn_third.text:=This:C1470._button_Third_label
		This:C1470._form.pages[1].objects.btn_third.top:=This:C1470._form.pages[1].objects.btn_ok.top
		This:C1470._form.pages[1].objects.btn_third.width:=$best_size.width+40
		This:C1470._form.pages[1].objects.btn_third.height:=This:C1470._form.pages[1].objects.btn_ok.height
		This:C1470._form.pages[1].objects.btn_third.left:=20
	End if 
	
	
Function _handle_auto_close_message()
	If (This:C1470._form_data.auto_cancel_in_seconds=0)
		return 
	End if 
	var $auto_cancel_message : Object
	$auto_cancel_message:={}
	$auto_cancel_message.type:="input"
	$auto_cancel_message.top:=This:C1470._top_next_widget
	$auto_cancel_message.left:=20
	$auto_cancel_message.height:=20
	$auto_cancel_message.width:=This:C1470._width-40
	$auto_cancel_message.dataSource:="Form.auto_cancel_message"
	$auto_cancel_message.textAlign:="center"
	$auto_cancel_message.fontStyle:="italic"
	$auto_cancel_message.fill:="transparent"
	$auto_cancel_message.enterable:=False:C215
	$auto_cancel_message.contextMenu:="none"
	$auto_cancel_message.borderStyle:="none"
	This:C1470._form.pages[1].objects.auto_cancel_message:=$auto_cancel_message
	This:C1470._top_next_widget+=10
	
	
Function _get_dialog_rect($height : Integer)->$rect : Object
	$rect:={\
		center_x: Screen width:C187(*)\2; \
		center_y: (Screen height:C188(*)-Menu bar height:C440)\2}
	
	$rect.left:=$rect.center_x-(This:C1470._form.width\2)
	$rect.right:=$rect.left+This:C1470._form.width
	
	$rect.top:=$rect.center_y-(This:C1470._form.height\2)
	$rect.bottom:=$rect.top+This:C1470._form.height
	
	
Function _get_text_best_size($text : Text; $options : Object)->$best_size : Object
	var $currentHeight; $currentWidth : Integer
	OBJECT SET TITLE:C194(*; "text_best_sizer"; $text)
	OBJECT GET COORDINATES:C663(*; "text_best_sizer"; $l; $t; $r; $b)
	OBJECT SET FONT STYLE:C166(*; "text_best_sizer"; Plain:K14:1)
	OBJECT SET FONT SIZE:C165(*; "text_best_sizer"; This:C1470._default_font_size)
	
	If ($options#Null:C1517)
		$options.bold:=($options.bold#Null:C1517) ? $options.bold : False:C215
		$options.italic:=($options.italic#Null:C1517) ? $options.italic : False:C215
		$options.size:=($options.size#Null:C1517) ? $options.size : 0
		Case of 
			: ($options.bold & $options.italic)
				OBJECT SET FONT STYLE:C166(*; "text_best_sizer"; Bold and Italic:K14:9)
			: ($options.bold)
				OBJECT SET FONT STYLE:C166(*; "text_best_sizer"; Bold:K14:2)
			: ($options.italic)
				OBJECT SET FONT STYLE:C166(*; "text_best_sizer"; Italic:K14:3)
		End case 
		
		If ($options.size>0)
			OBJECT SET FONT SIZE:C165(*; "text_best_sizer"; $options.size)
		End if 
	End if 
	
	var $best_width; $best_height; $indent : Integer
	If ($options.indent#Null:C1517)
		$indent:=$options.indent
	End if 
	OBJECT GET BEST SIZE:C717(*; "text_best_sizer"; $best_width; $best_height; This:C1470._form.width-40-$indent)
	
	If ($options.min_width#Null:C1517) && ($best_width<$options.min_width)
		$best_width:=$options.min_width
	End if 
	
	$best_size:={\
		width: $best_width; \
		height: $best_height}
	
	
Function _append_widgets_to_form()
	var $id : Text
	var $index; $widget_indent : Integer
	var $widgets : cs:C1710._widget
	var $add_newline : Boolean
	var $widget_object : Object
	var $widget_max_height : Integer
	var $next_left_position : Integer
	For each ($widgets; This:C1470._widgets)
		$index+=1
		$id:="widget_"+String:C10($index)
		
		$widget_object:=$widgets._widget_json()
		$widget_indent:=$widget_object.left
		$widget_object.top:=This:C1470._top_next_widget
		$widget_object.left+=20
		If ($widget_object.fontSize=Null:C1517)
			$widget_object.fontSize:=This:C1470._default_font_size
		End if 
		If (Not:C34($add_newline))
			$widget_object.left+=$next_left_position
		End if 
		
		If ($widget_max_height<$widget_object.height)
			$widget_max_height:=$widget_object.height
		End if 
		
		$add_newline:=$widgets._append_newline
		If ($add_newline)
			This:C1470._top_next_widget+=$widget_max_height
			This:C1470._top_next_widget+=10  // gap
			$next_left_position:=0  // reset these
			$widget_max_height:=0  // reset these
		Else 
			$next_left_position+=$widget_object.width+10+$widget_indent
		End if 
		
		This:C1470._form.pages[1].objects[$id]:=$widget_object
	End for each 
	