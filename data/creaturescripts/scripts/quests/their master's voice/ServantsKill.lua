local magePositions = {
	Position(33328, 31859, 9),
	Position(33367, 31873, 9),
	Position(33349, 31899, 9)
}

local positions = {
	Position(33313, 31852, 9),
	Position(33313, 31881, 9),
	Position(33328, 31860, 9),
	Position(33328, 31873, 9),
	Position(33328, 31885, 9),
	Position(33308, 31873, 9),
	Position(33320, 31873, 9),
	Position(33335, 31873, 9),
	Position(33360, 31873, 9),
	Position(33336, 31914, 9),
	Position(33343, 31914, 9),
	Position(33353, 31914, 9),
	Position(33361, 31914, 9),
	Position(33345, 31900, 9),
	Position(33352, 31900, 9),
	Position(33355, 31854, 9),
	Position(33355, 31885, 9),
	Position(33345, 31864, 9),
	Position(33345, 31881, 9),
	Position(33309, 31867, 9),
	Position(33317, 31879, 9),
	Position(33311, 31854, 9),
	Position(33334, 31889, 9),
	Position(33340, 31890, 9),
	Position(33347, 31889, 9)
}

local servants = {
	'iron servant', -- 50%
	'iron servant',
	'iron servant',	
	'iron servant',	
	'iron servant',	
	'golden servant', -- 40%	
	'golden servant',
	'golden servant',	
	'golden servant',	
	'diamond servant' -- 10%
}

local function fillFungus(fromPosition, toPosition)
	for x = fromPosition.x, toPosition.x do
		for y = fromPosition.y, toPosition.y do
			local position = Position(x, y, 9)
			local tile = Tile(position)
			if tile then
				local item = tile:getItemById(13590)
				if item then
					local slimeChance = math.random(100)
					if slimeChance <= 30 then
						item:transform(math.random(13585, 13589))
						position:sendMagicEffect(CONST_ME_YELLOW_RINGS)
					end	
				end
			end
		end
	end
end

local function summonServant(position)
	Game.createMonster(servants[math.random(#servants)], position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	if not isInArray(servants, targetMonster:getName():lower()) then
		return true
	end

	local wave, killedAmount = Game.getStorageValue(GlobalStorage.TheirMastersVoice.CurrentServantWave), Game.getStorageValue(GlobalStorage.TheirMastersVoice.ServantsKilled)
	local numberofwaves = 19 -- first wave number = 0, so '19' = 20 waves of servants
	if killedAmount < (#positions - 1) and wave <= numberofwaves then
		Game.setStorageValue(GlobalStorage.TheirMastersVoice.ServantsKilled, killedAmount + 1)
	elseif killedAmount == (#positions - 1) and wave < numberofwaves then
		Game.setStorageValue(GlobalStorage.TheirMastersVoice.ServantsKilled, 0)
		Game.setStorageValue(GlobalStorage.TheirMastersVoice.CurrentServantWave, wave + 1)
		for i = 1, #positions do
			addEvent(summonServant, 5 * 1000, positions[i])
		end	
	elseif killedAmount == (#positions - 1) and wave == numberofwaves then
		Game.createMonster("Mad Mage", magePositions[math.random(#magePositions)])
		targetMonster:say('The Mad Mage has been spawned!', TALKTYPE_MONSTER_SAY)
		fillFungus({x = 33306, y = 31847}, {x = 33369, y = 31919})
	end
	return true
end
