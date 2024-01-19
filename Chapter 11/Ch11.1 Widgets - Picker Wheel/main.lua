
local widget = require "widget"


-- setup data that will be used in a column
local minutes = {}
for i=0,59 do
   minutes[i] = i
end


-- create table to hold all column data
local columnData = {
	{ -- column 1
	labels = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" },
	align = "right",
	startIndex = 7,	
},
{ -- column 2 
	labels = minutes,
	align = "center",
	startIndex = 30,
	},
	{-- column 3
	labels = { "AM", "PM" },
	startIndex = 2,
		}
	}


-- create the actual picker widget with column data
local picker = widget.newPickerWheel{
        id="myPicker",
        top=258,
        columns=columnData
}



local function showValues( event )
		-- Retrieve the current values from the picker
		local values = picker:getValues()
		
		-- print the selected values
		print( "Column 1: " .. values[1].value .. "Column 2: " .. values[2].value .. "Column 3: " .. values[3].value)		
end	

local getValuesButton = widget.newButton
	{
	    left = 10,
	    top = 150,
		width = 298,
		height = 56,
		id = "getValues",
	    label = "Values",
	    onRelease = showValues,
	}	