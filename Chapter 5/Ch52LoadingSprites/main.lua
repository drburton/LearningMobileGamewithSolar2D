-- Project: MaskandSprites

local GreenDinoSheetData = require("GreenDinoSheet")

local options = GreenDinoSheetData.getSpriteSheetData()


local sheet1 = graphics.newImageSheet("GreenDinoSheet.png", options)
local  GreenDino = display.newImage(sheet1, 25)
GreenDino.x = display.contentWidth/2
GreenDino.y = display.contentHeight/2

local GreenDino2 = display.newImage(sheet1, 5)
GreenDino2.x = 25
GreenDino2.y = 25
