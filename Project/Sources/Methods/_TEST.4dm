//%attributes = {"preemptive":"capable"}

var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new()\
.default_font_size(13)\
.width(500)\
.ok_button("Continue")\
.cancel_button("Cancel")\
.other_button("A 3rd Option")

cs:C1710.Text.new($dialog; "Header for dialog").bold().size(18)
cs:C1710.Text.new($dialog; "Some text. Like a paragraph.").indent(20)
cs:C1710.Blank_Line.new($dialog)
cs:C1710.Text.new($dialog; "Select one of the following").bold()
cs:C1710.Checkbox.new($dialog; "Checkbox #1").name("cb_1").indent(20).is_checked()
cs:C1710.Checkbox.new($dialog; "Checkbox #2").name("cb_2").indent(20)
cs:C1710.Checkbox.new($dialog; "Checkbox #3").name("cb_3").indent(20).is_checked()
cs:C1710.Checkbox.new($dialog; "Checkbox #4").name("cb_4").indent(20)
cs:C1710.Checkbox.new($dialog; "Checkbox #5 - no name").indent(20)
cs:C1710.Text.new($dialog; "please select one").italic().size(10).indent(20)
cs:C1710.Blank_Line.new($dialog)
cs:C1710.Text.new($dialog; "Type your name:").bold()
cs:C1710.Input.new($dialog).name("first_name").value("Dude").indent(20).width(150).size(24)
cs:C1710.Input.new($dialog).name("last_name")\
.placeholder("Last Name").indent(20).width(250)\
.bold()

var $form_data : Object
$form_data:=$dialog.display()
