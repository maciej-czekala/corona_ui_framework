# corona_ui_framework
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
-- ui:init() -- default screen sacling. Define your scaling in config.lua file. 

-- function to calculate dpi points to pixels if we want to have very sharp app which uses full device resolution.
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
local navbar = ui.newNavbar({
    title = "Application", 
    buttons = {
        left = { config = { style = "back", touchCallback = function() print("back touched") end}, label = {text = "home"} },
        right = {
            {config = { style = "icon", touchCallback = function() print("back touched") end}, icon = {text = ui.fonts.icon.options} },
            {config = { style = "icon", touchCallback = function() print("back touched") end}, icon = {text = ui.fonts.icon.search} },

        } 
    }})
navbar.x = display.contentWidth*.5
navbar.y = navbar.height*.5

local tab_menu = ui.newTabMenu({
    x = display.contentWidth*.5,
    tabs = {
        { label = {text = "home"}, icon = {text = ui.fonts.icon.home } },
        { label = {text = "list"}, icon = {text = ui.fonts.icon.list } },
        { label = {text = "list"}, icon = {text = ui.fonts.icon.list } },
        
    },
    touchCallback = function(e) print(e) end
    })
if ui.device.isAndroid then
    tab_menu.y = navbar.y + navbar.height*.5 + tab_menu.height*.5
elseif ui.device.isIos then
    tab_menu.y = display.contentHeight - tab_menu.height*.5
end

-- ui.newButton({x = x*.25, y = toPx(50), style = "back", touchCallback = touch})

local stackPanelCenter = ui.newStackPanel({x = x, y = toPx(100), spacing = toPx(10)})

local btn_flat = ui.newButton({style = "flat", touchCallback = touch})
stackPanelCenter:insert(btn_flat)

local btn_fill = ui.newButton({style = "flat_fill", touchCallback = touch})
stackPanelCenter:insert(btn_fill)

local btn_raised = ui.newButton({style = "raised", touchCallback = touch})
stackPanelCenter:insert(btn_raised)

local btn_raised_fill = ui.newButton({style = "raised_fill", touchCallback = touch})
stackPanelCenter:insert(btn_raised_fill)


local stackPanelRight = ui.newStackPanel({x = display.contentWidth*.75, y = toPx(100), spacing = toPx(10)})

local btn_float = ui.newButton({style = "float", touchCallback = touch})
stackPanelRight:insert(btn_float)

local switch = ui.newSwitch({touchCallback = switchTouch})
stackPanelRight:insert(switch)

local slider = ui.newSlider({width = display.contentWidth*.25, progress = .5, touchCallback = sliderTouch})
stackPanelRight:insert(slider)

local progress = ui.newProgressBar({width = display.contentWidth*.25, progress = 0})
progress:setProgress(.5, 500)
stackPanelRight:insert(progress)

local frame = ui.newFrame({width = display.contentWidth*.25, height = toPx(50)})
stackPanelRight:insert(frame)


local function newCard()
	local card = ui.newCard({x = 180, y = 350, 
		title = "halo", subtitle = "sub", description = "long description for this cards", width = toPx(320), height = 150,
		buttons = { {text = "action1", tag = "action1"}, {text = "hi", touchCallback = function() end}  }})

	card.buttons["action1"]:setTouchCallback(function() print(card) card:removeSelf()  end)
end

local btn_card = ui.newButton({text = "show card", style = "raised", 
	touchCallback = newCard})
stackPanelRight:insert(btn_card)



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
        top = toPx(108),
        height = display.contentHeight - toPx(100),
        width = toPx(200),
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

tab_menu:toFront()


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
