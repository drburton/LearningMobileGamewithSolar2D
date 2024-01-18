--
-- Project: Ch6 Groups
-- 

local b1 = display.newImage("Button1.png",10, 10)
local b2 = display.newImage("Button2.png", 100, 50)
local b3 = display.newImage("Button3.png", 200, 100)


local group1 = display.newGroup()
	group1:insert(b1)
	group1:insert(b2)
	group1:insert(b3)
	
transition.to(group1, {y=300, time=2000, rotation=50})
