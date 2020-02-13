local random_positions = {
	{x = 33913, y = 31653, z = 9},
	{x = 33921, y = 31650, z = 9}
}

local square = {
	fromPos = {x = 33857, y = 31526, z = 7},
	toPos = {x = 33872, y = 31539, z = 7}
}

local potion = Action()

function potion.onUse(player, item, frompos, item2, topos)


for a = square.fromPos.x, square.toPos.x do
	for b = square.fromPos.y, square.toPos.y do
		for c = square.fromPos.z, square.toPos.z do

		local tile = Tile(Position(a, b, c))
		
			if (player:getSlotItem(9).itemid == 36141) then
				if tile and tile:getTopCreature() and tile:getTopCreature():isPlayer() then

				local randomteleport = random_positions[math.random(#random_positions)]

					player:teleportTo(randomteleport)
					player:removeItem(36185, 1)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You feel shaky and dizzy, the world turns dark around you. Then your sight clears again - and you are somewhere else.")
				end
			end
		end
	end
end


return false
end


potion:id(36185)
potion:register()