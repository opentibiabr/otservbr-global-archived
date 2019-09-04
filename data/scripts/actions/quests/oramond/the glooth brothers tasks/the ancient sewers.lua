local function revertGerator(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23405)
		if thing then
			thing:transform(23400)
		end
	end
end
local function revertGerator1(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23406)
		if thing then
			thing:transform(23401)
		end
	end
end
local function revertGerator2(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23407)
		if thing then
			thing:transform(23402)
		end
	end
end
local function revertValvula(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23409)
		if thing then
			thing:transform(23403)
		end
	end
end

local ancient_sewers = Action()

function ancient_sewers.onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand = math.random(1, 100)
	local player = Player(cid)
	local item = 23400
	local item1 = 23401
	local item2 = 23402
	local item3 = 23403
	if item.itemid == item then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23405)
		addEvent(revertGerator, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) <= 0 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,1)
				setPlayerStorageValue(cid, Storage.Oramond.MissionToTakeRoots1)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 1 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,2)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 2 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,3)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 3 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,4)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 4 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,5)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 5 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,6)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 6 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,7)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 7 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,8)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 8 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,9)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 9 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,10)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 10 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,11)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 11 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,12)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 12 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,13)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 13 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,14)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 14 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,15)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 15 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,16)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 16 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,17)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 17 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,18)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 18 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,19)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 19 then
				setPlayerStorageValue(cid, Storage.DarkTrails.Mission03,1)
			end
	end
	if item.itemid == item1 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23406)
		addEvent(revertGerator1, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) <= 0 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,1)
				setPlayerStorageValue(cid, Storage.Oramond.MissionToTakeRoots1)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 1 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,2)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 2 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,3)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 3 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,4)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 4 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,5)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 5 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,6)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 6 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,7)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 7 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,8)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 8 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,9)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 9 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,10)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 10 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,11)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 11 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,12)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 12 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,13)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 13 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,14)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 14 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,15)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 15 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,16)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 16 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,17)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 17 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,18)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 18 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,19)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 19 then
				setPlayerStorageValue(cid, Storage.DarkTrails.Mission03,1)
			end
	end
	if item.itemid == item2 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23407)
		addEvent(revertGerator2, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) <= 0 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,1)
				setPlayerStorageValue(cid, Storage.Oramond.MissionToTakeRoots1)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 1 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,2)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 2 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,3)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 3 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,4)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 4 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,5)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 5 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,6)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 6 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,7)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 7 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,8)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 8 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,9)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 9 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,10)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 10 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,11)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 11 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,12)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 12 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,13)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 13 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,14)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 14 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,15)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 15 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,16)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 16 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,17)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 17 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,18)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 18 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,19)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 19 then
				setPlayerStorageValue(cid, Storage.DarkTrails.Mission03,1)
			end
	end
	if item.itemid == item3 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23409)
		addEvent(revertValvula, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) <= 0 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,1)
				setPlayerStorageValue(cid, Storage.Oramond.MissionToTakeRoots1)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 1 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,2)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 2 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,3)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 3 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,4)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 4 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,5)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 5 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,6)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 6 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,7)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 7 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,8)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 8 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,9)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 9 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,10)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 10 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,11)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 11 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,12)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 12 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,13)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 13 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,14)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 14 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,15)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 15 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,16)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 16 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,17)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 17 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,18)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 18 then
				setPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer,19)
			elseif getPlayerStorageValue(cid, Storage.Oramond.MissionAbandonedSewer) == 19 then
				setPlayerStorageValue(cid, Storage.DarkTrails.Mission03,1)
			end
	end
	return true
end

ancient_sewers:id(23400,23401,23402,23403)
ancient_sewers:register()
