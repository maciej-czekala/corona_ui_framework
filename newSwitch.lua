-- Examples

local ui = require 'plugin.ui_framework'
ui:init()

local switch = ui.newSwitch({
	x = 100, 
	y = 100, 
	-- transitionTime = 350, -- optional
	-- circleColorOn = {1,1,1}, -- optional, android will use primatyColor if not set. iOS will have it Green.
	-- circleColorOff = colors.white, -- optional, system will use white if not set
	touchCallback = 
		function(e) 
			print(e.isOn) 
		end
})

-- switch:setOn(true) -- false
-- switch:toggle() -- change on / off
-- switch:setIsActive(true) -- false
-- switch:setTouchCallback(function() end)