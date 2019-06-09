--By Igor Labanca
--Fixes by Leu (jlcvp)

local petNames = {
	[1] = 'thundergiant',
	[2] = 'grovebeast',
	[3] = 'emberwing',
	[4] = 'skullfrost'
}

local STORAGE_PET = Storage.PetSummon

function onLogin(cid)
	local player = Player(cid)

	local vocationid = player:getVocation():getId()
	local pet
	local petTimeLeft = player:getStorageValue(STORAGE_PET) - player:getLastLogout()

	if petTimeLeft > 0 then
		if vocationid == 5 then
			pet = "thundergiant"
		elseif vocationid == 6 then
			pet = "grovebeast"
		elseif vocationid == 7 then
			pet = "emberwing"
		elseif vocationid == 8 then
			pet = "skullfrost"
		end
	end

	if pet then
		position = player:getPosition()
		summonpet = Game.createMonster(pet, position)
		player:addSummon(summonpet)
		player:setStorageValue(STORAGE_PET, os.time() + petTimeLeft)
		summonpet:registerEvent('petdeath')
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end


function onThink(cid, interval, item, position, lastPosition, fromPosition, toPosition)
	local player = Player(cid)

	if player and player:getStorageValue(STORAGE_PET) <= os.time() and player:getStorageValue(STORAGE_PET) > 0 then
		doRemoveCreature (getCreatureSummons(cid)[1])
		player:setStorageValue(STORAGE_PET,0)
	end
	return true
end

function onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local player = creature:getMaster()
	if not player then
		return false
	end

	if table.contains(petNames,creature:getName():lower()) then
		player:setStorageValue(STORAGE_PET, os.time()) --imeddiately expire creature

		-- maybe we need to remove creature from the game manually?
		-- doRemoveCreature (getCreatureSummons(player)[1])
	end

	return true
end
