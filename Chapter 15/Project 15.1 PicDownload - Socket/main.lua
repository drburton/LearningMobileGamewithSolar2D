-- Project: Ch15.1 Pic Download

local widget = require("widget")

-- Load the relevant LuaSocket modules
local http = require("socket.http")
local ltn12 = require("ltn12")
 
-- Create local file for saving data
local path = system.pathForFile( "LearningLua.jpg", system.DocumentsDirectory )
print(path)
myFile = io.open( path, "w+b" ) 
 
 
local function loadButtonPress (event)
 
   -- Request remote file and save data to local file
 http.request{
      url = "https://burtonsmediagroup.com/wp-content/uploads/2023/08/Learning-Lua-Book-cover.jpg", 
      sink = ltn12.sink.file(myFile),
}
 		testImage = display.newImage("LearningLua.jpg", system.DocumentsDirectory,10,30);
         testImage.x = display.contentWidth/2                                                                                                                                                                                                                                                                                                               
end

-- Load Button

loadButton = widget.newButton{
	defaultFile = "buttonBlue.png",
	overFile = "buttonBlueOver.png",
	onRelease = loadButtonPress,
	label = "Load Picture",
	labelColor = {default ={1,1,1}},
	emboss = true
}

loadButton.x = display.contentWidth/2
loadButton.y = display.contentHeight - 50
