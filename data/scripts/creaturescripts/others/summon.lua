local petLogin = CreatureEvent("PetOnLogin")

function petLogin.onLogin(player)
	local vocationid = player:getVocation():getId()
	local STORAGE_PET = Storage.PetSummon
	local TIME_STORAGE_PET = Storage.PetSummonTime

	if (player:getStorageValue(TIME_STORAGE_PET) > 0) then
		player:setStorageValue(STORAGE_PET, os.time() + player:getStorageValue(TIME_STORAGE_PET))
	end

	if (vocationid == 1 or vocationid == 5) and (player:getStorageValue(STORAGE_PET) > os.time()) then
		pet = "thundergiant"
		position = player:getPosition()
		summonpet = Game.createMonster(pet, position)
		if summonpet then
		local deltaSpeed = math.max(player:getBaseSpeed() - summonpet:getBaseSpeed(), 0)
		summonpet:changeSpeed(deltaSpeed)
		player:addSummon(summonpet)
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif (vocationid == 2 or vocationid == 6) and player:getStorageValue(STORAGE_PET) > os.time() then
		pet = "grovebeast"
		position = player:getPosition()
		summonpet = Game.createMonster(pet, position)
		if summonpet then
		local deltaSpeed = math.max(player:getBaseSpeed() - summonpet:getBaseSpeed(), 0)
		summonpet:changeSpeed(deltaSpeed)
		player:addSummon(summonpet)
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif (vocationid == 3 or vocationid == 7) and player:getStorageValue(STORAGE_PET) > os.time() then
		pet = "emberwing"
		position = player:getPosition()
		summonpet = Game.createMonster(pet, position)
		if summonpet then
		local deltaSpeed = math.max(player:getBaseSpeed() - summonpet:getBaseSpeed(), 0)
		summonpet:changeSpeed(deltaSpeed)
		player:addSummon(summonpet)
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif (vocationid == 4 or vocationid == 8) and player:getStorageValue(STORAGE_PET) > os.time() then
		pet = "skullfrost"
		position = player:getPosition()
		summonpet = Game.createMonster(pet, position)
		if summonpet then
		local deltaSpeed = math.max(player:getBaseSpeed() - summonpet:getBaseSpeed(), 0)
		summonpet:changeSpeed(deltaSpeed)
		player:addSummon(summonpet)
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end

   	return true
end
petLogin:register()

local petThink = CreatureEvent("PetOnThink")

function petThink.onThink(player, interval, item, position, lastPosition, fromPosition, toPosition)
	local STORAGE_PET = Storage.PetSummon
	local TIME_STORAGE_PET = Storage.PetSummonTime
	
    if (player:getStorageValue(STORAGE_PET) < os.time() and player:getStorageValue(STORAGE_PET) > 0) then
        doRemoveCreature (getCreatureSummons(player)[1])
		player:setStorageValue(STORAGE_PET, 0)
		player:setStorageValue(TIME_STORAGE_PET, 0)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Summon removed.")
	end
	local summon=Monster(getCreatureSummons(player)[1])
	
	return true 
end
petThink:register()

local petLogout = CreatureEvent("PetOnLogout")

function petLogout.onLogout(player)
local STORAGE_PET = Storage.PetSummon
local TIME_STORAGE_PET = Storage.PetSummonTime

if (player:getStorageValue(STORAGE_PET) - os.time() > 0) then
	player:setStorageValue(TIME_STORAGE_PET, player:getStorageValue(STORAGE_PET)-os.time())
end

return true
end
petLogout:register()