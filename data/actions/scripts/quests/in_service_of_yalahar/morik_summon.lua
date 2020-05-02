function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(item.uid == 9031) then
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) == 31 and player:getStorageValue(Storage.InServiceofYalahar.MorikSummon) < 1) then
			local ret = Game.createMonster("Morik the Gladiator", fromPosition)
			ret:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(Storage.InServiceofYalahar.MorikSummon, 1)
		end
	end
return true
end
