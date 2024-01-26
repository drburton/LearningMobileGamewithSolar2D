-- Side Scroller
-- Graphics 2.0 parallax scrolling
local composer = require("composer")
local scene = composer.newScene()
local physics = require("physics")
physics.start()
physics.setGravity( 0, 9.8 )

function scene:create(event)
  	local centerX = display.contentCenterX
	local centerY = display.contentCenterY
	local _W = display.contentWidth
	local _H = display.contentHeight

	-- Define reference points locations anchor ponts
	local BOTTOM_REF = 1
	local LEFT_REF = 0


    local baseline = 375
    local obj = {}  -- used to store parallax objects and obstacles

    -- load the graphics
    -- Load the sky and background image.  Will not move.
    local sky = display.newImageRect( "sky.png", 1024, 400)
    sky.x = centerX
    sky.y = centerY
    local distance = 0
    local distanceText = display.newText("Distance: "..distance, 150, 30, nil, 24)

    obj[1] = display.newImageRect("background.png", 1500, 300)
    obj[1].anchorX = LEFT_REF
    obj[1].x = -190
    obj[1].y = centerY
    obj[1].dx = 0.01  -- move the background VERY slowly

    -- Road
    -- This has multiple parts so we can slide it
    -- When one of the road images slides offscreen, we move it to the right of the last one.
    local road1 = display.newImageRect("road.png", 325, 45)
    road1.anchorX = LEFT_REF
    road1.x = -200
    road1.y = baseline + 35
    local road2 = display.newImageRect("road.png", 325, 45)
    road2.anchorX = LEFT_REF
    road2.x = 100
    road2.y = baseline + 35
    local road3 = display.newImageRect("road.png", 325, 45)
    road3.anchorX = LEFT_REF
    road3.x = 400
    road3.y = baseline + 35
    local road4 = display.newImageRect("road.png", 325, 45)
    road4.anchorX = LEFT_REF
    road4.x = 700
    road4.y = baseline + 35
    local road5 = display.newImageRect("road.png", 325, 45)
    road5.anchorX = LEFT_REF
    road5.x = 1000
    road5.y = baseline + 35


    local ground = display.newRect( centerX, baseline+40, _W+250, 10 )
    ground.alpha = 0
    physics.addBody( ground, "static" )

    -- Load background objects
    obj[2] = display.newImageRect( "barn.png", 204, 200 )
    obj[2].xScale = 0.6
    obj[2].yScale = 0.6
    obj[2].anchorY = BOTTOM_REF
    obj[2].x = 200
    obj[2].y = baseline+10
    obj[2].dx = 0.2

    obj[3] = display.newImageRect( "fence.png", 300, 100 )
    obj[3].xScale = 0.7
    obj[3].yScale = 0.7
    obj[3].anchorY = BOTTOM_REF
    obj[3].x = 200
    obj[3].y = baseline+20
    obj[3].dx = 0.3

    -- insert obstacles
    obj[4] = display.newImageRect( "trash cans.png", 50, 50 )
    obj[4].xScale = 1 
    obj[4].yScale = 1
    obj[4].anchorY = BOTTOM_REF
    obj[4].x = 20 
    obj[4].y = baseline+60
    obj[4].dx = 1
    physics.addBody( obj[4], "dynamic", {density=.5, friction=.5, bounce=.5  } )

    -- A sprite sheet with a blue person
    local sheet = graphics.newImageSheet( "blueman.png", { width=128, height=128, numFrames=15 } )

    -- play 15 frames every 500 ms
    local blueman = display.newSprite( sheet, { name="man", start=1, count=15, time=500 } )
    blueman.x = centerX-100
    blueman.y = baseline+40
    blueman:play()
    physics.addBody( blueman, "dynamic", {density=2 } )
    blueman.isFixedRotation=true


    -- setup parallax scrolling.  Layers must be in back to front order with a distance ratio.
    -- A per-frame event to move the elements
    local tPrevious = system.getTimer()
    local function move(event)
    	local tDelta = event.time - tPrevious

    	tPrevious = event.time
        distance = distance + (tDelta*.01)

        distanceText.text = "Distance: "..math.round(distance).." meters"

    	local xOffset = ( 0.2 * tDelta )

    	road1.x = road1.x - xOffset
    	road2.x = road2.x - xOffset
        road3.x = road3.x - xOffset
        road4.x = road4.x - xOffset
        road5.x = road5.x - xOffset

    	if (road1.x ) < -500 then
    		road1.x= 1000
    	end
    	if (road2.x) < -500 then
    		road2.x= 1000
    	end
        if (road3.x ) < -500 then
            road3.x= 1000
        end
        if (road4.x) < -500 then
            road4.x= 1000
        end
        if (road5.x ) < -500 then
            road5.x= 1000
        end

    	local i
    	for i = 1, #obj, 1 do
    		obj[i].x = obj[i].x - obj[i].dx * tDelta * 0.2
    		if (obj[i].x + obj[i].contentWidth) < 0 then
    			obj[i]:translate( display.contentWidth + obj[i].width*2, 0 )
    		end
    	end
        -- Finished
        if blueman.x <= -150 then
            blueman:pause()
            physics.stop()
            Runtime:removeEventListener( "enterFrame", move )
            local finished = display.newText("You ran "..distance.." meters", centerX, centerY, nil, 30)
        end
    end

-- handle the controls (tap to jump)
local function jump()
 --   print("JUMP!!")
    blueman:applyLinearImpulse( 0, -200, blueman.x, blueman.y )
end




-- listeners
    local tapArea = display.newRect( centerX, centerY, _W+255, _H+255 )
    tapArea.alpha = .01

    Runtime:addEventListener( "enterFrame", move );
    tapArea:addEventListener( "tap", jump )

end

function scene:show( event )


end

function scene:hide(event)

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene