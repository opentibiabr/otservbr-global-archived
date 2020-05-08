local petNames = {
	[1] = 'thundergiant',
	[2] = 'grovebeast',
	[3] = 'emberwing',
	[4] = 'skullfrost'
}

local storage = Storage.PetSummon

function onLogin(player)
	local vocationid = player:getVocation():getId()
	local pet
	local petTimeLeft = player:getStorageValue(storage) - player:getLastLogout()

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
		summonpet = Game.createMonster(pet, position, true, false, player)
		player:addSummon(summonpet)
		player:setStorageValue(storage, os.time() + petTimeLeft)
		summonpet:registerEvent('petdeath')
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
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

	if table.contains(petNames,creature:getName():lower()) then
		player:setStorageValue(storage, os.time()) --Imeddiately expire creature
	end
	return true
end
