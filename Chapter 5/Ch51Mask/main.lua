--
-- Project: Ch5Masks
-- 

local solar = display.newImage("solar.png", (display.contentWidth/2)-200, (display.contentHeight/2)-150 )

local mask = graphics.newMask("mask.png")
solar:setMask(mask)

