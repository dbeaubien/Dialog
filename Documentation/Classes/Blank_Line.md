## Class Overview

The `cs.Blank_Line` class is a 4D component that is designed to represent a blank line within a dialog created by the `cs.Dialog` class.

### Class Constructor
Initializes a new instance of the `cs.Blank_Line` class.

## Usage Example
```4d
var $dialog : cs.Dialog
$dialog:=cs.Dialog.new()\
   .title("Message")\
   .width(400)\
   .ok_button("OK")

cs.Text.new($dialog; "Welcome to the dialog!")\
   .bold().italic().size(16)

cs.Text.new($dialog; "This is a text line that has been indented 10 pixels.").indent(10)
cs.Blank_Line.new($dialog)
cs.Blank_Line.new($dialog)
cs.Text.new($dialog; "This is another text line that has been indented 10 pixels.").indent(10)

// Display the dialog
var $result : Object
$result:=$dialog.display()
```
