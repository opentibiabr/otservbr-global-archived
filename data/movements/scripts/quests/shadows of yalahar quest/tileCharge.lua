function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.ShadownofYalahar.Questline) == 14 then		
		player:say("You have gained a charge!", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 15)
		player:getPosition():sendMagicEffect(CONST_ME_PURPLEENERGY)
	end
	return true
end
