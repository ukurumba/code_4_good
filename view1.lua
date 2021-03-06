-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")

local Group = {}
Group.__index = Group
function Group.new(team_name)
	local team = setmetatable({}, Group)
	team.list = {}
	team.score = 0
	team.name = team_name
	team.badges = {}
	return team
end

--add a name to the Group
--function Group.add_member(team, name)
--	team.list.insert(team.list, name)
--	return team.list
--end

--increase the score of the group
function Group.increase_score(team, number)
	team.score = team.score + number
	return team.score
end

a = Group.new("Test1")
print(a.name)
a.increase_score(a, 10)
print(a.score)

score = 20
local Player = {}
Player.__index = Player
function Player.new(name,email)
	self = setmetatable({},Player)
	self.friends = {}
	self.name = name
	self.email = email
	self.level = 1
	self.internal_score = 20
	return self
end 

function Player.score_increase(Player,val)
	Player.internal_score = Player.internal_score + val
end

function Player.level_up()
	while self.internal_score > score do
		self.level = self.level + 1
		self.internal_score = self.internal_score - score
	end
end




function scene:create( event )

	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	
	-- create a white background to fill screen
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 1 )	-- white
	
	-- create some text
	local title = display.newText( "First View", display.contentCenterX, 125, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black

P1 = Player.new('Arnold','@gmail.com')
P1.score_increase(P1,50)
P1.level_up()
print(P1.name)

	local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Create the widget
local button1 = widget.newButton(
    {
        width = display.contentwidth,
		height = 60,
		x = display.contentCenterX,
		y = display.contentCenterY,
		defaultFile = "button.png",
        id = "button1",
        onEvent = handleButtonEvent
    }
)

	local newTextParams = { text = P1.name .. "   " .. P1.level,  
						x = display.contentCenterX, 
						y = display.contentCenterY, 
						width = 310, height = 310, 
						font = native.systemFont, fontSize = 30, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black



	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( background )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene