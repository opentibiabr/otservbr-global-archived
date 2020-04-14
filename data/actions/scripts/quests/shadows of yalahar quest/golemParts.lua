function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		if(item.itemid == 10153) then
			if(target.itemid == 9801) then
					if(player:getStorageValue(Storage.ShadownofYalahar.Questline) == 12) then
					if player:getStorageValue(Storage.ShadownofYalahar.GolemParts) <= os.time() then
					golem = math.random(1,4)

					if golem == 1 then
					player:sendTextMessage(TALKTYPE_ORANGE_1, 'You ruined the golem remains!')
					player:setStorageValue(Storage.ShadownofYalahar.GolemParts, os.time()+10)
					toPosition:sendMagicEffect(CONST_ME_ENERGYHIT)

					elseif golem == 2 then
					doSummonCreature("Rat", toPosition)
					player:sendTextMessage(TALKTYPE_ORANGE_1, 'Something was stuck in the golem!')
					player:setStorageValue(Storage.ShadownofYalahar.GolemParts, os.time()+10)

					elseif golem == 3 then
					player:addItem(10151, 1)
					player:sendTextMessage(TALKTYPE_ORANGE_1, 'You have salvaged a golem part!')
					player:setStorageValue(Storage.ShadownofYalahar.GolemParts, os.time()+10)
			
					elseif golem == 4 then
					player:addItem(8309, 1)
					player:sendTextMessage(TALKTYPE_ORANGE_1, 'You salvaged some scrap metal!')
					player:setStorageValue(Storage.ShadownofYalahar.GolemParts, os.time()+10)

					end
				end
			end
		end
	end
return true
end