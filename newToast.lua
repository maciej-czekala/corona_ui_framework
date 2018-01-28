-- Examples


local ui = require("ui_framework.ui_framework")
ui:init()


--ui.newToast("my toast!", 5000) -- (string, hide delay) 
ui.newToast({label = {text = "my toast!"}}) -- pass string to be displayed

-- ui.newToast({config = {color = {1,1,1}, x = 100, y = 100} label = {text = "my toast!", color = {1,0,0} } })

