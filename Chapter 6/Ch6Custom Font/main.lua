-- Project: Ch6CustomFont

local fonts = native.getFontNames()

-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
        print( "fontname = " .. tostring( fontname ) )
end

display.newText("Hello World",100, 10, "Baroque Script", 24)

