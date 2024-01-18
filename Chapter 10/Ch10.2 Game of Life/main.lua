
------
-- Conway's Game of Life in Corona
-- Chapter 10.1
-- Demonstration of multi-dimensional Arrays
-----

local m = 8                  -- number rows / colums
local num_iterations = 10
local myCell = {}
local cell = {}
local iteration = 0

local function setup()
    for i = 1, m do
        cell[i] = {}
        myCell[i] ={}
            for j = 1, m do
                cell[i][j] = 0
                myCell[i][j] = display.newImage("base.png")
                myCell[i][j].x =(i * 32)
                myCell[i][j].y=   (j * 32)+20
            end
    end

   cell[3][2], cell[3][3], cell[3][4], cell[3][5], cell[3][6] = 1, 1, 1, 1, 1 

end
 


local function Evolve( cell )
    local m = #cell
    local cell2 = {}
    for i = 1, m do
        cell2[i] = {}
        for j = 1, m do
            cell2[i][j] = cell[i][j]
        end
    end
 
    for i = 1, m do
        for j = 1, m do
            local count
            if cell2[i][j] == 0 then count = 0 else count = -1 end
            for x = -1, 1 do
                for y = -1, 1 do
                    if i+x >= 1 and i+x <= m and j+y >= 1 and j+y <= m and cell2[i+x][j+y] == 1 then count = count + 1 end
                end
            end
            if count < 2 or count > 3 then cell[i][j] = 0 end
            if count == 3 then cell[i][j] = 1 end
        end
    end
 
    return cell
end    
 
local function updates()
    for i = 1, m do
        for j = 1, m do
            if cell[i][j] == 1 then 
            	myCell[i][j] = display.newImage("life.png")
            	myCell[i][j].x =(i * 32)
                myCell[i][j].y=   (j * 32)+20
            else 
                myCell[i][j] = display.newImage("base.png")
                myCell[i][j].x =(i * 32)
                myCell[i][j].y=   (j * 32)+20
            end
        end
    end  
    cell = Evolve( cell ) 
    iteration = iteration + 1
    print(iteration)

end

setup()

timer.performWithDelay(1500, updates, num_iterations)

