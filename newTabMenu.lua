-- Example


-- tabs component by default has screen width
-- for correct look and feel on both platforms use label and icon setting. 
-- icon is only used on iOS

local tab_menu = ui.newTabMenu({
	parent = parentGroup,
    x = display.contentWidth*.5,
    tabs = {
        { label = {text = "home"}, icon = {text = ui.fonts.icon.home } },
        { label = {text = "list"}, icon = {text = ui.fonts.icon.list } },
        { label = {text = "list"}, icon = {text = ui.fonts.icon.list } },
        
    },
    touchCallback = function(e) print(e) end
    })

-- or set call back after render
-- tab_menu:setTouchCallback(function(e) print(e) end)

-- based on device you are on, set proper position. Normally tabs on android are at the top, and iOS at the bottom of the screen.
if ui.device.isAndroid then
    tab_menu.y = tab_menu.height*.5
elseif ui.device.isIos then
    tab_menu.y = display.contentHeight - tab_menu.height*.5
end

-- you can set active tab manually. Changing tab does not fire touchCallback.
tab_menu:setActiveTab(3)