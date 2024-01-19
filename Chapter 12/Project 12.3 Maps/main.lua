
local myMap = native.newMapView(0, 0, display.contentWidth, display.contentHeight)
myMap.mapType = "hybrid"

myMap.x = display.contentWidth/2
myMap.y = display.contentHeight/2
myMap:setCenter( 37.331692, -122.030456 )
local latitude, longitude = mymap:requestLocation( "1900 Embarcadero Rd., Palo Alto, CA 94303" )
myMap:addMarker(latitude,longitude,{title="Corona Labs"})
myMap:setCenter( latitude, longitude )
