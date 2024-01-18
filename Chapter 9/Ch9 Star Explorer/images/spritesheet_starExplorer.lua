--
-- created with TexturePacker (http://www.texturepacker.com)
--
-- $TexturePacker:SmartUpdate:9658d9ef1c55afdcf7d1fefdfffbbe97$
--
-- local sheetInfo = require("myExportedImageSheet") -- lua file that Texture packer published
--
-- local myImageSheet = graphics.newImageSheet( "ImageSheet.png", sheetInfo:getSheet() ) -- ImageSheet.png is the image Texture packer published
--
-- local myImage1 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name1"))
-- local myImage2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("image_name2"))
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
        {
            -- asteroids1
            x=0,
            y=103,
            width=207,
            height=178,

        },
        {
            -- asteroids2
            x=0,
            y=283,
            width=207,
            height=142,
        },
        {
            -- asteroids3
            x=0,
            y=0,
            width=215,
            height=101,
        },
        {
            -- shot
            x=217,
            y=30,
            width=12,
            height=37,
        },
        {
            -- smallasteroid
            x=217,
            y=0,
            width=33,
            height=28,
        },
        {
            -- starfighter1
            x=0,
            y=426,
            width=76,
            height=82,
        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["asteroids1"] = 1,
    ["asteroids2"] = 2,
    ["asteroids3"] = 3,
    ["shot"] = 4,
    ["smallasteroid"] = 5,
    ["starfighter1"] = 6,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
