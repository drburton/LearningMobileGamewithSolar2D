--
-- Project: Project 13.1 Append

-- set the path to the documents directory                        
pathDest = system.pathForFile( "ch13Append", system.DocumentsDirectory )   
	
-- open/create the file              
local myFile = io.open( pathDest, "a" )                 

myFile:write("Hi Dad! I made a file\n")
myFile:flush()
io.close(myFile)        

-- check that the file was created
myFile = io.open( pathDest, "r" )
if myFile then 
    -- the file exists, read the data
   local contents = myFile:read( "*a" )
   local myOutput ="Contents of \n" .. pathDest .. "\n" .. contents 
   io.close(myFile)
	display.newText(myOutput, 600, 150, nil, 16)
end


