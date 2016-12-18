# corona_ui_framework
documentation for corona ui framework plugin

How To:

[init()](init.markdown)

[newButton()](newButton.markdown)

[newToast()](newToast.markdown)


-- build.settings
``````lua
plugins = {  
        ['plugin.ui_framework'] = {publisherId = 'com.skyjoy'}
    }
``````

-- main.lua
``````lua
local ui = require ("plugin.ui_framework")
ui:init()


local function touch()
	ui.newToast("my toast!")
end

local x = display.contentWidth*.5

ui.newButton({x = x, y = 50, text = "flat", style = "flat", touchCallback = touch})

ui.newButton({x = x, y = 100, text = "flat fill", style = "flat_fill", touchCallback = touch})

ui.newButton({x = x, y = 150, text = "Raised", style = "raised", touchCallback = touch})

ui.newButton({x = x, y = 200, text = "Raised fill", style = "raised_fill", touchCallback = touch})

ui.newButton({x = x, y = 250, text = "+", style = "float", touchCallback = touch})

``````
