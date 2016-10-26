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

### Format for `options`

The `options` table contains the following properties:

##### PROPERTY1 <small>(required)</small>
_[TYPE]()._ Short description goes here.


## Examples

``````lua
local ui = require 'plugin.ui_framework'

ui.newButton( {text = "cancel"} )
``````
