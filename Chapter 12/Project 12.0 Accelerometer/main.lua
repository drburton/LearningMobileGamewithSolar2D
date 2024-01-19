display.setStatusBar( display.HiddenStatusBar )		-- hide status bar

-- Displays App title
title = display.newText( "Accelerator", 0, 20, nil, 20 )
title.x = display.contentWidth/2		-- center title
title:setFillColor( 1,1,0 )

-- Determine if running on Corona Simulator
local isSimulator = "simulator" == system.getInfo("environment")

-- Accelerator is not supported on Simulator
if isSimulator then
	msg = display.newText( "Accelerometer not supported on Simulator", 0, 55, nil, 13 )
	msg.x = display.contentWidth/2		-- center title
	msg:setFillColor( 1,1,0 )
end

local soundID = audio.loadSound ("beep_wav.wav")


local y = 95

local xgText = display.newText( "gravity x = ", 50, y, nil, 20 ) 
xgText:setFillColor(1,1,1)
local xg = display.newText( "0.0", 220, y, nil, 20 ) 
xg:setFillColor(1,1,1)
y = y + 25
local ygText = display.newText( "gravity y = ", 50, y, nil, 20 ) 
local yg = display.newText( "0.0", 220, y, nil, 20 ) 
ygText:setFillColor(1,1,1)
yg:setFillColor(1,1,1)
y = y + 25
local zgText = display.newText( "gravity z = ", 50, y, nil, 20 ) 
local zg = display.newText( "0.0", 220, y, nil, 20 ) 
zgText:setFillColor(1,1,1)
zg:setFillColor(1,1,1)
y = y + 50
local xiText = display.newText( "instant x = ", 50, y, nil, 20 ) 
local xi = display.newText( "0.0", 220, y, nil, 20 ) 
xiText:setFillColor(1,1,1)
xi:setFillColor(1,1,1)
y = y + 25
local yiText = display.newText( "instant y = ", 50, y, nil, 20 ) 
local yi = display.newText( "0.0", 220, y, nil, 20 ) 
yiText:setFillColor(1,1,1)
yi:setFillColor(1,1,1)
y = y + 25
local ziText = display.newText( "instant z = ", 50, y, nil, 20 ) 
local zi = display.newText( "0.0", 220, y, nil, 20 ) 
ziText:setFillColor(1,1,1)
zi:setFillColor(1,1,1)

-- Create a circle that moves with Accelerator events (for visual effects)

local centerX = display.contentWidth / 2
local centerY = display.contentHeight / 2

Circle = display.newCircle(0, 0, 20)
Circle.x = centerX
Circle.y = centerY
Circle:setFillColor( 0, 0, 255 )		-- blue


-----------------------------------------------------------
-- Hardware Events
-----------------------------------------------------------

-- Display the Accerator Values
local function 	xyzFormat( obj, value)

	obj.text = string.format( "%1.3f", value )
	
end

-- Called for Accelerator events
--
-- Update the display with new values
-- If shake detected, make sound and display message for a few seconds
--
local function onAccelerate( event )

	-- Format and display the Accelerator values
	--
	xyzFormat( xg, event.xGravity)
	xyzFormat( yg, event.yGravity)
	xyzFormat( zg, event.zGravity)
	xyzFormat( xi, event.xInstant)
	xyzFormat( yi, event.yInstant)	
	xyzFormat( zi, event.zInstant)	
	

	-- Move our object based on the accelerator values
	Circle.x = centerX + (centerX * event.xGravity)
	Circle.y = centerY + (centerY * event.yGravity * -1)
end

--[[
local function onFrame()
	frameUpdate = true
	

end
]]--
-- Add runtime listeners
--
Runtime:addEventListener ("accelerometer", onAccelerate);
--Runtime:addEventListener ("enterFrame", onFrame);
