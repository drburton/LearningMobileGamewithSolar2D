--
-- Project: Project 13.2 JSON
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2013 Brian Burton. All Rights Reserved.
-- 
local json = require "json"

-- JSON script:
local data = {
	["First Name"] = "Brian",
	["Last Name"] = "Burton",
	["Level"] = 9,
	["Score"] = 434434,
	["Location"] = {4.8, 15.16, 23.42},
	["Avatar"] = "Blue42.png"
}


local jsonBlob = json.encode (data)
print (jsonBlob)

-- set the path to the documents directory                        
pathDest = system.pathForFile( "ch13JSON", system.DocumentsDirectory )   
	
-- open/create the file              
local myFile = io.open( pathDest, "w" )                 

myFile:write(jsonBlob)
myFile:flush()
io.close(myFile)   

-- check that the file was created
myFile = io.open( pathDest, "r" )
if myFile then 
    -- the file exists, read the data
   local contents = myFile:read( "*a" )
 
   io.close(myFile)
   local myOutput = json.decode(contents)
      
	display.newText(myOutput["First Name"], 450, 150, nil, 16)
	display.newText(myOutput["Level"], 450, 200, nil, 16)
end