-- Demonstration of working with SQLite and Corona for iOS & Android devices

--include sqlite
require("sqlite3")

-- Does the database exist in the documents directory (allows updating and persistance)
local path = system.pathForFile("zip.sqlite", system.DocumentsDirectory )
file = io.open( path, "r" )
   if( file == nil )then           
   	-- Doesn't Already Exist, So Copy it In From Resource Directory                          
   	pathSource     = system.pathForFile( "zip.sqlite", system.ResourceDirectory )  
   	fileSource = io.open( pathSource, "rb" ) 
   	contentsSource = fileSource:read( "*a" )                                  
		--Write Destination File in Documents Directory                                  
		pathDest = system.pathForFile( "zip.sqlite", system.DocumentsDirectory )                 
		fileDest = io.open( pathDest, "wb" )                 
		fileDest:write( contentsSource )                 
		 -- Done                      
		io.close( fileSource )        
		io.close( fileDest )         
   end   
-- One Way or Another The Database File Exists Now -- So Open Database Connection         
db = sqlite3.open( path )

-- handle the applicationExit event to close the db
local function onSystemEvent( event )
	if( event.type == "applicationExit") then
		db:close()
	end
end

print ("version "..sqlite3.version())
print ("db path "..path)

local count =0
local sql = "SELECT * FROM zipcode LIMIT 20"
for row in db:nrows(sql) do
	count = count +1
	local text = row.city..", "..row.state.." "..row.zip
	local t = display.newText(text, 120, 30 +(20 * count), native.systemFont, 18)
	t:setFillColor(1,1,1)
end

-- system listener for applicationExit
Runtime:addEventListener ("system", onSystemEvent)