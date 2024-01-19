-- Project: Ch 12.1 Gyroscope

-- Hide the status bar.
display.setStatusBar(display.HiddenStatusBar)

-- Draw X and Y axes.
local xAxis = display.newLine(0, display.contentHeight / 2, display.contentWidth, display.contentHeight / 2)
xAxis:setStrokeColor( 0, 1, 1, .5 )
local yAxis = display.newLine(display.contentWidth / 2, 0, display.contentWidth / 2, display.contentHeight)
yAxis:setStrokeColor( 0, 1, 1, .5 )

-- Displays App title
local title = display.newText( "Gyroscope", 0, 20, nil, 20 )
title.x = display.contentWidth / 2
title:setFillColor( 1, 1, 0 )

-- Notify the user if the device does not have a gyroscope.
if not system.hasEventSource("gyroscope") then
	local msg = display.newText( "Gyroscope sensor not found!", 0, 55, nil, 13 )
	msg.x = display.contentWidth / 2
	msg:setFillColor( 1, 0, 0 )
end


-----------------------------------------------------------
-- Create Text and Display Objects
-----------------------------------------------------------

-- Text parameters
local labelx = 50
local x = 220
local y = 95
local fontSize = 24

local xHeaderLabel = display.newText( "x rotation = ", labelx, y, nil, fontSize ) 
xHeaderLabel:setFillColor(1,1,1)
local xValueLabel = display.newText( "0.0", x, y, nil, fontSize ) 
xValueLabel:setFillColor(1,1,1)
y = y + 25
local yHeaderLabel = display.newText( "y rotation = ", labelx, y, nil, fontSize ) 
local yValueLabel = display.newText( "0.0", x, y, nil, fontSize ) 
yHeaderLabel:setFillColor(1,1,1)
yValueLabel:setFillColor(1,1,1)
y = y + 25
local zHeaderLabel = display.newText( "z rotation = ", labelx, y, nil, fontSize ) 
local zValueLabel = display.newText( "0.0", x, y, nil, fontSize ) 
zHeaderLabel:setFillColor(1,1,1)
zValueLabel:setFillColor(1,1,1)

-- Create an object that moves with gyroscope events.
local centerX = display.contentWidth / 2
local centerY = display.contentHeight / 2
local target = display.newImage("target.png", true)
target.x = centerX
target.y = centerY



-----------------------------------------------------------
-- Hardware Events
-----------------------------------------------------------

-- Display the Gyroscope Values
-- Update the text color once a frame based on sign of the value
local function xyzFormat( obj, value )

	obj.text = string.format( "%1.3f", value )

end


-- Called when a gyroscope measurement has been received.
local function onGyroscopeUpdate( event )

	-- Format and display the measurement values.
	xyzFormat(xValueLabel, event.xRotation)
	xyzFormat(yValueLabel, event.yRotation)
	xyzFormat(zValueLabel, event.zRotation)
	
	-- Move our object based on the measurement values.
	local nextX = target.x + event.yRotation
	local nextY = target.y + event.xRotation
	if nextX < 0 then
		nextX = 0
	elseif nextX > display.contentWidth then
		nextX = display.contentWidth
	end
	if nextY < 0 then
		nextY = 0
	elseif nextY > display.contentHeight then
		nextY = display.contentHeight
	end
	target.x = nextX
	target.y = nextY

	-- Rotate the object based based on the degrees rotated around the z-axis.
	local deltaRadians = event.zRotation * event.deltaTime
	local deltaDegrees = deltaRadians * (180 / math.pi)
	target:rotate(deltaDegrees)
end


-- Add gyroscope listeners, but only if the device has a gyroscope.
if system.hasEventSource("gyroscope") then
	Runtime:addEventListener("gyroscope", onGyroscopeUpdate)
end




