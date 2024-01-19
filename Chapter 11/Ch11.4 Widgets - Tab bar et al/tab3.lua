--
-- Project: scrollViewMask-350.png
--
-- 
-- 
local widget = require( "widget" )
local composer = require( "composer" )
local scene = composer.newScene()

-- Our scene
function scene:create( event )
	local group = self.view
	
	print("Tab 3 Scene")
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
	-- widget.newSpinner()
	---------------------------------------------------------------------------------------------
	
	-- Create a spinner widget
	local spinner = widget.newSpinner
	{
		left = display.contentWidth/2,
		top = 55,
	}
	group:insert( spinner )
	
	-- Start the spinner animating
	spinner:start()
	
	---------------------------------------------------------------------------------------------
	-- widget.newStepper()
	---------------------------------------------------------------------------------------------
	
	-- Create some text for the stepper
	local currentValue = display.newText( "Value: 00", 165, 105, native.systemFont, 20 )
	currentValue:setTextColor( 0 )
	group:insert( currentValue )
	
	-- The listener for our stepper
	local function stepperListener( event )
		local phase = event.phase

		-- Update the text to reflect the stepper's current value
		currentValue.text = "Value: " .. string.format( "%02d", event.value )
	end
	
	-- Create a stepper
	local newStepper = widget.newStepper
	{
	    left = 115,
	    top = 115,
	    initialValue = 0,
	    minimumValue = 0,
	    maximumValue = 50,
	    onPress = stepperListener,
	}
	group:insert( newStepper )
	
	
	
	---------------------------------------------------------------------------------------------
	-- widget.newSwitch()
	---------------------------------------------------------------------------------------------
	
	-- The listener for our radio switch
	local function radioSwitchListener( event )
		-- Update the status box text
		statusText.text = event.target.id.."\nIs on" 
		
		-- Update the status box text position
		statusText.x = statusBox.x
		statusText.y = statusBox.y - ( statusBox.contentHeight * 0.5 ) + ( statusText.contentHeight * 0.5 )
	end
		
	-- Create some text to label the radio button with
	local radioButtonText = display.newText( "Use?", 60, 160, native.systemFont, 16 )
	radioButtonText:setTextColor( 0 )
	group:insert( radioButtonText )
		
	-- Create a default radio button (using widget.setTheme)
	local radioButton = widget.newSwitch
	{
	    left = 25,
	    top = 180,
	    style = "radio",
	    id = "Radio Button1",
	    initialSwitchState = true,
	    onPress = radioSwitchListener,
	}
	group:insert( radioButton )
	
	local otherRadioButton = widget.newSwitch
	{
	    left = 55,
	    top = 180,
	    style = "radio",
	    id = "Radio Button2",
	    initialSwitchState = false,
	    onPress = radioSwitchListener,
	}
	group:insert( otherRadioButton )
	
	-- Create some text to label the checkbox with
	local checkboxText = display.newText( "Sound?", 140, 160, native.systemFont, 16 )
	checkboxText:setTextColor( 0 )
	group:insert( checkboxText )
	
	-- The listener for our checkbox switch
	local function checkboxSwitchListener( event )
		-- Update the status box text
		statusText.text = "Checkbox Switch\nIs on?: " .. tostring( event.target.isOn )
		
		-- Update the status box text position
		statusText.x = statusBox.x
		statusText.y = statusBox.y - ( statusBox.contentHeight * 0.5 ) + ( statusText.contentHeight * 0.5 )
	end
	
	-- Create a default checkbox button (using widget.setTheme)
	local checkboxButton = widget.newSwitch
	{
	    left = 120,
	    top = 180,
	    style = "checkbox",
	    id = "Checkbox button",
	    onPress = checkboxSwitchListener,
	}
	group:insert( checkboxButton )

	-- Create some text to label the on/off switch with
	local switchText = display.newText( "Music?", 220, 160, native.systemFont, 16 )
	switchText:setTextColor( 0 )
	group:insert( switchText )

	-- The listener for our on/off switch
	local function onOffSwitchListener( event )
		-- Update the status box text
		statusText.text = "On/Off Switch\nIs on?: " .. tostring( event.target.isOn )
		
		-- Update the status box text position
		statusText.x = statusBox.x
		statusText.y = statusBox.y - ( statusBox.contentHeight * 0.5 ) + ( statusText.contentHeight * 0.5 )
	end

	-- Create a default on/off switch (using widget.setTheme)
	local onOffSwitch = widget.newSwitch
	{
	    left = 190,
	    top = 180,
	    initialSwitchState = true,
	    onPress = onOffSwitchListener,
	    onRelease = onOffSwitchListener,
	}
	group:insert( onOffSwitch )	
end

scene:addEventListener( "create" )

return scene