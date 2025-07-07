//%attributes = {"preemptive":"capable"}

// small alert
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new().default_font_size(13).title("")\
.ok_button("This is the OKAY button")\
.cancel_button("Cancel")\
.other_button("poop")
cs:C1710.Text.new($dialog; "HEADER").size(24).bold()
cs:C1710.Text.new($dialog; "This is the content of the small alert.")
cs:C1710.Text.new($dialog; "This is the content of the small alert."*20).italic().indent(40)
$dialog.display()


//ALERT("This is the content of the small alert. This is the content of the small alert.")

// small alert
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new().default_font_size(13)
cs:C1710.Text.new($dialog; "This is the content of the small alert. This is the content of the small alert.")
$dialog.display()

// small bolded alert
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new().title("small bolded alert")
cs:C1710.Text.new($dialog; "This is the content of the small alert. This is the content of the small alert.")\
.bold()
cs:C1710.Text.new($dialog; "This is the content of the small alert.").italic().indent(10)
cs:C1710.Text.new($dialog; "This is the content of the small alert.").bold().italic().indent(20)
cs:C1710.Blank_Line.new($dialog)
cs:C1710.Blank_Line.new($dialog)
cs:C1710.Text.new($dialog; "This is the content of the small alert.").indent(10)
$dialog.display()


// large alert
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new().width(800).ok_button("Continue").title("Large Alert")
cs:C1710.Text.new($dialog; "This is the content of the large alert. This is the content of the large alert.\r"*10)
$dialog.display()

// small Confirm
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new()\
.title("Small Confirm")\
.width(400)\
.ok_button("Continue")\
.cancel_button("Abort Everything")
cs:C1710.Text.new($dialog; "This is the content of the large alert. This is the content of the large alert.\r"*10)
$dialog.display()


// small Confirm with 3rd button
var $dialog : cs:C1710.Dialog
$dialog:=cs:C1710.Dialog.new()\
.title("Small Confirm")\
.width(1000)\
.ok_button("Continue")\
.cancel_button("Abort Everything")\
.other_button("Do something else...")
cs:C1710.Text.new($dialog; "This is the content of the large alert. This is the content of the large alert.\r"*10)
$dialog.display()
