--
-- Project: Proj 2.0 Display Size
-- 

display.setStatusBar( display.HiddenStatusBar )

local myWidth = display.contentWidth
local myHeight= display.contentHeight

local topLeft = display.newText("0, 0", 25, 20, nil, 24)
local topRight = display.newText(myWidth.. ", 0", myWidth-100, 20, nil, 24)
local bottomLeft = display.newText("0, " .. myHeight, 50, myHeight-50, nil, 24)
local bottomRight = display.newText(myWidth ..", ".. myHeight, myWidth-120, myHeight-50, nil, 24)

