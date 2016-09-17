-- Libraries --
BScr = require "/lib/BScrMain"  -- BScr Library --
UI = require "/lib/thranduil/ui" -- Thranduil UI Library --
Theme = require "/lib/thranduil/TestTheme" -- Thranduil Theme --
-- Files --
playerfile = require "player" 
entityfile = require "entities"

function love.load()
	entdata.EntGraphics()
	player.PlayerGraphics()
	ents.Spawn()
	selectBox = bgui.Image( "graphics/selectBox.png" )
end

function love.update()
	width, height = bgui.Dimensions()
	mousex, mousey = game.mousePos()
	player.Physics()
	player.Control()
	ents.Physics()
end

function love.draw()
	love.graphics.push()
	love.graphics.rotate( 0 )
	love.graphics.scale( 1.25 )
	love.graphics.translate( ( width - player.pos[ "x" ] ) - ( 475 / 0.85 ), -50 )
	ents.Draw()
	love.graphics.pop()
	player.HUD()
end

function love.mouse.mousepressed( x, y, button, isTouch )
	
end

function love.keyboard.keypressed( key, scancode, isTouch )
	if scancode == "escape" then
		
	end
end

-- BScrLib Functions -- CreateData -- SaveData -- LoadData --
function game.CreateData( datafile ) -- Create Data File --
	datafile:write( "nil" ) -- / --
end

function game.SaveData( datafile ) -- Save Data File --
	datafile:write( "nil" )
end

function game.LoadData( save, data ) -- Load Data File --
end