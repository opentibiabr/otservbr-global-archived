local setting = {
	[24541] = {destination = Position(33085, 32096, 13), vocation = VOCATION.CLIENT_ID.KNIGHT, storage = 10130},
	[24542] = {destination = Position(33264, 32201, 13), vocation = VOCATION.CLIENT_ID.PALADIN, storage = 10131},
	[24543] = {destination = Position(33330, 32077, 13), vocation = VOCATION.CLIENT_ID.DRUID, storage = 10132},
	[24544] = {destination = Position(33183, 32198, 13), vocation = VOCATION.CLIENT_ID.SORCERER, storage = 10133}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.uid]
	if not teleport or player:getVocation():getClientId() ~= teleport.vocation or player:getLevel() < 10 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Your vocation cant enter in this teleport.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(teleport.destination)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(teleport.storage, 1)
	return true
end