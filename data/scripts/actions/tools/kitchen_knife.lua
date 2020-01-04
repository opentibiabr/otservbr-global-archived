local kitchen = Action()

function kitchen.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local config = {
		targetId = target.itemid,
		fruits = {3584,3585,3586,3587,3588,3589,3590,3591,3592,3593,3594,3591,5096,8011,8012,8013}
	}

	if not isInArray({3469, 9594, 9598}, item.itemid) then
		return false
	end

	-- Rottin Wood Quest
	if config.targetId == 4173 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(cid, Storage.RottinWoodQuest.Mission03) >= 0  then
				player:addItem(12172, 1)
				target:transform(4302)
				player:setStorageValue(Storage.TheIceIslands.FrostbiteHerb, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:say('You cut a Rabbits Foot from a rabbit.', TALKTYPE_MONSTER_SAY)

			end
		end
	end
		
	--The Ice Islands Quest
	if config.targetId == 7261 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FrostbiteHerb) < 1 then
				player:addItem(7248, 1)
				player:setStorageValue(Storage.TheIceIslands.FrostbiteHerb, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:say('You cut a leaf from a frostbite herb.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif config.targetId == 3647 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerCactus) < 1 then
				player:addItem(7245, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerCactus, 1)
				target:transform(3637)
				addEvent(revertItem, 60 * 1000, toPosition, 3637, 3647)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a cactus.', TALKTYPE_MONSTER_SAY)
			end
		end

	elseif config.targetId == 3753 then
		if player:getStorageValue(Storage.TheIceIslands.Questline) >= 21 then
			if player:getStorageValue(Storage.TheIceIslands.FlowerBush) < 1 then
				player:addItem(7249, 1)
				player:setStorageValue(Storage.TheIceIslands.FlowerBush, 1)
				target:transform(3750)
				addEvent(revertItem, 60 * 1000, toPosition, 3750, 3753)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say('You cut a flower from a bush.', TALKTYPE_MONSTER_SAY)
			end
		end

	-- What a foolish Quest (Mission 1)
	elseif target.actionid == 4200 then
		if toPosition.x == 32349 and toPosition.y == 32361 and toPosition.z == 7 then
			player:addItem(102, 1)
			player:say('The stubborn flower has ruined your knife but at least you got it.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
			item:remove(1)
		else
			player:say('This flower is too pathetic.', TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

	-- What a foolish Quest (Mission 5)
	elseif config.targetId == 114 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave) == 1 then
			player:say('God shave the emperor. Some fool already did it.', TALKTYPE_MONSTER_SAY)
			return true
		end

		player:setStorageValue(Storage.WhatAFoolishQuest.EmperorBeardShave, 1)
		player:say('This is probably the most foolish thing you\'ve ever done!', TALKTYPE_MONSTER_SAY)
		player:addItem(113, 1)
		Game.createMonster('dwarf guard', Position(32656, 31853, 13))

	-- What a foolish Quest (Mission 8)
	elseif config.targetId == 3744 then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) ~= 22 or player:getStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves) == 1 then
			return false
		end
		player:setStorageValue(Storage.WhatAFoolishQuest.SpecialLeaves, 1)
		player:addItem(3129, 1)
		toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
	elseif isInArray(config.fruits, config.targetId) and player:removeItem(6277, 1) then
		target:remove(1)
		player:addItem(6278, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	else
		return false
	end

	return true
end

kitchen:id(3469)
kitchen:register()