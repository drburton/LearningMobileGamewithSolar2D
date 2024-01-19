-- Project: GPS
--
-- File name: main.lua
-- Abstract: GPS sample app, showing available location event properties
--
-- Target devices: iPhone 3GS or newer for GPS data.
--
-- Limitations: Location events not supported on Simulator
--
-- Comments: 
-- This example shows you how to access the various properties of the "location" events, which
-- are returned by the GPS listener. Devices without GPS will have less accurate location data,
-- and the Corona Simulator returns a set of artificial coordinates for testing.
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
---------------------------------------------------------------------------------------

-- Require the widget library
local widget = require( "widget" )

local currentLatitude = 0
local currentLongitude = 0

display.setStatusBar( display.HiddenStatusBar )

local background = display.newImage("gps_background.png", display.contentCenterX, display.contentCenterY)

local latitude = display.newText( "--", 0, 0, nil, 26 )
latitude.anchorX=0
latitude.anchorY=.5
latitude.x, latitude.y = 125 + latitude.contentWidth * 0.5, 64
latitude:setFillColor(1,.3,.3)


local longitude = display.newText( "--", 0, 0, nil, 26 )
longitude.anchorX=0
longitude.anchorY=.5
longitude.x, longitude.y = 125 + longitude.contentWidth * 0.5, latitude.y + 50
longitude:setFillColor(1,.3,.3)

local altitude = display.newText( "--", 0, 0, nil, 26 )
altitude.anchorX=0
altitude.anchorY=.5
altitude.x, altitude.y = 125 + altitude.contentWidth * 0.5, longitude.y + 50
altitude:setFillColor(1,.3,.3)

local accuracy = display.newText( "--", 0, 0, nil, 26 )
accuracy.anchorX=0
accuracy.anchorY=.5
accuracy.x, accuracy.y = 125 + altitude.contentWidth * 0.5, altitude.y + 50
accuracy:setFillColor(1,.3,.3)


local speed = display.newText( "--", 0, 0, nil, 26 )
speed.anchorX=0
speed.anchorY=.5
speed.x, speed.y = 125 + speed.contentWidth * 0.5, accuracy.y + 50
speed:setFillColor(1,.3,.3)


local direction = display.newText( "--", 0, 0, nil, 26 )
direction.anchorX=0
direction.anchorY=.5
direction.x, direction.y = 125 + direction.contentWidth * 0.5, speed.y + 50
direction:setFillColor(1,.3,.3)

local time = display.newText( "--", 0, 0, nil, 26 )
time.anchorX=0
time.anchorY=.5
time.x, time.y = 125 + time.contentWidth * 0.5, direction.y + 50
time:setFillColor(1,.3,.3)



local locationHandler = function( event )

	-- Check for error (user may have turned off Location Services)
	if event.errorCode then
		native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
		print( "Location error: " .. tostring( event.errorMessage ) )
	else
	
		local latitudeText = string.format( '%.4f', event.latitude )
		currentLatitude = latitudeText
		latitude.text = latitudeText
		latitude.x, latitude.y = 125 + latitude.contentWidth * 0.5, 64
		
		local longitudeText = string.format( '%.4f', event.longitude )
		currentLongitude = longitudeText
		longitude.text = longitudeText
		longitude.x, longitude.y = 125 + longitude.contentWidth * 0.5, latitude.y + 50
		
		local altitudeText = string.format( '%.3f', event.altitude )
		altitude.text = altitudeText
		altitude.x, altitude.y = 125 + altitude.contentWidth * 0.5, longitude.y + 50
	
		local accuracyText = string.format( '%.3f', event.accuracy )
		accuracy.text = accuracyText
		accuracy.x, accuracy.y = 125 + accuracy.contentWidth * 0.5, altitude.y + 50
		
		local speedText = string.format( '%.3f', event.speed )
		speed.text = speedText
		speed.x, speed.y = 125 + speed.contentWidth * 0.5, accuracy.y + 50
	
		local directionText = string.format( '%.3f', event.direction )
		direction.text = directionText
		direction.x, direction.y = 125 + direction.contentWidth * 0.5, speed.y + 50
	
		-- Note: event.time is a Unix-style timestamp, expressed in seconds since Jan. 1, 1970
		local timeText = string.format( '%.0f', event.time )
		time.text = timeText 
		time.x, time.y = 125 + time.contentWidth * 0.5, direction.y + 50
	end
end

-- Determine if running on Corona Simulator
--
local isSimulator = "simulator" == system.getInfo("environment")

-- Location Events is not supported on Simulator
--
if isSimulator then
	msg = display.newText( "Location events not supported on Simulator!", 0, 230, "Verdana-Bold", 13 )
	msg.x = display.contentWidth/2		-- center title
	msg:setTextColor( 255,255,255 )
end

-- Activate location listener
Runtime:addEventListener( "location", locationHandler )