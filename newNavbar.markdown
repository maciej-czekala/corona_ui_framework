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

{
	title = "Application", -- title
	buttons = {
	    left = { }, -- fingle button -- look at button configuration. it is the same.
	    right = { -- list of buttons from right
	        {},
	        {},
	    }
	},
	isAndroid = true, -- optional
	isIos = false, -- optional
	parent = group -- optional
}


## Examples

``````lua
local ui = require 'plugin.ui_framework'
ui:init()

ocal navbar = ui.newNavbar({
    title = "Application", 
    buttons = {
        left = { config = { style = "back", touchCallback = function() print("back touched") end}, label = {text = "home"} },
        right = {
            {config = { style = "icon", touchCallback = function() print("options touched") end}, icon = {text = ui.fonts.icon.options} },
            {config = { style = "icon", touchCallback = function() print("search touched") end}, icon = {text = ui.fonts.icon.search} },

        } 
    }})
navbar.x = display.contentWidth*.5
navbar.y = navbar.height*.5
``````
