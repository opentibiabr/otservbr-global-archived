local setting = {
	[VOCATION.ID.MASTER_SORCERER] = {name = "thundergiant"},
	[VOCATION.ID.ELDER_DRUID] = {name = "grovebeast"},
	[VOCATION.ID.ROYAL_PALADIN] = {name = "emberwing"},
	[VOCATION.ID.ELITE_KNIGHT] = {name = "skullfrost"}
}

local storage = Storage.PetSummon

function onLogin(player)
	local vocationId = setting[player:getVocation():getId()]
	local summonName
	local petTimeLeft = player:getStorageValue(storage) - player:getLastLogout()

	if petTimeLeft > 0 then
		if vocationId then
			summonName = vocationId.name
		end
	end

	if summonName then
		position = player:getPosition()
		summonMonster = Game.createMonster(summonName, position, true, false)
		player:addSummon(summonMonster)
		summonMonster:reload()
		player:setStorageValue(storage, os.time() + petTimeLeft)
		summonMonster:registerEvent("SummonDeath")
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		
		local deltaSpeed = math.max(player:getBaseSpeed() - summonpet:getBaseSpeed(), 0)
		summonpet:changeSpeed(deltaSpeed)
	end
	return true
end

function onThink(creature, interval, item, position, lastPosition, fromPosition, toPosition)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if player and player:getStorageValue(storage) <= os.time() and player:getStorageValue(storage) > 0 then
		doRemoveCreature (getCreatureSummons(cid)[1])
		player:setStorageValue(storage,0)
	end
	return true
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(setting, creature:getName():lower()) then
		player:setStorageValue(storage, os.time()) --Imeddiately expire creature
	end
	return true
end
