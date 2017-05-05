# ui.newNavbar()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](Readme.markdown)
| __Return value__     | group()
| __Keywords__         | 
| __See also__         | 


## Overview

This creates new navbar object with platform specyfic visuals.


## Syntax

	ui.newNavbar( table )

##### ARGS <small>(required)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `title` string, lable
##### `x` number, position
##### `y` number, position (bar is always anchorY = 0, it starts from y = 0 position)
##### `buttons` table - right now only back button is supported. define like normal button only within "back" key in table. Look at example.
##### `font` string, title font name
##### `fontSize` number, title font size
##### `width` number, whole bar
##### `height` number, button height
##### `textColor` table rgb {1,0,0}, label color
##### `fillColor` table rgb {1,0,1}, button background color
##### `os` enum (string) "android", "ios". Force specyfic look.
##### `iconMargin` for left button. - only android
##### `titleMargin` title text left margin - only android


## Examples

``````lua
local ui = require 'plugin.ui_framework'
ui:init()

ui.newNavbar({title = "Home"})
ui.newNavbar({title = "Application", buttons = {back = {text = "home", touchCallback = function() print("back touched") end}}})
``````
