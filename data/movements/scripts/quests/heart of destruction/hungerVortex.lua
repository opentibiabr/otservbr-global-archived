function onStepIn(creature, item, position, fromPosition)

	if item.itemid == 26125 then
		if isMonster(creature) then
			if creature:getName() == "The Hunger" then
				local tile = Tile({x = 32244, y = 31371, z = 14})
				if tile then
					local ground = tile:getGround()
					if ground then
						ground:transform(26126)
						ground:decay()
					end
				end
			elseif creature:getName() == "World Devourer" then
				local tile = Tile({x = 32271, y = 31346, z = 14})
				if tile then
					local ground = tile:getGround()
					if ground then
						ground:transform(26126)
						ground:decay()
					end
				end
			end
		end
	elseif item.itemid == 26126 then
		if isMonster(creature) then
			if creature:getName() == "Greed" then
				creature:remove()
				hungerSummon = hungerSummon - 1
				devourerSummon = devourerSummon - 1
			end
		end
	end

	return true
end
