-- Project: Ch81 Sample Box 2D Physics
-- Description: Pulley Joint
--

display.setStatusBar(display.HiddenStatusBar)
local  physics = require("physics")
physics.start()


    local mytext = display.newText("Pulley Joint",0 ,0, nil, 24)

    local box1 = display.newImage("crate.png", display.contentWidth*0.25, 200)
    local box2 = display.newImage("crate.png", display.contentWidth*0.75, 200)
    local ground = display.newImage("ground.png", 0, display.contentHeight-50)
 
   local pulley1 = display.newCircle(display.contentWidth*0.25, 50, 10)
   local pulley2 = display.newCircle(display.contentWidth*0.75, 50, 10)
    line1 = display.newLine(box1.x, box1.y, pulley1.x, pulley1.y)
    line2 = display.newLine(box2.x, box2.y, pulley2.x, pulley2.y)
    line3 = display.newLine(pulley1.x, pulley1.y, pulley2.x, pulley2.y)
   line1:toBack()
   line2:toBack()
   
    physics.addBody(ground, "static")
    physics.addBody(box1, "dynamic", {density= 1, friction =0.3, bounce = 0.5 })
    physics.addBody(box2, "dynamic", {density=1.01, friction = 0.3, bounce = 0.5 })
    
    -- physics.newJoint("pulley", bodyA, bodyB, anchorA_x, anchorA_y, anchorB_x,anchorB_y, bodyA.x, bodyA.y, bodyB.x, bodyB.y, 1.0 )
	local myJoint = physics.newJoint("pulley", box1, box2, pulley1.x, pulley1.y, pulley2.x, pulley2.y, box1.x, box1.y, box2.x, box2.y, 1)

    local function lineUpdate()
 			line1:removeSelf()		
 			line2:removeSelf()
 			line1 = display.newLine(pulley1.x, pulley1.y, box1.x, box1.y)
             line2 = display.newLine(box2.x, box2.y, pulley2.x, pulley2.y)
			line1:toBack()
			line2:toBack()
    end

	Runtime:addEventListener("enterFrame", lineUpdate)
	
	
--[[

	Distance Joint

	Friction Joint
	Piston Joint
	Weld Joint
	Wheel Joint
	
]]--
