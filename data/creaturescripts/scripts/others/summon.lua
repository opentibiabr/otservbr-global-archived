local summon = {
	[VOCATION.ID.MASTER_SORCERER] = {name = "thundergiant"},
	[VOCATION.ID.ELDER_DRUID] = {name = "grovebeast"},
	[VOCATION.ID.ROYAL_PALADIN] = {name = "emberwing"},
	[VOCATION.ID.ELITE_KNIGHT] = {name = "skullfrost"}
}

local summonStorage = Storage.PetSummon

function onLogin(player)
	local vocation = summon[player:getVocation()]
	local summonName
	local petTimeLeft = player:getStorageValue(summonStorage) - player:getLastLogout()

	if petTimeLeft > 0 then
		if vocation and vocation:getId() then
			summonName = vocation.name
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
	end
	return true
end


function onThink(creature, interval, item, position, lastPosition, fromPosition, toPosition)
	local player = creature:getMaster()
	if not player then
		return true
	end

	if player and player:getStorageValue(summonStorage) <= os.time() and player:getStorageValue(summonStorage) > 0 then
		doRemoveCreature(getCreatureSummons(player)[1])
		player:setStorageValue(summonStorage,0)
	end
	return true
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(summon,creature:getName():lower()) then
		player:setStorageValue(summonStorage, os.time())
	end
	return true
end
