-- Project: Ch53 Animated Sprites


local GreenDinoSheetData = require("GreenDinoSheet")
local WalkingData = require("Walking")

local options = GreenDinoSheetData.getSpriteSheetData()
local Walk = WalkingData.getAnimationSequences()

local sheet1 = graphics.newImageSheet("GreenDinoSheet.png", options)

local dinoWalk = display.newSprite(sheet1, Walk)

dinoWalk.x = 64
dinoWalk.y= display.contentHeight/2

dinoWalk:play()

transition.to(dinoWalk, {x=display.contentWidth, time= 10000})
