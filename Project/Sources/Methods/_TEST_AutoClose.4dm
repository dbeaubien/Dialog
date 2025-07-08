//%attributes = {}

var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new()
$dialog.default_font_size(13)
$dialog.ok_button("Done")
//$dialog.auto_cancel_in_seconds(5*60)
//$dialog.auto_cancel_in_seconds(10)
$dialog.auto_cancel_in_seconds((2*60)+10)

cs:C1710.Text.new($dialog; "HEADER").size(24).bold()
cs:C1710.Text.new($dialog; "This is the content of the small alert.")
cs:C1710.Input.new($dialog).name("input_field")
cs:C1710.Text.new($dialog; "This is the content of the small alert."*20).italic().indent(40)

$dialog.display()