-- Libraries --
BScr = require "/lib/BScrMain"  -- BScr Library --
UI = require "/lib/thranduil/ui" -- Thranduil UI Library --
Theme = require "/lib/thranduil/TestTheme" -- Thranduil Theme --
lfs = require "/lib/lfs/src/lfs.c"
-- Files --
worldfile = require "world" 
playerfile = require "player" 
entityfile = require "entities"
moddingfile = require "modding"

function love.load()
	blockdata.BlockGraphics()
	entdata.EntGraphics()
	player.PlayerGraphics()
	blockdata.Register( 0, "skyStars", "Sky", skyStars, "Air", false )
	blockdata.Register( 1, "earthDirt", "Dirt", blockDirt0, "Earth", true )
	blockdata.Register( 2, "earthGrass", "Grass", blockGrass0, "Earth", true )
	blockdata.Register( 3, "plantTree", "Tree", plantTree0, "Earth", false )
	entdata.Register( 1, "entBluk", "Bluk", entBluk0, "None", { 255, 255, 255, 250 }, 10, 0 )
	world.Generate()
	ents.Spawn()
	selectBox = bgui.Image( "graphics/selectBox.png" )
	LoadMods()
end

function love.update()
	width, height = bgui.Dimensions()
	mousex, mousey = game.mousePos()
	player.Physics()
	player.Control()
	ents.Physics()
	world.Time()
end

function love.draw()
	love.graphics.push()
	love.graphics.rotate( 0 )
	love.graphics.scale( 1.25 )
	love.graphics.translate( ( width - player.pos[ "x" ] ) - ( 475 / 0.85 ), -50 )
	world.Draw()
	ents.Draw()
	--bgui.img( selectBox, mousex / 25, mousey / 1.75, { 255, 255, 255} )
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