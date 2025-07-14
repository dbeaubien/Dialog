## Class Overview

The `cs.Text` class is a 4D component that extends the `_widget` class, designed to represent a text widget within a dialog created by the `cs.Dialog` class. It provides a fluent interface for configuring text properties such as boldness, italics, font size, and indentation.

### Class Constructor
Initializes a new instance of the `cs.Text` class.
- **Parameters**:
  - `$dialog : cs.Dialog` - The parent dialog object to which this text widget belongs.
  - `$text : Text` - The text content to display.
- **Behavior**:
  - Adds the widget to the dialog
  - Sets text to the provided `$text`.
  
## Public Methods

### `bold() : cs.Text`
Sets the text to bold.
- **Returns**: `cs.Text` - The current text widget instance for method chaining.

### `italic() : cs.Text`
Sets the text to italic.
- **Returns**: `cs.Text` - The current text widget instance.

### `size($size : Integer) : cs.Text`
Sets a custom font size for the text.
- **Parameters**:
  - `$size : Integer` - The font size to use (if 0, the dialog's default font size is used).
- **Returns**: `cs.Text` - The current text widget instance.

### `indent($indent : Integer) : cs.Text`
Sets the left indentation for the text.
- **Parameters**:
  - `$indent : Integer` - The indentation in pixels.
- **Returns**: `cs.Text` - The current text widget instance.

### `no_newline() : cs.Text`
Sets the text to not force a new line after the text. Useful if you want the next widget to be on the same 'line'.
- **Returns**: `cs.Text` - The current text widget instance.

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

// Display the dialog
var $result : Object
$result:=$dialog.display()
```
