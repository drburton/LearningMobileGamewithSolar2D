--
-- Project: Ch11.3 Widgets -TableView
-- 
-- Create 100 rows, and two categories to the tableView:


local widget = require( "widget" )

-- Listen for tableView events
local function tableViewListener( event )
    local phase = event.phase

    print( event.phase )
end

-- Handle row rendering
local function onRowRender( event )
    local phase = event.phase
    local row = event.row

    local rowTitle = display.newText( row, "Row " .. row.index, 0, 0, nil, 14 )
 --   rowTitle.x = row.x - ( row.contentWidth * 0.5 ) + ( rowTitle.contentWidth * 0.5 )
    print(rowTitle)
    rowTitle.anchorX=0
    rowTitle.x =0
    rowTitle.y = row.contentHeight * 0.5
    rowTitle:setFillColor( RED )
end

-- Handle row's becoming visible on screen
local function onRowUpdate( event )
    local row = event.row

    print( "Row:", row.index, " is now visible" )
end

-- Handle touches on the row
local function onRowTouch( event )
    local phase = event.phase

    if "press" == phase then
        print( "Touched row:", event.target.index )
    end
end

-- Create a tableView
local tableView = widget.newTableView
{
    top = 200,
    left = 0,
    width = 320, 
    height = 510,
    maskFile = "mask-410.png",
    listener = tableViewListener,
    onRowRender = onRowRender,
    onRowTouch = onRowTouch,
}


-- Create 100 rows
for i = 1, 100 do
    local isCategory = false
    local rowHeight = 40
    local rowColor = 
    { 
        default = { 1, 1, 1 },
    }
    local lineColor = { .9, .9, .9 }

    -- Make some rows categories
    if i == 25 or i == 50 or i == 75 then
        isCategory = true
        rowHeight = 24
        rowColor = 
        { 
            default = { .5, .5, .6 },
        }
    end

    -- Insert the row into the tableView
    tableView:insertRow
    {
        isCategory = isCategory,
        rowHeight = display.contentHeight*.1,
        rowColor = rowColor,
        lineColor = lineColor,
    }
end 
 
-- delete the tenth row in the tableView
--tableView:deleteRow( 10 )   
