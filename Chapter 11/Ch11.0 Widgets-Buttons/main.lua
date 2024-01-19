-- Project: Ch11.0 Widgets

local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )
    local phase = event.phase 

    if "ended" == phase then
        print( "You pressed and released a button!" )
    end
end

-- Create the button
local myButton = widget.newButton
{
    left = 100,
    top = 200,
    width = 150,
    height = 50,
    defaultFile = "default.png",
    overFile = "over.png",
    id = "button_1",
    label = "Button",
    onEvent = handleButtonEvent,
}


