local familiar = {
	[VOCATION.CLIENT_ID.SORCERER] = {id = 994, name = "Sorcerer familiar"},
	[VOCATION.CLIENT_ID.DRUID] = {id = 993, name = "Druid familiar"},
	[VOCATION.CLIENT_ID.PALADIN] = {id = 992, name = "Paladin familiar"},
	[VOCATION.CLIENT_ID.KNIGHT] = {id = 991, name = "Knight familiar"}
}

local familiarStorage = Storage.PetSummon

local familiarLogin = CreatureEvent("FamiliarLogin")

function familiarLogin.onLogin(player)
	local vocation = familiar[player:getVocation():getClientId()]
	local familiarName
	local petTimeLeft = player:getStorageValue(familiarStorage) - player:getLastLogout()

	if vocation then
		if (not isPremium(player) and player:hasFamiliar(vocation.id)) or player:getLevel() < 200 then
				player:removeFamiliar(vocation.id)
		elseif isPremium(player) and player:getLevel() >= 200 then
			if petTimeLeft > 0 then
				familiarName = vocation.name
			end
			if player:getFamiliarLooktype() == 0 then
				player:setFamiliarLooktype(vocation.id)
			end
			if not player:hasFamiliar(vocation.id) then
				player:addFamiliar(vocation.id)
			end
		end
	end

	if familiarName then
		position = player:getPosition()
		local familiar = Game.createMonster(familiarName, position, true, false)
		player:addSummon(familiar)
		familiar:setOutfit({lookType = player:getFamiliarLooktype()})
		familiar:reload()
		local deltaSpeed = math.max(player:getBaseSpeed() - familiar:getBaseSpeed(), 0)
		familiar:changeSpeed(deltaSpeed)
		player:setStorageValue(familiarStorage, os.time() + petTimeLeft)
		familiar:registerEvent("FamiliarDeath")
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	
	return true
end

familiarLogin:register()

local advanceFamiliar = CreatureEvent("AdvanceFamiliar")

function advanceFamiliar.onAdvance(player, skill, oldLevel, newLevel)
	local vocation = familiar[player:getVocation():getClientId()]
	if newLevel >= 200 and isPremium(player) then
		if player:getFamiliarLooktype() == 0 then
				player:setFamiliarLooktype(vocation.id)
		end
		if not player:hasFamiliar(vocation.id) then
			player:addFamiliar(vocation.id)
		end
	end
	return true
end

advanceFamiliar:register()

local familiarThink = CreatureEvent("FamiliarThink")

function familiarThink.onThink(creature, interval, item, position, lastPosition, fromPosition, toPosition)
	local player = creature:getMaster()
	if not player then
		return true
	end

	if player and player:getStorageValue(familiarStorage) <= os.time() and player:getStorageValue(familiarStorage) > 0 then
		doRemoveCreature(getCreatureSummons(player)[1])
		player:setStorageValue(familiarStorage,0)
	end
	return true
end
familiarThink:register()

local familiarDeath = CreatureEvent("FamiliarDeath")

function familiarDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(familiar,creature:getName():lower()) then
		player:setStorageValue(familiarStorage, os.time())
	end
	return true
end

familiarDeath:register()
