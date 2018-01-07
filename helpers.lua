
local ui = require("ui_framework.ui_framework")

ui:init()

local toPx = ui.screen.toPx -- calculates pints to device pixels. 
--  it calculated value based on divice dpi so you can always use points values  like in letterBox scaling but without this setting. 
-- this is mainly used to get sharp app look and feel.

local colors = ui.colors -- set of pre defined os specyfic colors. 
colors.blue
colors.red
colors.green
colors.black
colors.white
colors.transparent


local device = ui.device
device.isAndroid -- flag to define if device is android
device.isIos -- flag to define if device is android

-- available icons defined. All icons come from ionicons font. you have to get it to use those icons.  http://ionicons.com/
local icon = ui.fonts.icon
icon.home
icon.list