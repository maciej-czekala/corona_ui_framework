# corona_ui_framework
IMPORTANT: this plugin requires additional files to fully work.
Please download whole "plugin" folder and place it next to main.lua file in your project. Please place whole folder, do not extract files.

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
display.setDefault( "background", 1, 1, 1 )
-- Load plugin library
local ui = require ("plugin.ui_framework")
ui:init({screenScale = "manual"})

-- function to calculate dpi points to pixels if we want to have very sharp app which uses full resolution.
local toPx = ui.screen.toPx


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

-- navbar requires "http://ionicons.com/" font for icons. Just drop the font next to main.lua file in your project.
local navbar = ui.newNavbar({title = "Application", buttons = {back = {text = "home", touchCallback = function() print("back touched") end}}})
navbar.x = display.contentWidth*.5

-- ui.newButton({x = x*.25, y = toPx(50), style = "back", touchCallback = touch})

ui.newButton({x = x, y = toPx(100), style = "flat", touchCallback = touch})

ui.newButton({x = x, y = toPx(150), style = "flat_fill", touchCallback = touch})

ui.newButton({x = x, y = toPx(200), style = "raised", touchCallback = touch})

ui.newButton({x = x, y = toPx(250), style = "raised_fill", touchCallback = touch})

ui.newButton({x = x, y = toPx(300), style = "float", touchCallback = touch})

local switch = ui.newSwitch({x = x, y = toPx(350), touchCallback = switchTouch})

local slider = ui.newSlider({x = x, y = toPx(400), progress = .5, touchCallback = sliderTouch})

local progress = ui.newProgressBar({x = x, y = toPx(450), progress = 0})
progress:setProgress(.5, 500)

local frame = ui.newFrame({x = x, y = toPx(500), width = 320, height = 50})


local function newCard()
	local card = ui.newCard({x = 180, y = 350, 
		title = "halo", subtitle = "sub", description = "long description for this cards", width = toPx(320), height = 150,
		buttons = { {text = "action1", tag = "action1"}, {text = "hi", touchCallback = function() end}  }})

	card.buttons["action1"]:setTouchCallback(function() print(card) card:removeSelf()  end)
end

ui.newButton({x = x, y = toPx(500), text = "show card", style = "raised", touchCallback = newCard})



local widget = require( "widget" )

local function onRowRender(e)
	local row = e.row
    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    --rowRenderer()
    row:insert(ui.newRow({title = "halo"..row.params, width = rowWidth}))
    print("row rendered")
end

local tableView = widget.newTableView(
    {
        left = 0,
        top = display.contentHeight - toPx(100),
        height = toPx(100),
        width = display.contentWidth,
        onRowRender = onRowRender,
        --noLines = true,
        onRowTouch = function(e) ui.newToast("progress: "..e.row.params) end,
        --listener = scrollListener
    })

for i = 1, 40 do
    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = false,
            rowHeight = toPx(48),
            rowColor = { default={1,1,1}, over={1,0.5,0,0.2} },
            --lineColor = { 0.5, 0.5, 0.5 }
            params = i
        }
    )
end
	

``````

-- config.lua
``````lua
application = 
{
	content = 
	{
		--scale = "adaptive", -- remove scaling if you want to use screenScale = "manual"
		fps = 60,
		imageSuffix =
		{
			["@2x"] = 1.3,
			["@3x"] = 2.6,
		}
	},
}
``````
