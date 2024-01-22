--[[
  - Menu.
 Show buttons for selecting the display class screen or add student screen
 --]]
	
	local widget = require ( "widget" )
	local composer = require("composer")
	local scene = composer.newScene()
	local localGroup = display.newGroup()
	
--Called if the scene hasn't been previously seen
function scene:create( event )

	local displayClass_function = function ( event )
		composer.gotoScene( "displayClass", "fade", 400 )	
	end

	local  displayClass_button = widget.newButton{
		defaultFile = "menuButton.png",
		label = " Class List",
		labelColor = {default = { 1,1,1} },
		size = 24,
		emboss=true,
		onRelease = displayClass_function,
		id = "displayClass"
	}

		local addStudent_function = function ( event )
			composer.gotoScene( "addStudent", "fade", 400 )
		end
		
		local addStudent_button = widget.newButton{
			defaultFile = "menuButton.png",
			label = "Add a Student",
			labelColor = {default = { 1,1,1} },
			size = 24,
			emboss=true,
			onRelease = addStudent_function,
			id = "addStudent"
	}
	
	addStudent_button.x = display.contentWidth/2
	addStudent_button.y = display.contentHeight/2 - 200
	displayClass_button.x = display.contentWidth/2
	displayClass_button.y=display.contentHeight/2 + 200
	
	
	localGroup:insert(displayClass_button)
	localGroup:insert(addStudent_button)
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