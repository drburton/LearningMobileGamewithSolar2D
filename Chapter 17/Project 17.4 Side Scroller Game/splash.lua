-- splash

local composer = require("composer")
local scene = composer.newScene()
local splash

function scene:create(event)
    splash = display.newRect(0,0, display.contentWidth, display.contentHeight)
    splash:setFillColor(0,0,0)

    local myText = display.newText("Welcome to my awesome level",0,0,nil,24)
    myText:setFillColor(1, 1, 1)
    myText.x = display.contentCenterX
    myText.y = display.contentCenterY

    local function nextScene() 
      composer.gotoScene("1Level")
    end

    splash:addEventListener("tap", nextScene)
end

function scene:show( event )
end

function scene:hide(event)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene	