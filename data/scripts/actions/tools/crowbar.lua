local crowbar = Action()

function crowbar.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if not isInArray({3304, 9598}, item.itemid) then
		return false
	end

	local targetActionId, targetUniqueId = target.actionid, target.uid

	-- In Service Of Yalahar Quest
	if targetUniqueId == 3071 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe01) < 1 then
--			doSetMonsterOutfit(player, 'skeleton', 3 * 1000)
			fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position = player:getPosition()
			for x = -1, 1 do
				for y = -1, 1 do
					position = position + Position(x, y, 0)
					position:sendMagicEffect(CONST_ME_YELLOWENERGY)
				end
			end
		end

	elseif targetUniqueId == 3072 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe02) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position = player:getPosition()
			for x = -1, 1 do
				for y = -1, 1 do
					if math.random(2) == 2 then
						position = position + Position(x, y, 0)
						Game.createMonster('rat', position)
						position:sendMagicEffect(CONST_ME_TELEPORT)
					end
				end
			end
		end

	elseif targetUniqueId == 3073 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe03) < 1 then
			player:say('You have used the crowbar on a grate.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end

	elseif targetUniqueId == 3074 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe04) < 1 then
--			doSetMonsterOutfit(player, 'bog raider', 5 * 1000)
			player:say('You have used the crowbar on a knot.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end

	elseif targetActionId == 100 then
		local targetId = target.itemid

		-- Postman Quest
		if targetId == 3501 then
			if player:getStorageValue(Storage.postman.Mission02) == 1 then
				player:setStorageValue(Storage.postman.Mission02, 2)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end

		-- The Ape City - Mission 7
		elseif targetId == 4848 then
			local cStorage = player:getStorageValue(Storage.TheApeCity.Casks)
			if cStorage < 3 then
				player:setStorageValue(Storage.TheApeCity.Casks, math.max(0, cStorage) + 1)
				target:transform(3134)
				toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
				addEvent(revertCask, 3 * 60 * 1000, toPosition)
			end
		end

	-- Secret Service Quest
	elseif targetActionId == 12566 and player:getStorageValue(Storage.secretService.TBIMission06) == 1 then
		local yellPosition = Position(32204, 31157, 8)
		if player:getOutfit().lookType == 137 then -- amazon lookType
			player:setStorageValue(Storage.secretService.TBIMission06, 2)
			Game.createMonster('barbarian skullhunter', yellPosition) -- say
			player:say("Nooooo! What have you done??", TALKTYPE_MONSTER_SAY, false, 0, yellPosition)
			yellPosition.y = yellPosition.y - 1
			Game.createMonster('barbarian skullhunter', yellPosition)
		end
	else
		return false
	end

	return true
end

crowbar:id(2416)
crowbar:register()
