
local portrait = display.newText("Portrait", 0 ,0 , native.systemFont, 24)
--local landscape = display.newText("Landscape", 0 ,0 , native.systemFont, 24)
portrait.x = display.contentWidth/2
--landscape.x = display.contentWidth/2
portrait.y=display.contentHeight/2
--landscape.y = display.contentHeight/2
portrait:setTextColor(.12,.9,.75)
--landscape:setTextColor(.9,.05,.4)
portrait.alpha =1
--landscape.alpha =0

local function onOrientationChange(event)
	if(event.type =="landscapeRight" or event.type == "landscapeLeft") then
			local newAngle = portrait.rotation - event.delta
			portrait.text = "Landscape"
--			transition.to(landscape , {time =1000, rotation = newAngle})
			transition.to(portrait, {rotation=newAngle})
--			portrait.alpha =0
--			landscape.alpha = 1
	else
			local newAngle = portrait.rotation - event.delta
--			transition.to(landscape, {rotation = newAngle})
			portrait.text = "Portrait"
			transition.to(portrait, {time=1000, rotation = newAngle})
--			portrait.alpha =1 
--			landscape.alpha = 0
	end			
end

Runtime:addEventListener("orientation", onOrientationChange)

