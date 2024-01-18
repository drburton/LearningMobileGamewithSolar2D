--Load square png into the variable and locate it toward the top-middle of the device.
local square = display.newImage("Ch3Square.png")
square.x = display.contentWidth/2
square.y = 100

--Load the buttons and locate them toward the bottom center of the device.
local hideButton = display.newImage("Ch3HideButton.png")
hideButton.x = display.contentWidth/2
hideButton.y = display.contentHeight - 300
local showButton = display.newImage("Ch3ShowButton.png")
showButton.x = display.contentWidth/2
showButton.y = display.contentHeight - 200
local fadeButton = display.newImage("Ch3FadeButton.png")
fadeButton.x = display.contentWidth/2
fadeButton.y = display.contentHeight - 100

function hideButton:tap(event)
	square.alpha = 0
end

function showButton:tap(event)
	square.alpha = 1
end

function fadeButton:tap(event)
   if square.alpha == 1 then
  	  transition.to(square, {time=3000, alpha=0})
   else transition.to(square, {time=3000, alpha=1})
   end
end

hideButton:addEventListener("tap", hideButton)
showButton:addEventListener("tap", showButton)
fadeButton:addEventListener("tap", fadeButton)
