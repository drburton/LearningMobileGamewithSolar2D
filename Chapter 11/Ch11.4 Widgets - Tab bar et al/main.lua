--
-- Project: Ch11.4 tab bar et al.
--
-- Some graphics and code samples borrowed from Solar 2D. 

-- Set the background to white and hide statusbar
display.setDefault( "background", 1, 1, 1 )
display.setStatusBar(display.HiddenStatusBar)

-- Require the widget & composer libraries
local widget = require( "widget" )
local composer = require( "composer" )

-- Create a gradient  to be used by the title bar
local titleGradient = {type = "gradient", 
	color1 = { .8, .85, .9, 1 }, 
	color2 = { .3, .45, .55, 1 },
	direction = "down" }

-- Create a title bar
local titleBar = display.newRect( display.contentWidth/2, 32, display.contentWidth, 32 )
titleBar.y = titleBar.contentHeight * 0.5
titleBar:setFillColor( titleGradient )	

-- Create the title bar text
local titleBarText = display.newText( "Widget Demo", 0, 0, native.systemFontBold, 16 )
titleBarText.x = titleBar.x
titleBarText.y = titleBar.y
	
-- Create buttons table for the tab bar
local tabButtons = 
{
	{
		width = 32, 
		height = 32,
		defaultFile = "tabIcon.png",
		overFile = "tabIcon-down.png",
		label = "Segemented",
		onPress = function() composer.gotoScene( "tab1" ); end,
		selected = true
	},
	{
		width = 32, 
		height = 32,
		defaultFile = "tabIcon.png",
		overFile = "tabIcon-down.png",
		label = "ScrollView",
		onPress = function() composer.gotoScene( "tab2" ); end,
	},
	{
		width = 32, 
		height = 32,
		defaultFile = "tabIcon.png",
		overFile = "tabIcon-down.png",
		label = "Other",
		onPress = function() composer.gotoScene( "tab3" ); end,
	}
}

-- Create a tab-bar and place it at the bottom of the screen
local tabBar = widget.newTabBar
{
	top = display.contentHeight - 50,
	width = display.contentWidth,
	buttons = tabButtons
}

-- Start at tab1
composer.gotoScene( "tab1" )