local pick = Action()

function pick.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local config = {
	targetId = target.itemid,
	targetActionId = actionid,
	stonePos = Position(32648, 32134, 10),
	wild_growth = { 1499, 11099, 2101, 1775, 1447, 1446},

}

	if (toPosition == config.stonePos) then
		local tile = Tile(config.stonePos)
		local stone = tile:getItemById(1772)
		if (stone) then
			stone:remove(1)
			toPosition:sendMagicEffect(CONST_ME_POFF)
			addEvent(function() Game.createItem(1772, 1, config.stonePos) end, 20000)
			return true
		end
	end
	
	if isInArray({354, 355}, config.targetId) and (target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) then
		target:transform(394)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

		elseif config.targetId == 21388 then
		target:remove()
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(21389, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You picked a beautiful lion's mane flower.")

		-- Shiny Stone Refining
		elseif target.itemid == 10310 then
		local chance = math.random(1,100)

	if chance == 1 then
			player:addItem(3043, 1) -- 1% chance of getting crystal coin
		elseif chance <= 6 then
			player:addItem(3031, 1) -- 5% chance of getting gold coin
		elseif chance <= 51 then
			player:addItem(3035, 1) -- 45% chance of getting platinum coin
		else
			player:addItem(3028, 1) -- 49% chance of getting small diamond
	end
		target:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
		target:remove(1)
		return true
		elseif config.targetId == 10310 then
		target:remove(1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:addItem(2152, 10)
		return true
		elseif config.targetId == 6298 then
		target:transform(615)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
		return true
		elseif config.targetId == 7200 then
		target:transform(7236)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_HITAREA)
		return true
		
	-- Sea of Light
	elseif config.targetId == 7806 then
		if target.actionid == 4224 then
			if math.random(100) <= 30 then
				if player:getStorageValue(Storage.SeaOfLightQuest.Questline) == 4 and player:getStorageValue(target.actionid) ~= 1 then
					player:addItem(9697, 1)
					player:setStorageValue(target.actionid, 1)
					player:setStorageValue(Storage.SeaOfLightQuest.Questline, 5)
					player:say("*crush*", TALKTYPE_MONSTER_SAY)
				end
			else
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
	end

		-- Grimvalle Quest
		elseif config.targetId == 22075 then
		if player:getExhaustion(Storage.Grimvale.SilverVein) <= 0 then
			local chance = math.random(1, 10)
			if chance >= 5 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Even after a thorough and frustrating search you could not find enough liquified silver in this vein to fill a flask.')
			elseif chance <= 4 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Carefully you gather some of the liquified silver from this vein in a small flask. You now feel strangely affected to the moon.')
				player:addItem(22058)
				target:transform(4464)
				addEvent(revertItem, 10 * 60 * 1000, toPosition, 4464, 22075)
			end
			player:setExhaustion(Storage.Grimvale.SilverVein, 30)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are still exhausted from earlier attempts. Getting liquid silver out of the mountain needs concentration and a steady hand.')
		end
		return true

		--The Ice Islands Quest, Nibelor 1: Breaking the Ice
		elseif config.targetId == 1865 and config.targetActionId == 12026 then
		local missionProgress, pickAmount = player:getStorageValue(Storage.TheIceIslands.Mission02), player:getStorageValue(Storage.TheIceIslands.PickAmount)
		if missionProgress < 1 or pickAmount >= 3 or player:getStorageValue(Storage.TheIceIslands.Questline) ~= 3 then
			return false
		end

		player:setStorageValue(Storage.TheIceIslands.PickAmount, math.max(0, pickAmount) + 1)
		player:setStorageValue(Storage.TheIceIslands.Mission02, missionProgress + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice

		if pickAmount >= 2 then
			player:setStorageValue(Storage.TheIceIslands.Questline, 4)
			player:setStorageValue(Storage.TheIceIslands.Mission02, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
		end

		local crackItem = Tile(toPosition):getItemById(7185)
		if crackItem then
			crackItem:transform(7186)
			addEvent(revertItem, 60 * 1000, toPosition, 7186, 7185)
		end

		local chakoyas = {"chakoya toolshaper", "chakoya tribewarden", "chakoya windcaller"}
		Game.createMonster(chakoyas[math.random(#chakoyas)], toPosition)
		toPosition:sendMagicEffect(CONST_ME_TELEPORT)

		elseif config.targetId == 1791 then
		--The Pits of Inferno Quest
		if target.uid == 1022 then
			for i = 1, #lava do
				Game.createItem(5815, 1, lava[i])
			end
			target:transform(3141)
			toPosition:sendMagicEffect(CONST_ME_SMOKE)

		-- Naginata Quest
		elseif config.targetActionId == 50058 then
			local stoneStorage = Game.getStorageValue(GlobalStorage.NaginataStone)
			if stoneStorage ~= 5 then
				Game.setStorageValue(GlobalStorage.NaginataStone, math.max(0, stoneStorage) + 1)
			elseif stoneStorage == 5 then
				target:remove(1)
				Game.setStorageValue(GlobalStorage.NaginataStone)
			end

			toPosition:sendMagicEffect(CONST_ME_POFF)
			doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -31, -39, CONST_ME_NONE)
		end

	 --The Banshee Quest
		elseif config.targetId == 355 and config.targetActionId == 101 then
		target:transform(394)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)

		-- The Hidden City of Beregar Quest
		elseif config.targetActionId == 50090 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.WayToBeregar) == 1 then
			player:teleportTo(Position(32566, 31338, 10))
		end

		elseif config.targetActionId == 50114 then
		if Tile(Position(32617, 31513, 9)):getItemById(1272) and Tile(Position(32617, 31514, 9)):getItemById(1624) then
			local rubbleItem = Tile(Position(32619, 31514, 9)):getItemById(5709)
			if rubbleItem then
				rubbleItem:remove(1)
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't remove this pile since it's currently holding up the tunnel.")
		end

		-- Pythius The Rotten (Firewalker Boots)
		elseif config.targetActionId == 50127 then
		if player:getStorageValue(Storage.QuestChests.FirewalkerBoots) == 1 then
			return false
		end

		target:remove(1)

		local stoneItem = Tile(toPosition):getItemById(1791)
		if stoneItem then
			stoneItem:remove(1)
		end

		iterateArea(
			function(position)
				local groundItem = Tile(position):getGround()
				if groundItem and groundItem.itemid == 21477 then
					groundItem:transform(5815)
				end
			end,
			Position(32550, 31373, 15),
			Position(32551, 31379, 15)
		)
		iterateArea(
			function(position)
				position:sendMagicEffect(CONST_ME_POFF)
			end,
			Position(32551, 31374, 15),
			Position(32551, 31379, 15)
		)

		local portal = Game.createItem(1949, 1, Position(32551, 31376, 15))
		if portal then
			portal:setActionId(50126)
		end


		-- The Asure
        elseif config.targetActionId == 50091 then
            player:teleportTo(Position(32960, 32676, 4))

		-- Wrath of the emperor quest
		elseif config.targetId == 11340 then
		player:addItem(11339, 1)
		player:say("The cracked part of the table lets you cut out a large chunk of wood with your pick.", TALKTYPE_MONSTER_SAY)

		elseif config.targetId == 11315 then
		target:transform(394)
		target:decay()
		else
		return false
	end
-- Lower Roshamuul
if (target ~= nil) and target:isItem() and (target:getId() == 20135) then
    if math.random(100) > 50 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Crushing the stone produces some fine gravel.")
        target:transform(20133)
        target:decay()
    else
        Game.createMonster("Frazzlemaw", toPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Crushing the stone yields nothing but slightly finer, yet still unusable rubber.")
        target:transform(20134)
        target:decay()
    end
    	return true
    end
end

pick:id(4872)
pick:register()
