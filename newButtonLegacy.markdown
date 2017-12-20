# ui.newButton()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](Readme.markdown)
| __Return value__     | group()
| __Keywords__         | 
| __See also__         | 


## Overview

This creates new button object with platform specyfic visuals.


## Syntax

	ui.newButton( table )

##### ARGS <small>(required)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `text` string, lable on the button
##### `x` number, position
##### `y` number, position
##### `touchCallback` function, callback for touch event. Return whole "event" table.
##### `font` string, label font name
##### `fontSize` number, label font size
##### `width` number, button width
##### `minWidth` number, button won't be smaller than this size
##### `height` number, button height
##### `margin` number, label side margin
##### `cornerRadius` number, button corner radius
##### `textColor` table rgb {1,0,0}, label color
##### `fillColor` table rgb {1,0,1}, button background color
##### `shadow` table, shadow options
##### `shadow = {isActive = true}` bool show/hide shadow
##### `touchEffect` enum (string) "android", "ios".
##### `os` enum (string) "android", "ios". Force specyfic look.
##### `isActive` bool, inactive does not fire touch events and is at .7 opacity.
##### `style` enum(string), "flat", "flat_fill", "raised", "raised_fill", "float", "back", "icon" - icon required to provide icon marker for ionicons font. There are available two references for now (ui.fonts.icon.menu, ui.fonts.icon.back)

## Examples

``````lua
local ui = require 'plugin.ui_framework'
ui:init()

ui.newButton( {text = "cancel"} )
``````