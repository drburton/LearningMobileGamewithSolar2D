-- Project: Project10.1

local myArray ={}
 myArray[1]={"Joe", "Jean", "Fred", "Cindy"}
 myArray[2] = {"Smith", "Smith", "Smith", "Smith"}
 myArray[3]={"142 Main", "163 South St."} 
 myArray[4]={}
 myArray[5] = {}
 myArray[6] = {}


for i = 1, 6 do
	for j = 1,4 do
		print (myArray[i][j])
	end
end




