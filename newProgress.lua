-- Example
-- progress uses scale from 0 to 1. 1 = 100%, 0 = 0%

local ui = require("ui_framework.ui_framework")
ui:init()

local progress = ui.newProgressBar({
	x = x, 
	y = 400, 
	progress = 0
})
progress:setProgress(.5, 500) -- (progress value, progress change transition time)

