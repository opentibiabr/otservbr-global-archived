local summon = {
	[VOCATION.ID.MASTER_SORCERER] = {name = "thundergiant"},
	[VOCATION.ID.ELDER_DRUID] = {name = "grovebeast"},
	[VOCATION.ID.ROYAL_PALADIN] = {name = "emberwing"},
	[VOCATION.ID.ELITE_KNIGHT] = {name = "skullfrost"}
}

local summonStorage = Storage.PetSummon

function onLogin(cid)
	local player = Player(cid)

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
		summonMonster = Game.createMonster(summonName, position, true, false, cid)
		player:addSummon(summonMonster)
		player:setStorageValue(summonStorage, os.time() + petTimeLeft)
		summonMonster:registerEvent('SummonDeath')
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end


function onThink(cid, interval, item, position, lastPosition, fromPosition, toPosition)
	local player = Player(cid)

	if player and player:getStorageValue(summonStorage) <= os.time() and player:getStorageValue(summonStorage) > 0 then
		doRemoveCreature (getCreatureSummons(cid)[1])
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
