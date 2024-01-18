-- Project: Ch 7 BeatBox



system.activate("multitouch")

local snare_wav = audio.loadSound("snare.wav")
local guitar1_wav = audio.loadSound("nylonguitar1.wav")
local guitar2_wav = audio.loadSound("nylonguitar2.wav")
local piano1_wav = audio.loadSound("PianoThingy1.wav")
local piano2_wav = audio.loadSound("PianoThingy2.wav")
local softpiano_mp3 = audio.loadStream("softpianosoundd-cab.mp3")

-----------------
--  Button Press events
-----------------
local playButton1 = function (event)
	audio.play(snare_wav)
end

local playButton2 = function (event)
	audio.play(guitar1_wav)
end

local playButton3 = function (event)
	audio.play(guitar2_wav)
end

local playButton4 = function (event)
	audio.play(piano1_wav)
end

local playButton5 = function (event)
	audio.play(piano2_wav)
end

local playButton6 = function (event)
	audio.play(softpiano_mp3)
end

--Create Buttons
local w = (display.contentWidth/5) - 25
local snareButton = display.newImage( "Button1.png", w, display.contentHeight-100)

local guitar1Button =  display.newImage( "Button2.png", w*2, display.contentHeight-100)

local guitar2Button = display.newImage( "Button3.png", w*3, display.contentHeight-100)
	
local piano1Button = display.newImage( "Button4.png", w*4, display.contentHeight-100)

local piano2Button = display.newImage( "button5.png", w*5, display.contentHeight-100)

local mp3Button = display.newImage( "button6.png", display.contentWidth/2 -25, display.contentHeight/2)
	
snareButton:addEventListener("tap", playButton1)
guitar1Button:addEventListener("tap", playButton2)
guitar2Button:addEventListener("tap", playButton3)
piano1Button:addEventListener("tap", playButton4)
piano2Button:addEventListener("tap", playButton5)
mp3Button:addEventListener("tap", playButton6)