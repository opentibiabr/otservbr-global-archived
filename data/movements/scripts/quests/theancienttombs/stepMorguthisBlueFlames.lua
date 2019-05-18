local config = {
	[50139] = Storage.TheAncientTombs.MorguthisBlueFlameStorage1,
	[50140] = Storage.TheAncientTombs.MorguthisBlueFlameStorage2,
	[50141]	= Storage.TheAncientTombs.MorguthisBlueFlameStorage3,
	[50142]	= Storage.TheAncientTombs.MorguthisBlueFlameStorage4,
	[50143] = Storage.TheAncientTombs.MorguthisBlueFlameStorage5,
	[50144] = Storage.TheAncientTombs.MorguthisBlueFlameStorage6,
	[50145] = Storage.TheAncientTombs.MorguthisBlueFlameStorage7
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local tableTarget = config[item.uid]
	if tableTarget then
		if player:getStorageValue(tableTarget) ~= 1 then
			player:setStorageValue(tableTarget, 1)
		end

		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		local missingStorage = false
		for i = Storage.TheAncientTombs.MorguthisBlueFlameStorage1, Storage.TheAncientTombs.MorguthisBlueFlameStorage7 do
			if player:getStorageValue(i) ~= 1 then
				missingStorage = true
				break
			end
		end

		if missingStorage then
			player:teleportTo(fromPosition, true)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		player:teleportTo(Position(33163, 32694, 14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end