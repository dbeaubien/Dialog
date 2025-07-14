## Class Overview

The `cs.Checkbox` class is a 4D component that extends the `_widget` class, designed to represent a checkbox widget within a dialog created by the `cs.Dialog` class. It provides a fluent interface for configuring checkbox properties such as label, name, checked state, and text styling options.

### Class Constructor
Initializes a new instance of the `cs.Checkbox` class.
- **Parameters**:
  - `$dialog : cs.Dialog` - The parent dialog object to which this checkbox widget belongs.
  - `$label : Text` - The text label to display next to the checkbox.
- **Behavior**:
  - Calls the parent `_widget` class constructor with the provided `$dialog`.
  - Sets `_label` to the provided `$label`.
  - Sets `_is_checked` to `False`.
  - Initializes `_options` with default values: `bold: False`, `italic: False`, `size: 0`, `indent: 0`.
  - Sets `_name` to a unique identifier (`"cb_" + Generate UUID`).

## Public Methods

### `name($name : Text) : cs.Checkbox`
Sets the unique identifier for the checkbox.
- **Parameters**:
  - `$name : Text` - The name to use as the data source key in the dialog's form data.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance for method chaining.

### `bold() : cs.Checkbox`
Sets the checkbox label to bold.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

### `italic() : cs.Checkbox`
Sets the checkbox label to italic.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

### `size($size : Integer) : cs.Checkbox`
Sets a custom font size for the checkbox label.
- **Parameters**:
  - `$size : Integer` - The font size to use (if 0, the dialog's default font size is used).
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

### `indent($indent : Integer) : cs.Checkbox`
Sets the left indentation for the checkbox.
- **Parameters**:
  - `$indent : Integer` - The indentation in pixels.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

### `no_newline() : cs.Checkbox`
Sets the checkbox to not force a new line after the checkbox. Useful if you want the next widget to be on the same 'line'.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

### `is_checked() : cs.Checkbox`
Sets the checkbox to be initially checked.
- **Returns**: `cs.Checkbox` - The current checkbox widget instance.

## Usage Example
```4d
var $dialog : cs.Dialog
$dialog:=cs.Dialog.new()\
   .title("Message")\
   .width(400)\
   .ok_button("OK")\
   .cancel_button("Cancel")

cs.Text.new($dialog; "Welcome to the dialog!")\
   .bold().italic().size(16)

cs.Text.new($dialog; "Options:").indent(10)
cs.Checkbox.new($dialog; "Option #1").name("cb_1").indent(20).is_checked()
cs.Checkbox.new($dialog; "Option #2").name("cb_2").indent(20)

// Display the dialog
var $result : Object
$result:=$dialog.display()

if ($result.button_pressed="OK")
 var $cb_1;$cb_2 : Boolean
 $cb_1:=$result.cb_1
 $cb_2:=$result.cb_2
end if
```
