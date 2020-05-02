local setting = {
		[5511] = {storage = Storage.CultsOfTibia.Minotaurs.bossTimer},
		[5513] = {storage = Storage.CultsOfTibia.Humans.bossTimer},
		[5514] = {storage = Storage.CultsOfTibia.Misguided.bossTimer},
		[5515] = {storage = Storage.CultsOfTibia.finalBoss.bossTimer},
		[5516] = {storage = Storage.CultsOfTibia.Orcs.bossTimer},
		[5512] = {storage = Storage.CultsOfTibia.Barkless.bossTimer}
	}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local bossTimer = setting[item.actionid]
	if bossTimer then
		if player:getStorageValue(bossTimer.storage) > os.time() then
			player:sendCancelMessage("You need to wait for 20 hours to face this boss again.")
			player:teleportTo(fromPosition)
			return false
		end
	end
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end