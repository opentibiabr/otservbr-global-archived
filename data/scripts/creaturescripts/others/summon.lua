local summon = {
<<<<<<< Updated upstream
    [VOCATION.CLIENT_ID.SORCERER] = {name = "Sorcerer familiar"},
    [VOCATION.CLIENT_ID.DRUID] = {name = "Druid familiar"},
    [VOCATION.CLIENT_ID.PALADIN] = {name = "Paladin familiar"},
    [VOCATION.CLIENT_ID.KNIGHT] = {name = "Knight familiar"}
=======
    [VOCATION.CLIENT_ID.SORCERER] = {name = "Sorcerer Familiar"},
    [VOCATION.CLIENT_ID.DRUID] = {name = "Druid Familiar"},
    [VOCATION.CLIENT_ID.PALADIN] = {name = "Paladin Familiar"},
    [VOCATION.CLIENT_ID.KNIGHT] = {name = "Knight Familiar"}
>>>>>>> Stashed changes
}

local storage = Storage.FamiliarSummon

local summonLogin = CreatureEvent("SummonLogin")
function summonLogin.onLogin(player)
	local vocation = summon[player:getVocation()]
	local summonName
	local summonTimeLeft = player:getStorageValue(storage) - player:getLastLogout()

	if summonTimeLeft > 0 then
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
		player:setStorageValue(storage, os.time() + summonTimeLeft)
		summonMonster:registerEvent("SummonDeath")
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end
summonLogin:register()

local summonDeath = CreatureEvent("SummonDeath")
function summonDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(summon.name ,creature:getName():lower()) then
		player:setStorageValue(storage, os.time())
	end
	return true
end
summonDeath:register()
