# ui:init()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](Readme.markdown)
| __Return value__     | none
| __Keywords__         | 
| __See also__         | 


## Overview

Initializes ui framework. Framework won't work without init().


## Syntax

	ui:init( table )

##### ARGS <small>(optional)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `themeColor` enum (string), base theme color for all ui elements. Available: "blue", "red", "gray"
##### `os` enum (string) "android", "ios". Force specyfic look on all elements.

## Examples

``````lua
local ui = require("ui_framework.ui_framework")
ui:init({themeColor = "blue", os = "ios"})
``````
