local myButton = display.newImage( "button.png" )
myButton.x = display.contentWidth /2
myButton.y = display.contentHeight/2


local textobj = display.newText("Button Tapped", 10, 50,native.systemFont, 24)
textobj:setTextColor(1,1,1)

function moveButtonDown( event )

	textobj.y = textobj.y + 50

end
 
myButton:addEventListener( "tap", moveButtonDown )