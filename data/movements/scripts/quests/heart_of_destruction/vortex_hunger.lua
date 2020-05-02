function onStepIn(creature, item, position, fromPosition)
	local monster = creature:getMonster()
	if not monster then
		return true
	end

	if item.itemid == 26125 then
		if creature:getName():lower() == "the hunger" then
			local tile = Tile({x = 32244, y = 31371, z = 14})
			if tile then
				local ground = tile:getGround()
				if ground then
					ground:transform(26126)
					ground:decay()
				end
			end
		elseif creature:getName():lower() == "world devourer" then
			local tile = Tile({x = 32271, y = 31346, z = 14})
			if tile then
				local ground = tile:getGround()
				if ground then
					ground:transform(26126)
					ground:decay()
				end
			end
		end
	elseif item.itemid == 26126 then
		if isMonster(creature) then
			if creature:getName():lower() == "greed" then
				creature:remove()
				hungerSummon = hungerSummon - 1
				devourerSummon = devourerSummon - 1
			end
		end
	end
	return true
end
