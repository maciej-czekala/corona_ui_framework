-- Examples


local ui = require("ui_framework.ui_framework")
ui:init()


local no_data = ui.newNoData({
	tag = "no_data",
	-- all this optional
	-- config = {
	-- 		width = display.contentWidth - toPx(24),
	-- 		margin = toPx(16),
	-- 		x = 0,
	-- 		y = 0,
	-- 	},
	-- 	image = {
	-- 		fileName = "image.png",
	-- 		width = toPx(128),
	-- 		height = toPx(128),
	-- 		x = 0,
	-- 		y = 0,
	-- 		color = ui.config.primaryColor,
	-- 	},
	-- 	title = {
	-- 		text = "No results found.",
	-- 		x = 0,
	-- 		y = 0,
	-- 		font = native.systemFontBold,
	-- 		fontSize = toPx(24),
	-- 		color = ui.colors.blackLite,
	-- 	},
	-- 	description = {
	-- 		text = "We can't find any items matching your search.",
	-- 		x = 0,
	-- 		y = 0,
	-- 		font = native.systemFont,
	-- 		fontSize = toPx(18),
	-- 		color = ui.colors.grayDark,
	-- 	}
	-------------------
})
no_data.x = display.contentWidth*.5
no_data.y = display.contentHeight*.5

ui.removeNoData("no_data") -- pass tag to remove item anywhere from your code