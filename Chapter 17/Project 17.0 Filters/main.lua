-- create and center object (can be any type of display object)
local bkgd = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
bkgd:setFillColor( 1,0,0 )

local myObject = display.newRect( 20, 20, 300, 200)
myObject:setFillColor(0,1,0,1)
myObject.x = display.contentCenterX
myObject.y = display.contentCenterY

-- set color to be made clear with ChromaKey
myObject.fill.effect = "filter.chromaKey"
myObject.fill.effect.color = {1, 1, 0}