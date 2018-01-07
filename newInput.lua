-- Example

local input_login = ui.newInput({
    config = {
        -- submittedCalllback = function(value) print(value) end, 
        x = 100,
        y = 200
    },
    placeholder = {
        text = "login"
    }
})

local input_password = ui.newInput({
    config = {
        isSecure = true, -- flag for protected vinput value
        -- submittedCalllback = function(value) print(value) end, -- you can define callback here or  after input construction.
        x = 100,
        y = 200
    },
    placeholder = {
        text = "password"
    }
})


-- move to next input on return pressed
input_login:setSubmittedCallback(
	function() 
		input_password:setFocus() 
	end)

input_password:setSubmittedCallback(
	function() 
		input_password:removeFocus() 
	end)



input_login:getValue() -- get value for a specyfic input
input_login:setText("asd") -- set value text on input
input_login:setFocus() -- set focus on input - keyboard will show
