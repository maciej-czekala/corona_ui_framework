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

	ui.newSlider( table )

##### ARGS <small>(required)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `x` number, position
##### `y` number, position
##### `touchCallback` function, callback for touch event. Return whole "event" table with "progress" property.
##### `width` number, button width
##### `isActive` bool, inactive does not fire touch events and is at .7 opacity.
##### `progress` initial value of slider. 0 is 0%, 1 is 100%


## Examples

``````lua
local ui = require 'plugin.ui_framework'
ui:init()

ui.newSlider({x = x, y = 350, progress = .5, touchCallback = function(e) print("progress: "..e.progress) end})
``````
