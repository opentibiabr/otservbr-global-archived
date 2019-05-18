local config = {
	[64103] = Position(33475, 32641, 10), -- {x = 33475, y = 32641, z = 10}
	[64104] = Position(33473, 32647, 9), -- {x = 33473, y = 32647, z = 9}
	[64105] = Position(33463, 32585, 8), -- {x = 33463, y = 32585, z = 8}
	[64106] = Position(33457, 32580, 8), -- {x = 33457, y = 32580, z = 8}
	[64107] = Position(33422, 32582, 8), -- {x = 33421, y = 32582, z = 8}
	[64108] = Position(33430, 32600, 10), -- {x = 33430, y = 32600, z = 10}
	[64109] = Position(33420, 32604, 10), -- {x = 33420, y = 32604, z = 10}
	[64120] = Position(33446, 32616, 11),  -- {x = 33446, y = 32616, z = 11}
	
	[64121] = Position(33460, 32632, 10),  -- 
	[64122] = Position(33429, 32626, 10),  --  {x = 33429, y = 32626, z = 10}
	[64123] = Position(33425, 32633, 8),  -- {x = 33425, y = 32633, z = 8}
	[64124] = Position(33435, 32631, 8),  --  {x = 33435, y = 32631, z = 8}
	[64125] = Position(33478, 32621, 10),  --  {x = 33478, y = 32621, z = 10}
	[64126] = Position(33484, 32629, 8),  -- {x = 33484, y = 32629, z = 8}
	[64127] = Position(33452, 32617, 11)  -- {x = 33452, y = 32617, z = 11}
	
	
	
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	--if item.uid == 3206 and player:getStorageValue(Storage.TheShatteredIsles.AccessToLagunaIsland) ~= 1 then
	--	player:teleportTo(Position(32340, 32540, 7))
		--position:sendMagicEffect(CONST_ME_TELEPORT)
	--	Position(32340, 32540, 7):sendMagicEffect(CONST_ME_TELEPORT) 
	--	return true
--	end

	player:teleportTo(targetPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	targetPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end