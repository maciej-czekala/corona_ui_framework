-- Examples
-- progress uses scale from 0 to 1. 1 = 100%, 0 = 0%

local ui = require 'plugin.ui_framework'
ui:init()

ui.newSlider({
	x = x, 
	y = 350, 
	progress = .5, 
	touchCallback = 
		function(e) 
			print("progress: "..e.progress) 
		end
})
