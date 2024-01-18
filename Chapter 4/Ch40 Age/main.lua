--
-- Project: Ch4.0 Age
-- Description: Compute how long someone has been alive given date of birth (approximation) 
 

local daysInYear = 365.2425   -- number of days in a year based upon gregorian calendar.
local weeksInYear = daysInYear / 7
local daysInMonth = daysInYear / 12   -- average number of days in a month
local weeksInMonth = daysInMonth / 7 -- averaage number of weeks in a month
local secInMin = 60    -- number of seconds in a minute
local secInHour = 60 * secInMin   -- number of seconds in a hour
local secInDay = 24 * secInHour   -- number of seconds in a day
local secInWeek = 7 * secInDay    -- number of seconds in a week
local secInMonth = daysInMonth *secInDay  -- average number of seconds in a month
local secInYear = daysInYear *secInDay -- number of seconds in a year
local todaysDate = os.date("*t")
--print (todaysDate.year, todaysDate.month, todaysDate.day)

-- load background to be used for dismissing keyboard
local background= display.newImage("bkgrd.png", 0, 0)
local submit = display.newImage("submit.png")
submit.x = display.contentWidth/2
submit.y = display.contentHeight-100

-- Get the users name and birthdate
local nameInstructions = display.newText("Enter your name", 200, 50, native.systemFont, 24 )
local usersName = native.newTextField(200, 100, 350, 50)
usersName.inputType = "default"
local bdayInstructions = display.newText("Enter your birthdate (mm/dd/yyyy)", 250, 160, native.systemFont, 24)

local bday = native.newTextField(200, 200, 350, 50)
bday.inputType = "default"


local function keyboardListener (event)
	native.setKeyboardFocus(nil)
end

local function calculateAge()
	-- Get the birth year, month, and day
	local bdayLen = string.len(bday.text)
	
	local birthYear = string.sub(bday.text, bdayLen-3, bdayLen)
	local birthMonth = string.sub(bday.text, 1,2)
	local birthDay = string.sub(bday.text, 4, 5)
--	print(birthYear, birthMonth, birthDay)


	bday:removeSelf()
	usersName:removeSelf()
	nameInstructions:removeSelf()
	bdayInstructions:removeSelf()

	-- How many seconds from 1/1/1 to today
	local totalSecToday = (todaysDate.year * secInYear) + (todaysDate.month * secInMonth) + (todaysDate.day * secInDay)
	--How many seconds from year 0 to birthdate
	local totalSecBday = (birthYear * secInYear) + (birthMonth * secInMonth) + (birthDay * secInDay)
	local totalSecAlive = totalSecToday - totalSecBday
	local secAliveText = display.newText(usersName.text..", you have been Alive for :", display.contentCenterX, 100, native.systemFont, 30)
	local secAlive = display.newText(totalSecAlive.." seconds", 200, 200, native.systemFont, 30)
	local secAliveText2 = display.newText("and counting", 200, 300, native.systemFont, 30)
	
end


background:addEventListener("tap", keyboardListener)
submit:addEventListener("tap", calculateAge)
