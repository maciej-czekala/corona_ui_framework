
local ui = require("ui_framework.ui_framework")


ui:addColor("green", {117/255, 193/255, 164/255}) -- add color to be available under: ui.colors.xxx
-- if you want to use your own color for theme then add it before init.


ui:init({
	primaryColor = "blue", -- red, greem blue  
	os = "ios", -- force specyfic os style. If not set it will choose style automaticallly based on device os
	screenScale = "manual", -- flag to used screen scaling for better sharpnes. It will use full device resolution.scrollView
	-- make sure to turn of scaling in config file. Use toPx function to calculate point to pixels. 
	enable = {
        scrollView = true,
        loader = true
        }
})

