local function revert(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local function revertAshes()
	local item = Tile(Position(32849, 32233, 9)):getItemById(1387)
	if item then
		item:transform(2249)
		local itemUid = Tile(Position(32849, 32233, 9)):getItemById(2249)
		if itemUid then
			itemUid:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, 2243)
		end
	end
end

local positions = {
	Position(32848, 32230, 9),
	Position(32849, 32230, 9),
	Position(32847, 32231, 9),
	Position(32848, 32231, 9),
	Position(32849, 32231, 9),
	Position(32850, 32231, 9),
	Position(32848, 32232, 9),
	Position(32849, 32232, 9)
}

local othersFireBug = Action()
function othersFireBug.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.actionid == 54387 and target.itemid == 25531 then
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) >= 8 or player:getStorageValue(Storage.FerumbrasAscension.BoneFlute) < 1 then
			return false
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) < 0 then
			player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, 0)
		end
		if player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) == 7 then
			player:say('You ascended the last basin.', TALKTYPE_MONSTER_SAY)
			item:remove()
			player:setStorageValue(Storage.FerumbrasAscension.MonsterDoor, 1)
		end
		target:transform(25532)
		player:setStorageValue(Storage.FerumbrasAscension.BasinCounter, player:getStorageValue(Storage.FerumbrasAscension.BasinCounter) + 1)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		addEvent(revert, 2 * 60 * 1000, toPosition, 25532, 25531)
		return true
	elseif target.uid == 2243 then
		local tile = Tile(Position(32849, 32233, 9))
		local item = tile:getItemById(2249)
		local createTeleport = Game.createItem(1387, 1, Position(32849, 32233, 9))
		for k, v in pairs(positions) do
			v:sendMagicEffect(CONST_ME_YELLOW_RINGS)
		end
		item:remove()
		addEvent(revertAshes, 5 * 60 * 1000) -- 5 minutes
		createTeleport:setDestination(Position(32857, 32234, 11))
		return true
	end

	local random = math.random(10)
	if random >= 4 then --success 6% chance
		if target.itemid == 7538 then --Destroy spider webs/North - South
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7544)
			target:decay()
			return true
		elseif target.itemid == 7539 then --Destroy spider webs/EAST- West
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7545)
			target:decay()
			return true
		elseif target.itemid == 5466 then --Burn Sugar Cane
			toPosition:sendMagicEffect(CONST_ME_FIREAREA)
			target:transform(5465)
			target:decay(5464)
			return true
		elseif target.itemid == 1485 then --Light Up empty coal basins
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(1484)
			return true
		elseif target.actionid == 12550 or target.actionid == 12551 then -- Secret Service Quest
			if player:getStorageValue(Storage.secretService.TBIMission01) == 1 then
				Game.createItem(1487, 1, Position(32893, 32012, 6))
				player:setStorageValue(Storage.secretService.TBIMission01, 2)
			end
		end
		return true
	elseif random == 2 then --it remove the fire bug 2% chance
		item:remove(1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	elseif random == 1 then --it explode on the user 1% chance
		doTargetCombatHealth(0, player, COMBAT_FIREDAMAGE, -5, -5, CONST_ME_HITBYFIRE)
		player:say('OUCH!', TALKTYPE_MONSTER_SAY)
		item:remove(1)
		return true
	else
		toPosition:sendMagicEffect(CONST_ME_POFF) --it fails, but dont get removed 3% chance
		return true
	end
	return false
end

othersFireBug:id(5468)
othersFireBug:register()