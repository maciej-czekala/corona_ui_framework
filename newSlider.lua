-- Examples
-- progress uses scale from 0 to 1. 1 = 100%, 0 = 0%

local ui = require 'plugin.ui_framework'
ui:init()

local slider = ui.newSlider({
	x = x, 
	y = 350, 
	-- width = display.contentWidth,
	-- height = 5,
	progress = .5, 
	touchCallback = 
		function(e) 
			print("progress: "..e.progress) 
		end
})

-- slider:setProgress(.5)
-- slider:setIsActive(true)
-- slider:setTouchCallback(function() end) -- callback can be set later on.