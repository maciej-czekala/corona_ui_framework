-- 
-- Abstract: PLUGIN_NAME Library Plugin Test Project
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2015 Corona Labs Inc. All Rights Reserved.
--
------------------------------------------------------------
display.setDefault( "background", 1, 1, 1 )
-- Load plugin library

local ui = require ("plugin.ui_framework")
ui:init({screenScale = "manual",
    enable = {
        scrollView = true,
        loader = true
        }})
-- ui:init() -- default screen sacling. Define your scaling in config.lua file. 

-- function to calculate dpi points to pixels if we want to have very sharp app which uses full device resolution.
local toPx = ui.screen.toPx


local function touch()
	ui.newToast("my toast!")
end

local function showLoader()
    local loader = ui.newLoader({tag = "test"})
    loader.x = display.contentWidth*.5
    loader.y = display.contentHeight*.5 - 100

    timer.performWithDelay( 1000, function() ui.removeLoader("test") end )
end

local function switchTouch(e)
	ui.newToast("is on: "..tostring(e.isOn))
end

local function sliderTouch(e)
	ui.newToast("progress: "..e.progress)
end

local x = display.contentWidth*.5



local function buildSearch()
    local search_bar = ui.newSearchbar({
        -- config = {
        --     edittingCallback = function(a,b,c) print(a,b,c) end
        -- }

        })

    search_bar:setCancelTouchCallback(function() print("XXX") display.remove(search_bar) end)
    search_bar:setSubmittedCallback(function(input_value) print(input_value) search_bar:removeFocus() end)
    search_bar.x = display.contentWidth*.5
    search_bar.y = search_bar.height*.5

    local no_data = ui.newNoData({tag = "no_data"})
    no_data.x = display.contentWidth*.5
    no_data.y = display.contentHeight*.5
end
-- navbar requires "http://ionicons.com/" font for icons. Just drop the font next to main.lua file in your project.
local navbar = ui.newNavbar({
    title = "Application", 
    buttons = {
        left = { config = { style = "back", touchCallback = function() print("back touched") end}, label = {text = "home"} },
        right = {
            {config = { style = "icon", touchCallback = function() showLoader() end}, icon = {text = ui.fonts.icon.options} },
            {config = { style = "icon", touchCallback = function() buildSearch() end}, icon = {text = ui.fonts.icon.search} },

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

timer.performWithDelay( 2000, function() tab_menu:setActiveTab(3) end )

-- ui.newButton({x = x*.25, y = toPx(50), style = "back", touchCallback = touch})

local stackPanelCenter = ui.newStackPanel({x = x, y = toPx(100), spacing = toPx(10)})

local btn_flat = ui.newButton({ config = { style = "flat", touchCallback = touch } })
stackPanelCenter:insert(btn_flat)

local btn_fill = ui.newButton({ config = { style = "flat_fill", touchCallback = touch } })
stackPanelCenter:insert(btn_fill)

-- local btn_raised = ui.newButton({ config = { style = "raised", touchCallback = touch } })
-- stackPanelCenter:insert(btn_raised)

-- local btn_raised_fill = ui.newButton({ config = { style = "raised_fill", touchCallback = touch } })
-- stackPanelCenter:insert(btn_raised_fill)

local input = ui.newInput({
    config = {
        -- style = "search",
        isSecure = false, 
        -- submittedCalllback = function(value) print(value) end, 
    },
    placeholder = {
        text = "login"
    }
})

local input_2 = ui.newInput({
    config = {
        isSecure = true, 
        -- submittedCalllback = function(value) print(value) end, 
    },
    placeholder = {
        text = "password"
    }
})

stackPanelCenter:insert(input)
stackPanelCenter:insert(input_2)


input:setSubmittedCallback(function() input_2:setFocus() end)
input_2:setSubmittedCallback(function() input_2:removeFocus() end)



timer.performWithDelay( 6000, function() 
    -- print(input:getValue())
    -- input:setText("asd")
    -- input:setFocus()
    end )


local stackPanelRight = ui.newStackPanel({x = display.contentWidth - display.contentWidth*.125, y = toPx(100), spacing = toPx(10)})

local btn_float = ui.newButton({ config = { style = "float", touchCallback = touch } })
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
	local card = ui.newCard({x = 200, y = 100, 
		title = "halo", subtitle = "sub", description = "long description for this cards", width = toPx(320), height = 150,
		buttons = { {text = "action1", tag = "action1"}, {text = "hi", touchCallback = function() end}  }})

	card.buttons["action1"]:setTouchCallback(function() print(card) card:removeSelf()  end)
end

local btn_card = ui.newButton({ config = {text = "show card", style = "raised", 
	touchCallback = newCard} })
stackPanelRight:insert(btn_card)



-- local widget = require( "widget" )

-- local function onRowRender(e)
-- 	local row = e.row

--     -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
--     local rowHeight = row.contentHeight
--     local rowWidth = row.contentWidth

--     --rowRenderer()
--     row:insert(ui.newRow({title = "halo"..row.params, width = rowWidth}))
--     print("row rendered")
-- end

-- local tableView = widget.newTableView(
--     {
--         left = 0,
--         top = toPx(108),
--         height = display.contentHeight - toPx(100),
--         width = display.contentWidth*.25,
--         onRowRender = onRowRender,
--         --noLines = true,
--         onRowTouch = function(e) ui.newToast("progress: "..e.row.params) end,
--         --listener = scrollListener
--     })

-- for i = 1, 40 do

--     -- Insert a row into the tableView
--     tableView:insertRow(
--         {
--             isCategory = false,
--             rowHeight = toPx(48),
--             rowColor = { default={1,1,1}, over={1,0.5,0,0.2} },
--             --lineColor = { 0.5, 0.5, 0.5 }
--             params = i
--         }
--     )
-- end


tab_menu:toFront()

-- local myWidget = require("plugin.ui_framework.libs.widget")


local function onRowRender2(e)
    local row = e.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rect = display.newRect( 0, 0, rowWidth, rowHeight )
    rect:setFillColor( 1,0,0 )

    local text = display.newText( {text = row.params} )
    
    row:insert(rect)
    row:insert(text)
    -- print("row rendered")
end


-- local rect = display.newRect( 0, 0, 200, 200 )

-- timer.performWithDelay( 10000, function() display.getCurrentStage():setFocus( nil ) end )

local tableView = ui.newScrollView(
    {
        left = 0,
        top = toPx(108),
        height = display.contentHeight - toPx(160),
        width = toPx(160),
        horizontalScrollDisabled = true,
        columns = 1,
        verticalSpacing = toPx(1), 
        onRowRender = onRowRender2,
        -- onTakeFocus = function(e) display.getCurrentStage():setFocus( rect )  end,

        --noLines = true,
        onRowTouch = function(e) 
            -- ui.newToast("progress: "..e.target.params) 
            print(e.target)
        end,
        --listener = scrollListener
    })


for i = 1, 20 do

--     -- Insert a row into the tableView
local size = ui.helper.ratio({ratio = "16:9", height = toPx(30)})
--print(toPx(30))
    tableView:insertItem(
        {
            rowHeight = toPx(30),
            rowWidth = size.width,
            params = i
        }
    )
end

tableView:updateScrollSize()

-- timer.performWithDelay( 1000, 
--     function() 
--         --display.remove(tableView) 
--         -- tableView:removeItem(3)
--         tableView:removeAllItems()   
--     end )

-- timer.performWithDelay( 3000, 
--     function() 
--         print("re render")
--         for i = 1, 2 do

--         --     -- Insert a row into the tableView
--             tableView:insertItem(
--                 {
--                     rowHeight = toPx(30),
--                     rowWidth = toPx(30),
--                     params = i
--                 }
--             )
--         end
--     end )
-- local group = display.newGroup()
-- ui.downloadImage:get({group = group, id = "icon", url = "https://dl.dropboxusercontent.com/u/1214188/Geemzo/Dr%20Doktor%20-%20promo%20pack/icon.jpg", params = { width = toPx(50), height = toPx(50), x = 100, y = 100}})
