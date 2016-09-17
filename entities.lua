--[[
	Non-Boss entities should be 40x40.
	!!! ENTDATA FORMAT !!!
		ENT ID
		ENT NAME
		ENT SIMPLENAME
		ENT GRAPHIC
		ENT TYPE
		ENT COLOUR
		ENT HEALTH
		ENT DAMAGE
	!!! ENTDATA FORMAT !!!
	!!! WORLDENT FORMAT !!!
		ENT UNIQUE ID
		ENT TABLE
		ENT POS[ X, Y ]
		ENT HEALTH
	!!! WORLDENT FORMAT !!!
--]]
game.ents = {}
entdata = {}
ents = {}

function entdata.EntGraphics()
	entBluk0 = bgui.Image( "graphics/entBluk0.png" )
end

function entdata.Register( id, name, sname, graphic, etype, colour, health, damage )
	local bd = {
		id = id,
		name = name,
		sname = sname,
		graphic = graphic,
		etype = etype,
		colour = colour,
		health = health,
		damage = damage
	}
	game.ents[ id ] = bd
	return bd
end

function entdata.getRegisteredEnts( filter, filterby )
	local returnEnts = {}
	if filter == true then
		for k, v in pairs( game.ents ) do
			if v[ k ] == filter then
				table.insert( returnEnts, v )
			end
		end
	else
		return game.ents
	end
	return returnEnts
end

function entdata.spawnEnt( enttable, x, y, health )
end

function ents.Spawn( style )
end

function ents.Draw( style )
end

function ents.Physics()
end