//%attributes = {}
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new()\
.default_font_size(14)\
.width(600)\
.ok_button("Continue")\
.cancel_button("Cancel")

cs:C1710.Text.new($dialog; "Personal Information Request").bold().size(20)
cs:C1710.Text.new($dialog; "This is a test of the Dialog component on a mockup of a dialog that asks the user for some personal information using a few different input methods.").indent(20)

cs:C1710.Blank_Line.new($dialog)

cs:C1710.Text.new($dialog; "Name:").bold().no_newline()
cs:C1710.Input.new($dialog).name("first_name")\
.placeholder("First Name").width(120).no_newline()
cs:C1710.Input.new($dialog).name("last_name")\
.placeholder("Last Name").width(150)

cs:C1710.Blank_Line.new($dialog)

cs:C1710.Text.new($dialog; "Select one of the following").bold()
cs:C1710.Checkbox.new($dialog; "Checkbox #1").name("cb_1").indent(40).is_checked().no_newline()
cs:C1710.Checkbox.new($dialog; "Checkbox #2").name("cb_2").indent(40)
cs:C1710.Checkbox.new($dialog; "Checkbox #3").name("cb_3").indent(40).is_checked().no_newline()
cs:C1710.Checkbox.new($dialog; "Checkbox #4").name("cb_4").indent(40)
cs:C1710.Checkbox.new($dialog; "Checkbox #5 - no name").indent(40)

var $form_data : Object
$form_data:=$dialog.display()
