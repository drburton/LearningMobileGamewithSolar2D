-- Project: Ch15.0 Pic Download


local widget = require("widget")
 
 
 local function networkListener (event)
 	if (event.isError) then
 		print("Network error - download failed")
 	else
 		print("No problems on the network side")
 		local testImage = display.newImage("LearningLua.jpg", system.DocumentsDirectory,display.contentCenterX,display.contentHeight);
        testImage.x = display.contentWidth/2
        testImage.y = display.contentCenterY
 	end
 end
 
local function loadButtonPress (event)
 
   -- Request remote file and save data to local file
	network.download("https://burtonsmediagroup.com/wp-content/uploads/2023/08/Learning-Lua-Book-cover.jpg", "GET", networkListener, "LearningLua.jpg")

   print("Should be downloading now")                                                                                                                                                                                                                                                                                                           

end

-- Load Button
loadButton = widget.newButton{
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlueOver.png",
	onRelease = loadButtonPress,
	label = "Load Picture",
	labelColor = {default = {1,1,1} },
	emboss = true
}

loadButton.x = display.contentWidth/2
loadButton.y = display.contentHeight - 50
