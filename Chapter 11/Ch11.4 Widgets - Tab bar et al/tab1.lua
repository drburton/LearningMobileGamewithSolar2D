--
-- Project: tabIcon.png
-- Add a segmented control
-- 
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

-- Our scene
function scene:create( event )
	local group = self.view
	print ("Tab 1 Scene")
	
	-- Status text box
	local statusBox = display.newRect( display.contentWidth/2, 290, 210, 120 )
	statusBox:setFillColor( 0, 0, 0 )
	statusBox.alpha = 0.4
	group:insert( statusBox )
	
		-- Status text
	local statusText = display.newText( "Interact with a widget to begin!", 80, 300, 200, 0, native.systemFont, 20 )
	statusText.x = statusBox.x
	statusText.y = statusBox.y - ( statusBox.contentHeight * 0.5 ) + ( statusText.contentHeight * 0.5 )
	group:insert( statusText )
	
		---------------------------------------------------------------------------------------------
	-- widget.newSegmentedControl()
	---------------------------------------------------------------------------------------------
	
	-- The listener for our segmented control
	local function segmentedControlListener( event )
		local target = event.target
		
		-- Update the status box text
		statusText.text = "Segmented Control\nSegment Pressed: " .. target.segmentLabel
		
		-- Update the status box text position
		statusText.x = statusBox.x
		statusText.y = statusBox.y - ( statusBox.contentHeight * 0.5 ) + ( statusText.contentHeight * 0.5 )
	end
	
	-- Create a default segmented control (using widget.setTheme)
	local segmentedControl = widget.newSegmentedControl
	{
	    left = 10,
	    top = 60,
	    segments = { "Aren't", "Segment", "Control", "Widgets", "Fun?" },
	    defaultSegment = 1,
	    onPress = segmentedControlListener,
	}
	group:insert( segmentedControl )
	end

scene:addEventListener( "create" )

return scene