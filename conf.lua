function love.errhand( msg )
	love.window.close()
	print( tostring( msg ) )
	love.window.showMessageBox( "Uh oh, we ran into an error!", tostring( msg ), { "Exit" } )
end

game = { "BlockGame", "BlukSpace" }

function love.conf( conf )
	conf.window.title = "BlockGame " .. game[ 2 ]
	conf.identity = "Arch/" .. game[ 2 ]
	conf.console = true
	conf.window.width = 900
	conf.window.vsync = true
end

function game.error( msg )
	love.errhand( msg )
end