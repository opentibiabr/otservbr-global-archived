local setting = {
	[24541] = {position = Position(33085, 32096, 13), vocation = 4, storage = 10130}, -- Knight
	[24542] = {position = Position(33264, 32201, 13), vocation = 3, storage = 10131}, -- Paladin
	[24543] = {position = Position(33330, 32077, 13), vocation = 2, storage = 10132}, -- Druid
	[24544] = {position = Position(33183, 32198, 13), vocation = 1, storage = 10133} -- Sorcerer
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.uid]
	if not teleport or player:getVocation():getBase():getId() ~= teleport.vocation or player:getLevel() < 10 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Your vocation cant enter in this teleport.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(teleport.position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(teleport.storage, 1)
	return true
end