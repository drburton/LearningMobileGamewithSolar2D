-- Project: Splash Screen
-- Description:  Show a splash screen

local function splash()
    -- Create a group to make dismissing the splash screen easy
   splashGroup = display.newGroup()
  
	-- Create a background with from a vector rectangle.  Must be a global variable since it is called outside of the function
	bg = display.newRect(splashGroup, 0, 0, 320, 480)
	bg:setFillColor( .05, .05, .9)
		
		-- Add text object of app title
	local  splashText = display.newText(splashGroup, "Hi\n Dad!", 100, 150,native.systemFont, 40 )
	splashText.rotation=-30
	
	-- Tell the user how to proceed
	local proceedText = display.newText(splashGroup, "Tap To Give A Shout Out", display.contentWidth/2-100, display.contentHeight-100, nil, 20)
	
end

function hiDad()
	textObj = display.newText("Can I have $10?", 50, display.contentHeight/2, native.systemFont, 24)
	textObj:setTextColor(1,1,1)
end

local function bgButton(event)
	-- handle dismissing the splash screen when it is tapped by fading out the splashGroup
	transition.to(splashGroup, {alpha = 0, time = 3000})
	
	-- pass control to the main function
	main()
end

function main()
	   -- remove splashGroup from memory
	   splashGroup:removeSelf()
       hiDad()
end

-- now call the splash screen and add the event listener for the background
splash()
bg:addEventListener("tap", bgButton)



