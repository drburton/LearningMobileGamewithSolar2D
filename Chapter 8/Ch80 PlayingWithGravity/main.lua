-- Project: Ch8PlayingWithGravity

display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")
physics.start(true)
physics.setDrawMode("hybrid")
local gravityX = display.newText("0.0",  490, 875, native.systemFont, 36  )
local gravityY = display.newText("0.0", 195, 875, native.systemFont, 36 )

-- set inital value for gravity
physics.setGravity(0,-0.1)

-- initialize gx and gy to store gravity changes
gx = 0
gy = -0.1

local xCenter = display.contentCenterX
local yCenter = 768/2

-- create border area so object doesn't fall off screen
local ground = display.newRect(xCenter, 768,  768, 10)
ground:setFillColor(1,1,1,1)

local leftSide = display.newRect(5, yCenter,10,768)
leftSide:setFillColor(1,1,1,1)
local rightSide = display.newRect(768,yCenter,10,768)
rightSide:setFillColor(1,1,1,1)

local top= display.newRect(xCenter,5,768,10)
top:setFillColor(1,1,1,1)

 -- add border to physics as a static object (unaffected by gravity)
 physics.addBody(ground, "static") 
 physics.addBody(leftSide, "static")
 physics.addBody(rightSide, "static")
 physics.addBody(top, "static")
 
 -- load the crate and add it as a body
 local crate = display.newImage("crateB.png" )
 crate.x = 389
 crate.y= 389
physics.addBody(crate, "dynamic",{density=10.0, friction =1, bounce = 1})

-- load arrow buttons and position buttons
local upButton = display.newImage("arrowButton.png", 200, 800)
upButton.rotation = -90

local downButton = display.newImage("arrowButton.png", 200, 950)
downButton.rotation=90

local leftButton = display.newImage("arrowButton.png", 400, 875)
leftButton.rotation=180

local rightButton = display.newImage("arrowButton.png", 600, 875)

-- Upadate the displayed value of gravity
local function updateGravity()
gx, gy = physics.getGravity()
gravityX.text = gx
gravityX.text=(gravityX.text:sub(1,4))
gravityY.text = gy
gravityY.text=(gravityY.text:sub(1,4))
end

-- adjust the gravity for each button event
local function upButtonEvent (event)
	physics.setGravity(gx,gy-0.1)
	updateGravity()
end

local function downButtonEvent (event)
	physics.setGravity(gx,gy+0.1)
	updateGravity()
end

local function leftButtonEvent (event)
	physics.setGravity(gx-0.1,gy)
	updateGravity()
end

local function rightButtonEvent (event)
	physics.setGravity(gx+0.1,gy)
	updateGravity()
end


-- add event listeners for each button
upButton:addEventListener("tap", upButtonEvent)
downButton:addEventListener("tap", downButtonEvent)
leftButton:addEventListener("tap", leftButtonEvent)
rightButton:addEventListener("tap", rightButtonEvent)
