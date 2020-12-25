local summon = {
    [VOCATION.CLIENT_ID.SORCERER] = {name = "Sorcerer familiar"},
    [VOCATION.CLIENT_ID.DRUID] = {name = "Druid familiar"},
    [VOCATION.CLIENT_ID.PALADIN] = {name = "Paladin familiar"},
    [VOCATION.CLIENT_ID.KNIGHT] = {name = "Knight familiar"}
}

local summonStorage = Storage.PetSummon

local summonLogin = CreatureEvent("SummonLogin")
function summonLogin.onLogin(player)
	local vocation = summon[player:getVocation():getClientId()]
	local petTimeLeft = player:getStorageValue(summonStorage) - player:getLastLogout()

	if petTimeLeft > 0 then
		if vocation and isPremium(player) then
			summonName = vocation.name
		end
	end

	if summonName then
		position = player:getPosition()
		summonMonster = Game.createMonster(summonName, position, true, false)
		player:addSummon(summonMonster)
		summonMonster:setOutfit({lookType = player:getFamiliarLooktype()})
		summonMonster:reload()
		local deltaSpeed = math.max(player:getBaseSpeed() - summonMonster:getBaseSpeed(), 0)
		summonMonster:changeSpeed(deltaSpeed)
		player:setStorageValue(storage, os.time() + petTimeLeft)
		summonMonster:registerEvent("SummonDeath")
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end
summonLogin:register()

local summonThink = CreatureEvent("SummonThink")
function summonThink.onThink(creature, interval, item, position, lastPosition, fromPosition, toPosition)
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
summonThink:register()

local summonDeath = CreatureEvent("SummonDeath")
function summonDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(summon,creature:getName():lower()) then
		player:setStorageValue(summonStorage, os.time())
	end
	return true
end
summonDeath:register()
