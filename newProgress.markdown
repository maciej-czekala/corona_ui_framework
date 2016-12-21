# ui.newProgress()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](progress.markdown)
| __Return value__     | group
| __Keywords__         | 
| __See also__         | 


## Overview

Created progress bard control.


## Syntax

	ui.newProgress( table )

##### ARGS <small>(optional)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `x` number
##### `y` number
##### `width` numbe
##### `progress` number (0-1) 0 == 0%, 1 == 100%
##### `setProgress(progress, tansitionTime)` function. 
## Examples

``````lua
local ui = require("ui_framework.ui_framework")
ui:init()

local progress = ui.newProgressBar({x = x, y = 400, progress = 0})
progress:setProgress(.5, 500)
``````
