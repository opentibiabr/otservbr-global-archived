local config = {
	[24890] = {storage = Storage.FirstDragon.DragonCounter, value = 200, range = 10, timer = Storage.FirstDragon.TazhadurTimer, newPos = Position(32015, 32466, 8), bossName = 'Tazhadur', bossPos = Position(32018, 32465, 8)},
	[24891] = {storage = Storage.FirstDragon.ChestCounter, value = 5, range = 10,  timer = Storage.FirstDragon.KalyassaTimer, newPos = Position(32078, 32456, 8), bossName = 'Kalyassa', bossPos = Position(32079, 32459, 8)},
	[24892] = {storage = Storage.FirstDragon.SecretsCounter, value = 3, range = 10,  timer = Storage.FirstDragon.ZorvoraxTimer, newPos = Position(32008, 32396, 8), bossName = 'Zorvorax', bossPos = Position(32015, 32396, 8)},
	[24893] = {storage = Storage.FirstDragon.GelidrazahAccess, value = 1, range = 10,  timer = Storage.FirstDragon.GelidrazahTimer, newPos = Position(32076, 32402, 8), bossName = 'Gelidrazah The Frozen', bossPos = Position(32078, 32400, 8)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = config[item.actionid]
	if not teleport then
		return
	end

	if player:getStorageValue(Storage.FirstDragon.Start) < 1 or player:getStorageValue(teleport.storage) < teleport.value then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You don\'t have permission to use this portal', TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getStorageValue(teleport.timer) > os.time() then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You have to wait to challenge this enemy again!', TALKTYPE_MONSTER_SAY)
		return true
	end

	if roomIsOccupied(teleport.bossPos, teleport.range, teleport.range) then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Someone is fighting against the boss! You need wait awhile.', TALKTYPE_MONSTER_SAY)
		return true
	end
	clearRoom(teleport.bossPos, teleport.range, teleport.range, fromPosition)
	local monster = Game.createMonster(teleport.bossName, teleport.bossPos, true, true)
	if not monster then
		return true
	end

	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(teleport.newPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:say('You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	addEvent(clearBossRoom, 60 * 10 * 1000, player.uid, monster.uid, teleport.bossPos, teleport.range, teleport.range, fromPosition)
	player:setStorageValue(teleport.timer, os.time() + 2 * 3600)
	return true
end
