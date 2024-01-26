
display.setDrawMode( "forceRender" )

local myObject = display.newRect(display.contentCenterX, display.contentCenterY, 300, 200)
myObject:setFillColor(1,1,1,1)

-- set up the marching ants
myObject.strokeWidth = 2
myObject.stroke.effect = "generator.marchingAnts"