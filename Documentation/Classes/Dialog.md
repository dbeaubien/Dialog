## Class Overview

The `cs.Dialog` class is a 4D component designed to create and manage dialog windows with customizable properties, widgets, and buttons. It provides a fluent interface for configuring dialog attributes and supports dynamic form generation.

### Class Constructor
Initializes a new instance of the `cs.Dialog` class with default values:
- Sets default_font_size to 13.
- Sets width to 600.
- Sets button_OK_label to "OK".
- Sets title to an empty string.

## Public Methods

### `title($title : Text) : cs.Dialog`
Sets the dialog's title.
- **Parameters**:
  - `$title : Text` - The title to display in the dialog window.
- **Returns**: `cs.Dialog` - The current dialog instance for method chaining.

### `default_font_size($font_size : Integer) : cs.Dialog`
Sets the default font size for the dialog's text elements.
- **Parameters**:
  - `$font_size : Integer` - The font size to use.
- **Returns**: `cs.Dialog` - The current dialog instance.

### `width($width : Integer) : cs.Dialog`
Sets the width of the dialog window.
- **Parameters**:
  - `$width : Integer` - The width of the dialog in pixels.
- **Returns**: `cs.Dialog` - The current dialog instance.

### `ok_button($label : Text) : cs.Dialog`
Sets the label for the OK button.
- **Parameters**:
  - `$label : Text` - The text to display on the OK button.
- **Returns**: `cs.Dialog` - The current dialog instance.

### `cancel_button($label : Text) : cs.Dialog`
Sets the label for the Cancel button. If set to an empty string, the Cancel button is removed.
- **Parameters**:
  - `$label : Text` - The text to display on the Cancel button.
- **Returns**: `cs.Dialog` - The current dialog instance.

### `other_button($label : Text) : cs.Dialog`
Sets the label for the optional third button. If set to an empty string, the third button is removed.
- **Parameters**:
  - `$label : Text` - The text to display on the third button.
- **Returns**: `cs.Dialog` - The current dialog instance.

### `display() -> $result : Object`
Displays the dialog window, processes user input, and returns the form data.
- **Behavior**:
  - Loads a form template.
  - Configures the form with the specified width and appends widgets.
  - Adjusts button positions and properties based on labels.
  - Opens a movable dialog window centered on the screen.
  - Captures user input.
  - Closes the window.
- **Returns**: `Object` - The form data, including the `button_pressed` property indicating which button was clicked (e.g., "OK", "Cancel", or "Other").
