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
end

function entdata.getRegisteredEnts( filter, filterby )
end

function entdata.spawnEnt( enttable, x, y, health )
end

function ents.Spawn( style )
end

function ents.Draw( style )
end

function ents.Physics()
end