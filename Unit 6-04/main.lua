-----------------------------------------------------------------------------------------
--
-- Created by: Aden Rao
-- Created on: April 7, 2019
--
-- This program lets the user enter their age and based on that it tells them how much they have to pay to get into the museam.
--
-----------------------------------------------------------------------------------------

-- Hides status bar
--------------
display.setStatusBar(display.HiddenStatusBar) 
--------------

-- Background colour, calculate button and museam picture.
----------------
display.setDefault( "background", 0/255, 100/255, 200/255 )

local calculateButton = display.newImageRect( "./assets/enterbutton.png", 150, 150 )
calculateButton.x = display.contentCenterX
calculateButton.y = 210
calculateButton.id = " calculateButton "

local museum = display.newImageRect( "./assets/museam.png", 195, 160 )
museum.x = display.contentCenterX
museum.y = 40
museum.id = " museum "
---------------

-- Text telling the user to enter their age and more text telling them to enter the day
----------------
local title1 = display.newText( "Type your age here: ", 160, 290, native.systemFont, 25 )
title1:setFillColor( 0 )

local title2 = display.newText( "Type the day here: ", 160, 410, native.systemFont, 25 )
title2:setFillColor( 0 )
-----------------

-- Text fields for the age and the date 
--------------
local myAgeTextfield = native.newTextField( display.contentCenterX, display.contentCenterY + 110, 300, 60 )
myAgeTextfield.id = " myAgeTextField"

local theDayTextfield = native.newTextField( display.contentCenterX, display.contentCenterY + 230, 300, 60 )
theDayTextfield.id = "the day TextField"
--------------

-- Text where it prints if they are eligible for a discount
----------------
local screenText = display.newText( "Are you eligible for a discount?", 160, 130, native.systemFont, 23 )
screenText:setFillColor( 0 )
----------------

-- Enter button touch event
local function calculateButtonTouch ( event )
	myAge = tonumber( myAgeTextfield.text )
	theDay = ( theDayTextfield.text )
-- If statement to determine how much the user should pay to get into the museam
	if ( myAge >= 12 and myAge <= 21) or ( theDay == "tuesday" or theDay == "thursday") then
		screenText.text = "You pay student pricing"
	elseif myAge <= 3 then
		screenText.text = "You pay infant pricing"
	else
		screenText.text = "You pay normal pricing"
	end
end

calculateButton :addEventListener( "touch", calculateButtonTouch )