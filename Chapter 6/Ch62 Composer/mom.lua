---------------------------------------------------------------------------------
--
-- mom.lua
--
---------------------------------------------------------------------------------

local composer = require "composer"
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR SCENE
---------------------------------------------------------------------------------


--Called if the scene hasn't been previously seen
function scene:create( event )
    
    local MomGroup = self.view
	
    bgImage = display.newImage("bg.jpg", 0, 0)
    MomGroup:insert(bgImage)

    hiMomText = display.newText("Hi Mom!!",0 ,0, nil, 36)
    hiMomText.x = display.contentWidth/2
    hiMomText.y =  display.contentHeight/2
    MomGroup:insert(hiMomText)

end

function onBackgroundTouch()
    composer.gotoScene("dad", "fade", 400)
end


function scene:show(event)
	bgImage:addEventListener("touch", onBackgroundTouch)
end

function scene:hide(event)
    bgImage:removeEventListener("touch", onBackgroundTouch)
end

function scene:destroyScene(event)

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )


return scene
