
local center = display.newImage("Ch3Center.png")
local square = display.newImage("Ch3Square.png")

center.x = display.contentWidth/2
center.y= display.contentHeight/2

square.x = math.random( display.contentWidth  )
square.y = math.random( display.contentHeight )

while (square.x ~= center.x or square.y ~= center.y) do
    if (square.x > center.x) then
        square.x = square.x -1
    elseif (square.x < center.x)then
        square.x = square.x +1
    end

    if (square.y > center.y) then
        square.y = square.y -1
    elseif (square.y < center.y)then
        square.y = square.y +1
    end
end



--transition.to(square, {time = 2000, x=center.x, y = center.y})