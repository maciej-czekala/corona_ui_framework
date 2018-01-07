
local ui = require("ui_framework.ui_framework")


ui:addColor("green", {117/255, 193/255, 164/255}) -- add color to be available under: ui.colors.xxx
-- if you want to use your own color for theme then add it before init.


ui:init({
	themeColor = "blue", -- red, greem blue  
	os = "ios"
})

