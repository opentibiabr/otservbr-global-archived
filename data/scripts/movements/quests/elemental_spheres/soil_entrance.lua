local setting = {
	[1307] = {destination = Position(33085, 32096, 13), vocation = VOCATION.BASE_ID.KNIGHT, storage = 10130},
	[1308] = {destination = Position(33264, 32201, 13), vocation = VOCATION.BASE_ID.PALADIN, storage = 10131},
	[1309] = {destination = Position(33330, 32077, 13), vocation = VOCATION.BASE_ID.DRUID, storage = 10132},
	[1310] = {destination = Position(33183, 32198, 13), vocation = VOCATION.BASE_ID.SORCERER, storage = 10133}
}

local soilEntrance = MoveEvent()

function soilEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.uid]
	if not teleport or player:getVocation():getBaseId() ~= teleport.vocation or player:getLevel() < 10 then
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

soilEntrance:type("stepin")

for index, value in pairs(setting) do
	soilEntrance:uid(index)
end

soilEntrance:register()
