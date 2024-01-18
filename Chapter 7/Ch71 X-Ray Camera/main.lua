-- Project: Ch7.1 X  Ray Camera

local proceedButton

display.setStatusBar(display.HiddenStatusBar)
local isSimulator = "iPhone Simulator" == system.getInfo("model")
                                 
if(isSimulator) then
	 local alert = native.showAlert( "Information", "Camera API not available on Simulator.", { "OK"})    
end     
--
local bkgd = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
bkgd:setFillColor( .5, 0, 0 )

local text = display.newText( "Tap anywhere to launch Camera", 0, 0, nil, 16 )
text:setTextColor( 1, 1, 1 )
text.x = 0.5 * display.contentWidth
text.y = 0.5 * display.contentHeight

local processing = function (event)
	proceedButton.alpha = 0
	local scanbar = display.newImageRect("scan.png", 320, 50)

	scanbar.x = display.contentWidth/2
	scanbar.y=0
	transition.to(scanbar, {y=display.contentHeight, time= 2000})

	local skeleton = display.newImageRect("invertskele.png",302, 480)
	skeleton.alpha = 0
	skeleton.x = display.contentWidth/2
	skeleton.y = display.contentHeight/2
--	timer.performWithDelay(2000, 
	transition.to(image,{alpha = 0, time = 4000})
	transition.to(skeleton, {alpha=1, time = 5000} )
end


local sessionComplete = function(event)	
	image = event.target

	print( "Camera ", ( image and "returned an image" ) or "session was cancelled" )
	print( "event name: " .. event.name )
	print( "target: " .. tostring( image ) )

	if image then
		-- center image on screen
		image.x = display.contentWidth/2
		image.y = display.contentHeight/2
		local w = image.width
		local h = image.height
	    print( "w,h = ".. w .."," .. h )
		
        proceedButton = display.newImage("button.png")
		proceedButton.x = 160
		proceedButton.y = 340
		proceedButton:addEventListener("tap", processing)
		bkgd:setFillColor(0,0,0)
		bkgd:removeSelf()
		
    	text:removeSelf()
   end	
end

local listener = function( event )
	media.show( media.Camera, sessionComplete )
	return true
end
bkgd:addEventListener( "tap", listener )

