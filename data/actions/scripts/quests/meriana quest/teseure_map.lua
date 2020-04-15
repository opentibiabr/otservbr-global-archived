function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.actionid == 8050 then 	
		if(item.itemid == 6118) then	
			if(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) >= 27) and player:getStorageValue(Storage.TheShatteredIsles.TreasureMap) < 1 then					
			player:say("You have successfully read plan A", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.TheShatteredIsles.TreasureMap, 1)
		end
	end

	elseif item.actionid == 8051 then
		if(item.itemid == 6118) then	
			if(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) >= 27) and player:getStorageValue(Storage.TheShatteredIsles.TreasureMap1) < 1 then						
			player:say("You have successfully read plan B", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.TheShatteredIsles.TreasureMap1, 1)
		end
	end

	elseif item.actionid == 8052 then 	
		if(item.itemid == 6118) then	
			if(player:getStorageValue(Storage.TheShatteredIsles.MerianaQuest) >= 27) and player:getStorageValue(Storage.TheShatteredIsles.TreasureMap2) < 1 then						
			player:say("You have successfully read plan C", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.TheShatteredIsles.TreasureMap2, 1)
		end
	end
end
	if player:getStorageValue(Storage.TheShatteredIsles.TreasureMap) == 1
	and player:getStorageValue(Storage.TheShatteredIsles.TreasureMap1) == 1
	and player:getStorageValue(Storage.TheShatteredIsles.TreasureMap2) == 1 then
		player:setStorageValue(Storage.TheShatteredIsles.MerianaQuest, 28)
	end
	return true
end