local spoon = Action()

function spoon.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local targetId = target.itemid

	--The Ice Islands Quest
	if targetId == 390 then
				player:addItem(7247, 1) -- fine sulphur
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive a fine sulphur from a lava hole.', TALKTYPE_MONSTER_SAY)

	elseif targetId == 3920 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.SporesMushroom) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(Storage.TheIceIslands.SporesMushroom, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say('You retrive spores from a mushroom.', TALKTYPE_MONSTER_SAY)
			end
		end

	-- What a foolish Quest - Mission 8 (Sulphur)
	elseif targetId == 7743 or targetId == 390 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 21
				or player:getStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur) == 1 then
			return false
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.InflammableSulphur, 1)
		player:addItem(124, 1) -- easily inflammable sulphur
		toPosition:sendMagicEffect(CONST_ME_YELLOW_RINGS)
	else
		return false
	end
	return true
end

spoon:id(3468)
spoon:register()