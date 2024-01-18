-- Project: Ch81 Sample Box 2D Physics

display.setStatusBar(display.HiddenStatusBar)
local  physics = require("physics")
physics.start()


-- handling touch joint events
local function dragBody( event )
        local body = event.target
        local phase = event.phase
        local stage = display.getCurrentStage()

        if "began" == phase then
                stage:setFocus( body, event.id )
                body.isFocus = true

                -- Create a temporary touch joint and store it in the object for later reference
                body.tempJoint = physics.newJoint( "touch", body, event.x, event.y )
 				
        elseif body.isFocus then
                if "moved" == phase then
                
                        -- Update the joint to track the touch
                        body.tempJoint:setTarget( event.x, event.y )
				   
                elseif "ended" == phase or "cancelled" == phase then
                        stage:setFocus( body, nil )
                        body.isFocus = false

-- Remove the joint when the touch ends                 
                        body.tempJoint:removeSelf()
                     
                end
        end
        -- Stop further propagation of touch event
        return true
end


    local mytext = display.newText("Touch Joint",display.contentCenterX ,100, nil, 36)

    local box = display.newImage("crate.png", display.contentWidth/2, 0)
    local ground = display.newImage("ground.png", display.contentWidth/2, display.contentHeight-50)



    physics.addBody(ground, "static")
    physics.addBody(box, "dynamic", {density= 1, friction =0.3, bounce = 0.5 })
	box.isFixedRotation=true

    box:addEventListener("touch", dragBody)


--[[

	Distance Joint
	Pivot Joint
	Pulley Joint
	Friction Joint
	Piston Joint
	Weld Joint
	Wheel Joint
	
]]--
