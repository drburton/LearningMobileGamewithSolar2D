--[[
 - INFORMATION
  - add a student to the SQLite database.
--]]
	
	local widget = require ( "widget" )
	local composer = require("composer")
	local scene = composer.newScene()
	local localGroup = display.newGroup()
--include SQLite
   require "sqlite3"
	

--Called if the scene hasn't been previously seen
function scene:create( event )

	-- Add textboxes to enter data
	-- Labels for textboxes
	local title = display.newText(localGroup, "Add A Student", display.contentWidth/2, 50, native.systemFont, 36)
	title:setTextColor(1,1,1)
	local nameLabel = display.newText(localGroup, "Name:", 150, 200, native.systemFont, 24)
	nameLabel:setTextColor(1,1,1)
	local idLabel = display.newText(localGroup, "ID Number:", 150, 300, native.systemFont, 24)
	idLabel:setTextColor(1,1,1)
	local seatLabel = display.newText(localGroup, "Seat:", 150, 400, native.systemFont, 24)
	seatLabel:setTextColor(1,1,1)
	local gradeLabel = display.newText(localGroup, "Grade:", 150, 500, native.systemFont, 24)
	
    local studentName = native.newTextField(350, 200, 220, 36)
	studentName.inputType="default"
	localGroup:insert(studentName)
	
	local studentID = native.newTextField(350, 300, 220, 36)
	studentID.inputType="default"
	localGroup:insert(studentID)
	
	local seat = native.newTextField(350, 400, 220, 36)
	seat.inputType="default"
	localGroup:insert(seat)
	
	local studentGrade = native.newTextField(350, 500, 220, 36)
	studentGrade.inputType="default"
	localGroup:insert(studentGrade)

	-- Setup function for button to submit student data
	local submitStudent_function = function ( event )

			-- open SQLite database, if it doesn't exist, create database
			local path = system.pathForFile("students.sqlite", system.DocumentsDirectory)
			db = sqlite3.open( path ) 
			print(path)
			
			-- setup the table if it doesn't exist
		local tablesetup = "CREATE TABLE IF NOT EXISTS myclass (id INTEGER PRIMARY KEY, FullName, SID, ClassSeat, Grade);"
			db:exec( tablesetup )
			print(tablesetup)
		
			-- save student data to database
			local tablefill ="INSERT INTO myclass VALUES (NULL,'" .. studentName.text .. "','" .. studentID.text .. "','" .. seat.text .. "','" .. studentGrade.text .."');"
			print(tablefill)
			db:exec( tablefill )
					
			--	 close database
			db:close()
			print("db closed")
			
			-- Clear textFields & return to menu screen
			 studentName:removeSelf()
             studentID:removeSelf()
             seat:removeSelf()
             studentGrade:removeSelf() 
			composer.gotoScene( "menu", "slideLeft", 400 )
	end   -- submitStudent_function
	
	local  addStudent_button = widget.newButton{
			defaultFile = "selectButton.png",
			overFile = "selectButton.png",
		    label = " Add Student",
			labelColor = {default = {1,1,1}},
		    size = 24,
		    emboss=true,
			onRelease = submitStudent_function,
			id = "addStudent"
	}
	addStudent_button.x = display.contentWidth/2
	addStudent_button.y = display.contentHeight-200
	

	-- add all display items to the local group
	localGroup:insert(addStudent_button)

	
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
