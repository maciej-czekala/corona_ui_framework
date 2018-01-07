-- Example

local loader = ui.newLoader({
	tag = "test" -- optional
})
loader.x = display.contentWidth*.5
loader.y = display.contentHeight*.5

timer.performWithDelay( 1000, 
	function() 
		ui.removeLoader("test") -- remove loader  based on tag. no need to reference
		-- or
		-- display.remove(loader)
	end )