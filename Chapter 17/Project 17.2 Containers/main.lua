local myContainer = display.newContainer( 300, 200 )
myContainer.x = display.contentCenterX 
myContainer.y = display.contentCenterY
local gradient = { type="gradient", color1={1,0,0}, color2={0.1,0,0}, direction="up" } 

local bg = display.newRect( 0, 0, 1000, 1000 )
bg.fill = gradient
myContainer:insert( bg )
local myText = display.newText( "Hello World!", 0, 0, native.systemFont, 24 )
myContainer:insert( myText )

local function moveText()
	transition.to( myText, {time = 2000, x=myText.x+200} )
end

timer.performWithDelay( 2000, moveText  )