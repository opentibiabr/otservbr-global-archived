function cairNoChao(pid, id)
	local chance = math.random(0, 100)
	local player = Player(pid)
	if not player then
		return true
	end
	local colar = player:getSlotItem(CONST_SLOT_NECKLACE)
	if not colar or colar:getId() ~= id then
		return true
	end
	if chance <= 1 then
		colar:moveTo(player:getPosition())
	end
	addEvent(cairNoChao, 10000, player:getId(), id)
	return true
end

function onEquip(player, item, slot, isCheck)
	if isCheck then
		return true
	end
	if player:getStorageValue(Storage.CultsOfTibia.Misguided.Mission) >= 2 and player:getStorageValue(Storage.CultsOfTibia.Misguided.Mission) <= 3 then
		local equipadoAntes = item:getSpecialAttribute("task") or 0
		if equipadoAntes ~= player:getGuid() and player:getStorageValue(Storage.CultsOfTibia.Misguided.Monsters) < 10 then
			player:setStorageValue(Storage.CultsOfTibia.Misguided.Monsters, 0)
			item:setSpecialAttribute("task", player:getGuid())
		end
		if player:getStorageValue(Storage.CultsOfTibia.Misguided.Mission) == 2 then
			player:setStorageValue(Storage.CultsOfTibia.Misguided.Mission, 3)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The amulet burns your skin. It hungers for energy right now, gather a large amount of energy as fast as possible to charge it. ")
		end
	end
	addEvent(cairNoChao, 10000, player:getId(), item:getId())
	return true
end

function onDeEquip(player, item, slot, isCheck)
	item:setAttribute(ITEM_ATTRIBUTE_DECAYSTATE, 0)
	return true
end
