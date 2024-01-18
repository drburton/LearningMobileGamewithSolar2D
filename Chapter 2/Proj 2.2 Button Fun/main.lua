local myButton = display.newImage( "button.png" )
myButton.x = display.contentWidth /2

myButton.y = display.contentHeight - 75

local textObj = display.newText("Button Tapped", 10, 50, native.systemFont, 24)
textObj:setTextColor(1,1,1)

local w = textObj.width
local h = textObj.height

function moveButtonDown( event )
    textObj.x = math.random(w/2, display.contentWidth - (w/2))
    textObj.y = math.random(h/2, display.contentHeight -(100 + h/2))
end

myButton:addEventListener( "tap", moveButtonDown )


