-- BSCRIPT FOR LÖVE -- ARCH 2016 --
--[[ Objects ]]--
-- game -- bgui -- data -- bool --
--[[ String Functions ]]--
-- String Explode --
--[[ Math Functions ]]--
-- DivE --
--[[ Bool Functions ]]--
-- Opposite --
--[[ Table Functions ]]--
-- Table Count --
--[[ Distance Functions ]]--
-- Distance -- pos:Distance --
--[[ Data Functions ]]--
-- Data Create -- Data Save -- Data Load --
--[[ Graphics Functions ]]--
-- BGui Text -- BGui Img --

-- Objects -- game -- bgui -- data -- bool -- world --
game = {} -- game --
bgui = {} -- bgui --
data = {} -- data --
bool = {} -- bool --

-- Whatever --
width, height = love.graphics.getDimensions()
bgui.Image = love.graphics.newImage
bgui.Dimensions = love.graphics.getDimensions
game.world = love.physics
game.mousePos = love.mouse.getPosition

-- String Functions -- Explode --
function string.explode( str, div ) -- Explode --
    assert( type( str ) == "string" and type( div ) == "string", "Invalid! Attempted to explode " .. tostring( str ) .. " with " .. tostring( div ) .. " !" )
    local o = {}
    while true do
        local pos1, pos2 = str:find( div )
        if not pos1 then
            o[ #o + 1 ] = str
            break
        end
        o[ #o + 1 ], str = str:sub( 1, pos1 - 1 ), str:sub( pos2 + 1 )
    end
    return o
end

-- Math Functions -- DivE --
function math.DivE( n1, n2 )
	return bool.Opposite( n1 % n2 ~= 0 )
end

function math.Between( k, v1, v2 )
	if v1 <= k and v2 >= k then return true else return false end
end

-- Bool Functions -- Opposite --
function bool.Opposite( i )
	if ( i == true ) then return false
	elseif ( i == false ) then return true
	end
end

-- Table Functions -- Count --
function table.Count( tbl ) -- Count --
	local i = 0
	for k, v in pairs( tbl ) do
		i = i + 1
	end
	return i
end

-- Distance Functions -- Distance -- pos:Distance --
function Distance( x1, y1, x2, y2 ) -- Distance --
	return ( ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2 ) ^ 0.5
end

-- Data Functions -- Create -- Save -- Load --
function data.create() -- Create --
	print( "Writing save data..." )
	local datafile = love.filesystem.newFile( "data.txt" )
	datafile:open( "w" )
	game.CreateData( datafile )
	datafile:close()
	data.load()
end

function data.save() -- Save --
	print( "Writing save data..." )
	local datafile = love.filesystem.newFile( "data.txt" )
	datafile:open( "w" )
	game.SaveData( datafile )
	datafile:close()
	data.load()
end

function data.load() -- Load --
	if not love.filesystem.exists( "data.txt" ) then
		print( "No save data found. Creating a new save file..." )
		data.create()
	else
		print( "Loading from save file..." )
		local save = love.filesystem.read( "data.txt" )
		local data = string.explode( save, "/" )
		game.LoadData( save, data )
	end
end

-- Graphics Functions -- Text -- Img --
function bgui.text( text, x, y, font, fontsize, colour, alignment ) -- Text --
	love.graphics.setColor( colour[1], colour[2], colour[3], colour[4] )
	love.graphics.setNewFont( font, fontsize )
	love.graphics.printf( tostring( text ), x, y, 800, alignment )
end

function bgui.img( img, x, y, colour ) -- Img --
	love.graphics.setColor( colour[1], colour[2], colour[3], colour[4] )
	love.graphics.draw( img, x, y )
end