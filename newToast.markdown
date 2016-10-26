# ui.newToast()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](Readme.markdown)
| __Return value__     | none
| __Keywords__         | 
| __See also__         | 


## Overview

Create none interactive message called Toast. This is corona based control.


## Syntax

	ui.newToast( string )

##### ARG <small>(string)</small>

message which should be displayed.

## Examples

``````lua
local ui = require("ui_framework.ui_framework")
ui:init()
ui.newToast("my toast!")
``````
