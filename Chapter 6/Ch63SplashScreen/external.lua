--
-- Project: Splash Screen
-- 
m={}

function hiDad()
	textObj = display.newText("Hi Dad", display.contentWidth/2, display.contentHeight/2, native.systemFont, 24)
	textObj:setTextColor(1,1,1)
end
return m

