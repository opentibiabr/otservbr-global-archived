function onUse(player, item, fromPosition, target, toPosition, isHotkey)
        if item.itemid == 1945 then	
		if (player:getStorageValue(Storage.ShadownofYalahar.Questline) == 42) then
			telas = doSummonCreature("Telas Golem", {x = 33267, y = 31788, z = 11})

			doSendMagicEffect({x = 33268, y = 31789, z = 11},48)
			doSendMagicEffect({x = 33268, y = 31788, z = 11},48)
			doSendMagicEffect({x = 33268, y = 31787, z = 11},48)
			doSendMagicEffect({x = 33268, y = 31786, z = 11},48)
		
			doSendMagicEffect({x = 33269, y = 31786, z = 11},48)
			doSendMagicEffect({x = 33269, y = 31787, z = 11},48)
			doSendMagicEffect({x = 33269, y = 31788, z = 11},48)
			doSendMagicEffect({x = 33269, y = 31789, z = 11},48)

			player:setStorageValue(Storage.ShadownofYalahar.Questline, 43)
			setPlayerStorageValue(cid, 82972, 3) -- quest log
		 	doTransformItem(item.uid,item.itemid+1)

	     		addEvent(doRemoveCreature, 1*60*1000, telas)

	end


        elseif item.itemid == 1946 then
                doTransformItem(item.uid,item.itemid-1)
        end
        return TRUE
end 