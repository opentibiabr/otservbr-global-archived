local familiar = {
	[VOCATION.CLIENT_ID.SORCERER] = {id = 994, name = "Sorcerer familiar"},
	[VOCATION.CLIENT_ID.DRUID] = {id = 993, name = "Druid familiar"},
	[VOCATION.CLIENT_ID.PALADIN] = {id = 992, name = "Paladin familiar"},
	[VOCATION.CLIENT_ID.KNIGHT] = {id = 991, name = "Knight familiar"}
}

local timer = {
	[1] = {countdown=10, message = "10 seconds"},
	[2] = {countdown=60, message = "one minute"}
}

local function sendMessageFunction(pid, message)
	if Player(pid) then
		Player(pid):sendTextMessage(MESSAGE_LOOT, "Your summon will disappear in less than " .. message)
	end
end

function removePet(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return true
    end
    creature:remove()
end

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
		local familiarMonster = Game.createMonster(familiarName, position, true, false)
		player:addSummon(familiarMonster)
		familiarMonster:setOutfit({lookType = player:getFamiliarLooktype()})
		familiarMonster:reload()
		local deltaSpeed = math.max(player:getSpeed() - familiarMonster:getSpeed(), 0)
		familiarMonster:changeSpeed(deltaSpeed)
		player:setStorageValue(familiarStorage, os.time() + petTimeLeft)
		familiarMonster:registerEvent("FamiliarDeath")
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		addEvent(removePet, petTimeLeft*1000, familiarMonster:getId())
		for sendMessage = 1, #timer do
			storage = 'Storage.PetSummonEvent'..timer[sendMessage].countdown
			setPlayerStorageValue(player, storage, addEvent(sendMessageFunction, (petTimeLeft-timer[sendMessage].countdown)*1000, player:getId(),timer[sendMessage].message))
		end
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

local familiarDeath = CreatureEvent("FamiliarDeath")

function familiarDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified,
																								mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end
	local vocation = familiar[player:getVocation():getClientId()]

	if table.contains(vocation, creature:getName()) then
		player:setStorageValue(familiarStorage, os.time())
		for sendMessage = 1, #timer do
			storage = 'Storage.PetSummonEvent'..timer[sendMessage].countdown
			stopEvent(getPlayerStorageValue(player, storage))
		end
	end
	return true
end

familiarDeath:register()
