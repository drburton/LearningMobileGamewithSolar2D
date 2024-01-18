---------------------------------------------------------------------------------
--
-- dad.lua
--
---------------------------------------------------------------------------------

local composer = require "composer"
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR SCENE
---------------------------------------------------------------------------------

--Called if the scene hasn't been previously seen
function scene:create( event )

    local DadGroup = self.view

    backgroundImage = display.newImage("bg2.jpg", 0, 0)
    DadGroup:insert(backgroundImage)
    
    hiDadText = display.newText("Hi Dad!",0 ,0, nil, 36)
    hiDadText.x = display.contentWidth/2
    hiDadText.y =  display.contentHeight/2
    DadGroup:insert(hiDadText)
    
end


local function onBackgroundTouch()
    composer.gotoScene( "mom", {effect = "zoomInOut", time = 800 } )
end

function scene:show(event)
    backgroundImage:addEventListener("touch", onBackgroundTouch)
end

function scene:hide(event)
    backgroundImage:removeEventListener("touch", onBackgroundTouch)
end

function scene:destroyScene(event)

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )


return scene

