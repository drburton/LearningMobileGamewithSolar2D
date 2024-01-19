local widget = require("widget")

	---------------------------------------------------------------------------------------------
	-- widget.newProgressView()
	---------------------------------------------------------------------------------------------
	
	local newProgressView = widget.newProgressView
	{
		left = 100,
		top = 150,
		width = 150,
		isAnimated = true,
	}
	
	
	-- The listener for our slider
	local function sliderListener( event )
		-- Update the progress view
		print(event.value)
	    newProgressView:setProgress( event.value/100 )
	end
	
	--------------------------------------------------------------------------------------------	
	-- Create a horizontal slider
	--------------------------------------------------------------------------------------------
	local horizontalSlider = widget.newSlider
	{
		left = 100,
		top = 232,
		width = 150,
		id = "Horizontal Slider",
		listener = sliderListener,
	}
	

	