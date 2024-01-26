--Liquid Fun Example

local physics = require( "physics" )
physics.start()

display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "fillColor", 0.5 )

-- Add all physics objects
local left_side_piece = display.newRect( -40, display.contentHeight-220, 400, 70 )
physics.addBody( left_side_piece, "static" )
left_side_piece.rotation = 80

local center_piece = display.newRect( display.contentCenterX, display.contentHeight-16, 400, 120 )
physics.addBody( center_piece, "static" )

local right_side_piece = display.newRect( display.contentWidth+40, display.contentHeight-220, 400, 70 )
physics.addBody( right_side_piece, "static" )
right_side_piece.rotation = -80

-- Create the particle system
local particleSystem = physics.newParticleSystem{
	filename = "particle.png",
	colorMixingStrength = 0.1,
	radius = 3,
	imageRadius = 6
}

-- Paramaters for red particle faucet
local particleParams_red =
{
	flags = { "water", "colorMixing" },
	linearVelocityX = 256,
	linearVelocityY = -480,
	color = { 1, 0, 0.1, 1 },
	x = display.contentWidth * -0.15,
	y = 0,
	lifetime = 8.0,
	radius = 10,
}

-- Paramaters for blue particle faucet
local particleParams_blue =
{
	flags = { "water", "colorMixing" },
	linearVelocityX = -256,
	linearVelocityY = -480,
	color = { 0, 0.3, 1, 1 },
	x = display.contentWidth * 1.15,
	y = 0,
	lifetime = 8.0,
	radius = 10,
}

-- Paramaters for green particle faucet
local particleParams_green =
{
	flags = { "water", "colorMixing" },
	linearVelocityX = 0,
	linearVelocityY = 0,
	color = { 0, 1, 0, 1 },
	x = display.contentCenterX,
	y = 0,
	lifetime = 16.0,
	radius = 10,
}

-- Generate particles on repeating timer
local function onTimer( event )
	particleSystem:createGroup( particleParams_red )
	particleSystem:createGroup( particleParams_blue )
	particleSystem:createGroup( particleParams_green)
end
timer.performWithDelay( 100, onTimer, 0 )

-- Forward declarations
local touchIsActive = false
local previousTime = 0.0
local previousX = 0.0
local previousY = 0.0
local touchX = 0.0
local touchY = 0.0
local velocityX = 0.0
local velocityY = 0.0
local box


-- Function to create/move/remove box
local function onTouch( event )

	touchX = event.x
	touchY = event.y

	local timeDelta = ( event.time / 1000.0 ) - previousTime
	previousTime = ( event.time / 1000.0 )

	local positionDeltaX = touchX - previousX
	local positionDeltaY = touchY - previousY
	previousX = touchX
	previousY = touchY

	velocityX = ( positionDeltaX / timeDelta )
	velocityY = ( positionDeltaY / timeDelta )

	----------------------------------------------------------------------------

	if "began" == event.phase then

		touchIsActive = true
		velocityX = 0.0
		velocityY = 0.0

		box = display.newRect( event.x, event.y, 32, 32 )
		box.strokeWidth = 1
		box:setStrokeColor( 0.4 )
		box:setFillColor( 1, 1, 1, 0.2 )

	elseif "moved" == event.phase then

		box.x = event.x
		box.y = event.y

	elseif "ended" == event.phase or "cancelled" == event.phase then

		touchIsActive = false
		display.remove( box )
	end

	return true
end
Runtime:addEventListener( "touch", onTouch )

-- Function to queryRegion() on 'particleSystem'
local function enterFrame( event )

	if touchIsActive then

		local hits = particleSystem:queryRegion(
			box.x - ( 32/2 ),  --left limit
			box.y - ( 32/2 ),  --top limit
			box.x + ( 32/2 ),  --right limit
			box.y + ( 32/2 ),  --bottom limit
			{ velocityX=velocityX, velocityY=velocityY } )

		--if hits then debugOutput( hits ) end
	end
end
Runtime:addEventListener( "enterFrame", enterFrame )

-- Display instructions
local inst = display.newText( "touch/drag to flick particles", display.contentWidth * 0.5, 50, native.systemFont, 16 )
inst:setFillColor( 1 )
