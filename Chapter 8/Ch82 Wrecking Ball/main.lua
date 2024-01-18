-- Project: Ch8WreckingBall

local physics = require("physics")
physics.start()
physics.setGravity(0, 9.8)

-- create the ground
local ground = display.newRect(0, 438,  900, 438)
ground:setFillColor(1,1,1,1)

-- load the crane, line, ball and crate
local crane = display.newImage("crane arm.png", 10, 70)
crane.rotation = 90
crane:scale(2,2)

local line1 = display.newImage("line.png", 170, 20)
local line2 =display.newImage("line.png", 170, 110)
local line3 = display.newImage("line.png", 170, 205)

local ball = display.newImage("wrecking ball.png",110, 280)

local crate1= display.newImage("crateB.png", 300, 300)
local crate2 = display.newImage("crateB.png", 300, 225)

-- make all of the objects into phyics bodies
physics.addBody(ground, "static")
physics.addBody(crane, "static")
physics.addBody(line1, {density = 2, friction =0, bounce=0 })
physics.addBody(line2, {density = 2, friction =0, bounce=0 })
physics.addBody(line3, {density = 2, friction =0, bounce=0 })
physics.addBody(ball, {density = 1, friction = 0.7, bounce =0.2})
physics.addBody(crate1, {density=5})
physics.addBody(crate2, {density=5})

joint1 = physics.newJoint("pivot", crane, line1, 170, 22)
joint2 = physics.newJoint("pivot", line1, line2, 170,112)
joint3 = physics.newJoint("pivot", line2, line3, 170, 206)
joint4 = physics.newJoint("pivot", line3, ball, 170,280)

ball:applyLinearImpulse(4000, 200, ball.x, ball.y)
