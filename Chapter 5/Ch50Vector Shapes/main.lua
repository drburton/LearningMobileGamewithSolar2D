local w = display.contentWidth/2
local h = display.contentHeight/2

-- need initial segment to start
local star = display.newLine( 0,-110, 27,-35 ) 
star:append( 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, 0,-110 ) 
star:setStrokeColor( 1, 1, 1, 1 )
star.strokeWidth = 3
star.anchorSegment=true
star.anchorY = .5

local rectangle = display.newRect( 100, 100, 50, 50)
rectangle.strokeWidth = 
rectangle:setFillColor( 1, 0, 0)
rectangle:setStrokeColor(0, 0, 1)

local circle = display.newCircle(w, h, 15)
circle.strokeWidth = 2
circle:setFillColor(0, 1, 0)
circle:setStrokeColor(1,1,1)

transition.to(star, {x=w, y=h, time=1500, rotation=360})
transition.to(rectangle, {x=w, y=h, time = 1500, rotation = 360})