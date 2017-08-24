# ui.newNavbar()

|                      | &nbsp; 
| -------------------- | ---------------------------------------------------------------
| __Type__             | [function](http://docs.coronalabs.com/api/type/Function.html)
| __Library__          | [ui.*](Readme.markdown)
| __Return value__     | group()
| __Keywords__         | 
| __See also__         | 


## Overview

This creates new grid panel object.


## Syntax

	ui.newGridPanel( table )

##### ARGS <small>(required)</small>
_[Table](http://docs.coronalabs.com/api/type/Table.html)._ Short description goes here.

### Available `args`

##### `width` number
##### `height` number
##### `debug` bool
##### `columns` table, {"*",20,"20"}
##### `rows` table {"*",20,"20"}
##### `x` number
##### `y` number 


## Examples

``````lua
local ui = require 'plugin.ui_framework'
ui:init()

local gridPanel = ui.newGridPanel({
  width = 200,
  height = 200,
  rows = {"*","*"},
  columns = {"*","*"},
  debug = true
})

local rect = display.newRect(0,0, 20, 20)
rect.grid = {row = 1, columns = 2} -- each display object requires grid table with column and row index values. this allows object to be inserted in correct cell.
gridPanel:insert(rect) -- object has to be inserted into grid panel, cannot be added at object created. First create object and then insert it into gridPanel.

``````
