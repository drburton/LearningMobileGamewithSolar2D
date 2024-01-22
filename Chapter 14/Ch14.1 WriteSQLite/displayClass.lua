
--[[
  - Display class information to screen.
--]]
	local widget = require ( "widget" )
	local composer = require("composer")
	local scene = composer.newScene()
	local localGroup = display.newGroup()
	--include SQLite
    require "sqlite3"
	

function scene:create( event )
	
	-- open database	
	local path = system.pathForFile("students.sqlite", system.DocumentsDirectory)
	db = sqlite3.open( path ) 
	print(path)
		
	local title = display.newText(localGroup, "Class List", display.contentWidth/2, 5, native.systemFont, 36)
	title:setTextColor(1,1,1)	
	--print all the table contents
	local sql = "SELECT * FROM myclass"
	for row in db:nrows(sql) do
  	local text = row.FullName.." "..row.SID..", "..row.ClassSeat.." "..row.Grade
  	local t = display.newText(text, 250, 30 * row.id, native.systemFont, 24)

  	t:setTextColor(1,1,1)
  	localGroup:insert(t)
	end	
	
	db:close()
	
	-- Setup function for button to load student data
	local displayClass_function = function( event )
			-- return to menu screen

			composer.gotoScene( "menu", "slideRight",400 )
	end
	
	local  displayClass_button = widget.newButton{
					defaultFile = "selectButton.png",
					overFile = "selectButton.png",
				    label = " Return to Menu",
					labelColor = {default = { 1,1,1} },
				    fontSize = 24,
				    emboss=true,
					onRelease = displayClass_function,
					id = "displayClass"
	}
	displayClass_button.x = display.contentWidth/2
	displayClass_button.y = display.contentHeight-200
	
	-- add all display items to the local group
	localGroup:insert(displayClass_button)
	

	
	
	-- handle the applicationExit event to close the db
 	local function onSystemEvent( event )
   	if( event.type == "applicationExit") then
     	db:close()
   	end
 	end 
 
-- system listener for applicationExit to handle closing database
 Runtime:addEventListener ("system", onSystemEvent)
end

function scene:show(event)
	localGroup.alpha = 1
end

function scene:hide(event)
localGroup.alpha = 0
composer.removeScene("scene")
end

-- "create" is called whenever the scene is FIRST called
scene:addEventListener( "create", scene )

-- "show" event is dispatched whenever scene transition has finished
scene:addEventListener( "show", scene )

-- "hide" event is dispatched before next scene's transition begins
scene:addEventListener( "hide", scene )

return scene