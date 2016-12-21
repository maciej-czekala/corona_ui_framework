# corona_ui_framework
IMPORTANT: this plugin requires additional files to fully work.
Please download whole "plugins" folder and place it next to main.lua file in your project. Please place whole folder, do not extract files.

documentation for corona ui framework plugin

How To:

[init()](init.markdown)

[newButton()](newButton.markdown)

[newToast()](newToast.markdown)

[newProgress()](newProgress.markdown)

[newSlider()](newSlider.markdown)

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

local function switchTouch(e)
	ui.newToast("is on: "..tostring(e.isOn))
end

local function sliderTouch(e)
	ui.newToast("progress: "..e.progress)
end

local x = display.contentWidth*.5

ui.newButton({x = x, y = 50, text = "flat", style = "flat", touchCallback = touch})

ui.newButton({x = x, y = 100, text = "flat fill", style = "flat_fill", touchCallback = touch})

ui.newButton({x = x, y = 150, text = "Raised", style = "raised", touchCallback = touch})

ui.newButton({x = x, y = 200, text = "Raised fill", style = "raised_fill", touchCallback = touch})

ui.newButton({x = x, y = 250, text = "+", style = "float", touchCallback = touch})

ui.newSwitch({x = x, y = 300, touchCallback = switchTouch})

ui.newSlider({x = x, y = 350, progress = .5, touchCallback = sliderTouch})

local progress = ui.newProgressBar({x = x, y = 400, progress = 0})
progress:setProgress(.5, 500)

-- can be used for cards etc.
local frame = ui.newFrame({x = x, y = 450, width = 320, height = 50})


local card = ui.newCard({x = 180, y = 350, 
	title = "halo", subtitle = "sub", description = "long description for this cards", width = 320, height = 150,
	buttons = { {text = "close", tag = "action1"}, {text = "hi", touchCallback = function() print("hi") end}  }})

card.buttons["action1"]:setTouchCallback(function() print(card) card:removeSelf()  end)
	

``````
