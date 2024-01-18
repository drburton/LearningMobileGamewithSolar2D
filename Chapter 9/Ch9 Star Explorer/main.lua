------------
-- Star Explorer
------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")

-- Setup and start physics
local physics = require("physics")
physics.start()
physics.setGravity(0,0)

-- Initialize variables
local background = display.newImage ("images/bg1.png", true)
background.x = display.contentWidth /2
background.y = display.contentHeight /2
local lives = 3
local score = 0
local numShot = 0
local shotTable ={}
local asteroidsTable = {}
local numAsteroids = 0
local maxShotAge = 1000
local tick = 200  -- time between game loops in milliseconds
local died=false
local explosion = audio.loadSound("sounds/explosion.wav")
local fire = audio.loadSound("sounds/fire.wav")


-- Display lives and score
local function newText()
   textLives = display.newText("Lives: "..lives, 50, 30, nil, 12)
   textScore = display.newText("Score: "..score, 50, 10, nil, 12)
   textLives:setTextColor(1,1,1)
   textScore:setTextColor(1,1,1)
end

local function updateText()
    textLives.text = "Lives: "..lives
    textScore.text = "Score: "..score
end

local function loadAsteroid()
	numAsteroids= numAsteroids +1
	asteroidsTable[numAsteroids] = display.newImage("images/asteroids1-1a.png")
	physics.addBody(asteroidsTable[numAsteroids],{density=1,friction=0.4,bounce=1})
	local whereFrom = math.random(3)
	asteroidsTable[numAsteroids].myName="asteroid"
	
	if(whereFrom==1) then
		asteroidsTable[numAsteroids].x = -50
		asteroidsTable[numAsteroids].y = (math.random(display.contentHeight *.75))
		transition.to(asteroidsTable[numAsteroids], {x= (display.contentWidth +100),
		y=(math.random(display.contentHeight)), time =(math.random(5000, 10000))})
	elseif(whereFrom==2) then
		asteroidsTable[numAsteroids].x = (math.random(display.contentWidth))
		asteroidsTable[numAsteroids].y = -30
		transition.to(asteroidsTable[numAsteroids], {x= (math.random(display.contentWidth)),
		y=(display.contentHeight+100), time =(math.random(5000, 10000))})
	elseif(whereFrom==3) then
		asteroidsTable[numAsteroids].x = display.contentWidth+50
		asteroidsTable[numAsteroids].y = (math.random(display.contentHeight *.75))
		transition.to(asteroidsTable[numAsteroids], {x= -100,
		y=(math.random(display.contentHeight)), time =(math.random(5000, 10000))})
	end	
		
end

local function onCollision(event)
	if(event.object1.myName =="starfighter" or event.object2.myName =="starfighter") then
		if(died == false) then 
			died = true
			if(lives ==1) then
				audio.play(explosion)
				event.object1:removeSelf()
				event.object2:removeSelf()
				lives=lives -1
				local lose = display.newText("You Have Failed.", 150, 150, nil, 36)
				lose:setTextColor(1,1,1)
			else
			audio.play(explosion)
			starfighter.alpha =0
			lives=lives-1
			cleanup()
			timer.performWithDelay(2000,weDied,1)
			end
		end
	end
	if((event.object1.myName=="asteroid" and event.object2.myName=="shot") or 
		(event.object1.myName=="shot" and event.object2.myName=="asteroid")) then
		media.playEventSound("sounds/explosion.wav")
		event.object1:removeSelf()
		event.object1.myName=nil
		event.object2:removeSelf()
		event.object2.myName=nil
		score=score+100
	end
	
end

function weDied()
	-- fade in the new starfighter
	starfighter.x=display.contentWidth/2
	starfighter.y=display.contentHeight -50
	transition.to(starfighter, {alpha=1, timer=2000})
	died=false
end

function cleanup()
	for i=1,table.getn(asteroidsTable) do
		if(asteroidsTable[i].myName~= nil) then
			asteroidsTable[i]:removeSelf()
			asteroidsTable[i].myName=nil
		end
	end
	for i=1,table.getn(shotTable) do
		if(shotTable[i].myName~= nil) then
			shotTable[i]:removeSelf()
			shotTable[i].myName=nil
		end
	end
end	

local function spawnShip()
	starfighter = display.newImage("images/starfighter1.png")
	starfighter.x = display.contentWidth/2
	starfighter.y = display.contentHeight - 50
	physics.addBody (starfighter, {density=1.0, friction = 0.3, bounce=1.0})
	starfighter.myName="starfighter"
end

local function fireshot(event)
	numShot = numShot+1
	shotTable[numShot] = display.newImage("images/shot.png")
	physics.addBody(shotTable[numShot], {density=1, friction=0})
	shotTable[numShot].isbullet = true
	shotTable[numShot].x=starfighter.x
	shotTable[numShot].y=starfighter.y -60
	transition.to(shotTable[numShot], {y=-80, time=700})
	audio.play(fire)
	shotTable[numShot].myName="shot"
	shotTable[numShot].age=0
end
	

-- basic dragging physics
local function startDrag( event )
	local t = event.target

	local phase = event.phase
	if "began" == phase then
		display.getCurrentStage():setFocus(t)
		t.isFocus = true
		
		--Store inital position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
		
		-- make the body type 'kinematic' to avoid gravity problems
		event.target.bodyType = "kinematic"
		
		-- stop current motion
		event.target:setLinearVelocity( 0,0)
		event.target.angularVelocity = 0
		
	elseif t.isFocus then
		if "moved" == phase then
			t.x = event.x - t.x0
			t.y = event.y - t.y0
		elseif "ended" == phase or "cancelled" == phase then
			display.getCurrentStage():setFocus(nil)
			t.isFocus = false
			
			-- switch body type back to "dynamic"
			if (not event.target.isPlatform) then
				event.target.bodyType = "dynamic"
			end
		end
	end
	return true
end
	
local function gameLoop()
	updateText()
	loadAsteroid()
	--remove old shots fired so they don't stack
	for i = 1, table.getn(shotTable) do
		if (shotTable[i].myName ~= nil and shotTable[i].age < maxShotAge) then
			shotTable[i].age = shotTable[i].age + tick
		elseif (shotTable[i].myName ~= nil) then
			shotTable[i]:removeSelf()
			shotTable[i].myName=nil
		end	
	end
end

--Start the game
spawnShip()
newText()

starfighter:addEventListener("touch", startDrag)
starfighter:addEventListener("tap", fireshot)
Runtime:addEventListener("collision", onCollision)

timer.performWithDelay(tick, gameLoop,0)
