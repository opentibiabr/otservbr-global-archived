function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 7492 then
		return false
	end

	if player:getStorageValue(Storage.WhatAFoolishQuest.Contract) ~= 1 then
		return false
	end

	player:say('You sign the contract', TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	item:remove()
	target:transform(7491)
	return true
end
