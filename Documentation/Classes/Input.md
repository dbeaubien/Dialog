## Class Overview

The `cs.Input` class is a 4D component that extends the `_widget` class, designed to represent a text input field within a dialog created by the `cs.Dialog` class. It provides a fluent interface for configuring input field properties such as name, value, width, placeholder, and text styling options.

### Class Constructor
Initializes a new instance of the `cs.Input` class.
- **Parameters**:
  - `$dialog : cs.Dialog` - The parent dialog object to which this input widget belongs.
- **Behavior**:
  - Calls the parent `_widget` class constructor with the provided `$dialog`.
  - Sets `_width` to 250.
  - Initializes `_options` with default values: `bold: False`, `italic: False`, `size: 0`, `indent: 0`.
  - Sets `_name` to a unique identifier (`"input_" + Generate UUID`).
  - Sets `_value` to an empty string.
  - Sets `_placeholder` to an empty string.

## Public Methods

### `bold() : cs.Input`
Sets the input text to bold.
- **Returns**: `cs.Input` - The current input widget instance for method chaining.

### `italic() : cs.Input`
Sets the input text to italic.
- **Returns**: `cs.Input` - The current input widget instance.

### `size($size : Integer) : cs.Input`
Sets a custom font size for the input text.
- **Parameters**:
  - `$size : Integer` - The font size to use (if 0, the dialog's default font size is used).
- **Returns**: `cs.Input` - The current input widget instance.

### `name($name : Text) : cs.Input`
Sets the unique identifier for the input field.
- **Parameters**:
  - `$name : Text` - The name to use as the data source key in the dialog's form data.
- **Returns**: `cs.Input` - The current input widget instance.

### `placeholder($placeholder : Text) : cs.Input`
Sets the placeholder text for the input field.
- **Parameters**:
  - `$placeholder : Text` - The placeholder text to display when the input is empty.
- **Returns**: `cs.Input` - The current input widget instance.

### `indent($indent : Integer) : cs.Input`
Sets the left indentation for the input field.
- **Parameters**:
  - `$indent : Integer` - The indentation in pixels.
- **Returns**: `cs.Input` - The current input widget instance.

### `width($width : Integer) : cs.Input`
Sets the width of the input field.
- **Parameters**:
  - `$width : Integer` - The width in pixels.
- **Returns**: `cs.Input` - The current input widget instance.

### `value($value : Text) : cs.Input`
Sets the initial value of the input field.
- **Parameters**:
  - `$value : Text` - The initial text value.
- **Returns**: `cs.Input` - The current input widget instance.

### `no_newline() : cs.Input`
Sets the input field to not force a new line after the input. Useful if you want the next widget to be on the same 'line'.
- **Returns**: `cs.Input` - The current input widget instance.


## Usage Example
```4d
var $dialog : cs.Dialog
$dialog:=cs.Dialog.new()\
  .default_font_size(14)\
  .width(600)\
  .ok_button("Continue")\
  .cancel_button("Cancel")

cs.Text.new($dialog; "Personal Information Request").bold().size(20)
cs.Text.new($dialog; "This is a test of the Dialog component on a mockup of a dialog that asks the user for some personal information using a few different input methods.").indent(20)

cs.Blank_Line.new($dialog)

cs.Text.new($dialog; "Name:").bold().no_newline()
cs.Input.new($dialog).name("first_name")\
  .placeholder("First Name").width(120).no_newline()
cs.Input.new($dialog).name("last_name")\
  .placeholder("Last Name").width(150)

cs.Blank_Line.new($dialog)

cs.Text.new($dialog; "Select one of the following").bold()
cs.Checkbox.new($dialog; "Checkbox #1").name("cb_1").indent(40).is_checked().no_newline()
cs.Checkbox.new($dialog; "Checkbox #2").name("cb_2").indent(40)
cs.Checkbox.new($dialog; "Checkbox #3").name("cb_3").indent(40).is_checked().no_newline()
cs.Checkbox.new($dialog; "Checkbox #4").name("cb_4").indent(40)
cs.Checkbox.new($dialog; "Checkbox #5 - no name").indent(40)

var $form_data : Object
$form_data:=$dialog.display()

if ($result.button_pressed="OK")
 var $name : Text
 $name:=$result.first_name + " " + $result.last_name
end if
```
