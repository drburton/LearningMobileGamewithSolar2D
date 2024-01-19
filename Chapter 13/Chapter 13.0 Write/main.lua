-- Project: Project 13.0 Database Write


-- set the path to the documents directory                        
pathDest = system.pathForFile( "ch13Write", system.DocumentsDirectory )   
	
-- open/create the file              
local myFile = io.open( pathDest, "w" )                 

myFile:write("Hi Mom! I made a file \n")
myFile:flush()
io.close(myFile)        

-- check that the file was created
myFile = io.open( pathDest, "r" )
if myFile then 
    -- the file exists, read the data
   local contents = myFile:read( "*a" )
   local myOutput ="Contents of \n" .. pathDest .. "\n" .. contents
   io.close(myFile)
   print(myOutput)
   display.newText(myOutput, 420, 50, nil, 12)
end


