function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.ShadownofYalahar.Questline) == 36 then		
		player:say("You are showered by strange energy!", TALKTYPE_MONSTER_SAY)
			doSendMagicEffect({x = 32879, y = 31290, z = 11}, 48)
			doSendMagicEffect({x = 32879, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32880, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32881, y = 31291, z = 11}, 48)
			doSendMagicEffect({x = 32881, y = 31290, z = 11}, 48)
			doSendMagicEffect({x = 32880, y = 31290, z = 11}, 48)
		player:setStorageValue(Storage.ShadownofYalahar.Questline, 37)
	end
	return true
end
