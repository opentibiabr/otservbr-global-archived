local portals = {
	
	[63016] = {110016},  --rathleton
	[63020] = {110019}  --rook 
}

-- local pos = Position(31373, 32780, 7) -- Antigo treiner
local pos = Position(31299, 32783, 7) -- {x = 31299, y = 32783, z = 7} 


function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local storage = portals[item.uid]
	if not storage then
		return true
	end

	player:teleportTo(pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(storage[1], 1)
	return true
end
