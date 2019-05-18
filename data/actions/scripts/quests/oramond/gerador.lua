local function revertGerator1(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23407)
		if thing then
			thing:transform(23402)
		end
	end
end
local function revertGerator2(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23405)
		if thing then
			thing:transform(23400)
		end
	end
end
local function revertGerator3(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(23406)
		if thing then
			thing:transform(23401)
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
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand = math.random(1, 100)
	local player = Player(cid)
	local item1 = 23402
	local item2 = 23400
	local item3 = 23401
	local item4 = 23403
	if item.itemid == item1 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23407)
		addEvent(revertGerator1, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, 20062) <= 0 then
				setPlayerStorageValue(cid, 20062,1)
				setPlayerStorageValue(cid, 20060,1)
			elseif getPlayerStorageValue(cid, 20062) == 1 then
				setPlayerStorageValue(cid, 20062,2)
			elseif getPlayerStorageValue(cid, 20062) == 2 then
				setPlayerStorageValue(cid, 20062,3)
			elseif getPlayerStorageValue(cid, 20062) == 3 then
				setPlayerStorageValue(cid, 20062,4)
			elseif getPlayerStorageValue(cid, 20062) == 4 then
				setPlayerStorageValue(cid, 20062,5)					
			elseif getPlayerStorageValue(cid, 20062) == 5 then
				setPlayerStorageValue(cid, 20062,6)
			elseif getPlayerStorageValue(cid, 20062) == 6 then
				setPlayerStorageValue(cid, 20062,7)
			elseif getPlayerStorageValue(cid, 20062) == 7 then
				setPlayerStorageValue(cid, 20062,8)
			elseif getPlayerStorageValue(cid, 20062) == 8 then
				setPlayerStorageValue(cid, 20062,9)	
			elseif getPlayerStorageValue(cid, 20062) == 9 then
				setPlayerStorageValue(cid, 20062,10)
			elseif getPlayerStorageValue(cid, 20062) == 10 then
				setPlayerStorageValue(cid, 20062,11)	
			elseif getPlayerStorageValue(cid, 20062) == 11 then
				setPlayerStorageValue(cid, 20062,12)	
			elseif getPlayerStorageValue(cid, 20062) == 12 then
				setPlayerStorageValue(cid, 20062,13)	
			elseif getPlayerStorageValue(cid, 20062) == 13 then
				setPlayerStorageValue(cid, 20062,14)	
			elseif getPlayerStorageValue(cid, 20062) == 14 then
				setPlayerStorageValue(cid, 20062,15)	
			elseif getPlayerStorageValue(cid, 20062) == 15 then
				setPlayerStorageValue(cid, 20062,16)	
			elseif getPlayerStorageValue(cid, 20062) == 16 then
				setPlayerStorageValue(cid, 20062,17)	
			elseif getPlayerStorageValue(cid, 20062) == 17 then
				setPlayerStorageValue(cid, 20062,18)	
			elseif getPlayerStorageValue(cid, 20062) == 18 then
				setPlayerStorageValue(cid, 20062,19)	
			elseif getPlayerStorageValue(cid, 20062) == 19 then
				setPlayerStorageValue(cid, 20062,20)					
			end
	end
	if item.itemid == item2 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23405)
		addEvent(revertGerator2, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, 20062) <= 0 then
				setPlayerStorageValue(cid, 20062,1)
				setPlayerStorageValue(cid, 20060,1)
			elseif getPlayerStorageValue(cid, 20062) == 1 then
				setPlayerStorageValue(cid, 20062,2)
			elseif getPlayerStorageValue(cid, 20062) == 2 then
				setPlayerStorageValue(cid, 20062,3)
			elseif getPlayerStorageValue(cid, 20062) == 3 then
				setPlayerStorageValue(cid, 20062,4)
			elseif getPlayerStorageValue(cid, 20062) == 4 then
				setPlayerStorageValue(cid, 20062,5)					
			elseif getPlayerStorageValue(cid, 20062) == 5 then
				setPlayerStorageValue(cid, 20062,6)
			elseif getPlayerStorageValue(cid, 20062) == 6 then
				setPlayerStorageValue(cid, 20062,7)
			elseif getPlayerStorageValue(cid, 20062) == 7 then
				setPlayerStorageValue(cid, 20062,8)
			elseif getPlayerStorageValue(cid, 20062) == 8 then
				setPlayerStorageValue(cid, 20062,9)	
			elseif getPlayerStorageValue(cid, 20062) == 9 then
				setPlayerStorageValue(cid, 20062,10)
			elseif getPlayerStorageValue(cid, 20062) == 10 then
				setPlayerStorageValue(cid, 20062,11)	
			elseif getPlayerStorageValue(cid, 20062) == 11 then
				setPlayerStorageValue(cid, 20062,12)	
			elseif getPlayerStorageValue(cid, 20062) == 12 then
				setPlayerStorageValue(cid, 20062,13)	
			elseif getPlayerStorageValue(cid, 20062) == 13 then
				setPlayerStorageValue(cid, 20062,14)	
			elseif getPlayerStorageValue(cid, 20062) == 14 then
				setPlayerStorageValue(cid, 20062,15)	
			elseif getPlayerStorageValue(cid, 20062) == 15 then
				setPlayerStorageValue(cid, 20062,16)	
			elseif getPlayerStorageValue(cid, 20062) == 16 then
				setPlayerStorageValue(cid, 20062,17)	
			elseif getPlayerStorageValue(cid, 20062) == 17 then
				setPlayerStorageValue(cid, 20062,18)	
			elseif getPlayerStorageValue(cid, 20062) == 18 then
				setPlayerStorageValue(cid, 20062,19)	
			elseif getPlayerStorageValue(cid, 20062) == 19 then
				setPlayerStorageValue(cid, 20062,20)					
			end
	end
	if item.itemid == item3 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23406)
		addEvent(revertGerator3, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, 20062) <= 0 then
				setPlayerStorageValue(cid, 20062,1)
				setPlayerStorageValue(cid, 20060,1)
			elseif getPlayerStorageValue(cid, 20062) == 1 then
				setPlayerStorageValue(cid, 20062,2)
			elseif getPlayerStorageValue(cid, 20062) == 2 then
				setPlayerStorageValue(cid, 20062,3)
			elseif getPlayerStorageValue(cid, 20062) == 3 then
				setPlayerStorageValue(cid, 20062,4)
			elseif getPlayerStorageValue(cid, 20062) == 4 then
				setPlayerStorageValue(cid, 20062,5)					
			elseif getPlayerStorageValue(cid, 20062) == 5 then
				setPlayerStorageValue(cid, 20062,6)
			elseif getPlayerStorageValue(cid, 20062) == 6 then
				setPlayerStorageValue(cid, 20062,7)
			elseif getPlayerStorageValue(cid, 20062) == 7 then
				setPlayerStorageValue(cid, 20062,8)
			elseif getPlayerStorageValue(cid, 20062) == 8 then
				setPlayerStorageValue(cid, 20062,9)	
			elseif getPlayerStorageValue(cid, 20062) == 9 then
				setPlayerStorageValue(cid, 20062,10)
			elseif getPlayerStorageValue(cid, 20062) == 10 then
				setPlayerStorageValue(cid, 20062,11)	
			elseif getPlayerStorageValue(cid, 20062) == 11 then
				setPlayerStorageValue(cid, 20062,12)	
			elseif getPlayerStorageValue(cid, 20062) == 12 then
				setPlayerStorageValue(cid, 20062,13)	
			elseif getPlayerStorageValue(cid, 20062) == 13 then
				setPlayerStorageValue(cid, 20062,14)	
			elseif getPlayerStorageValue(cid, 20062) == 14 then
				setPlayerStorageValue(cid, 20062,15)	
			elseif getPlayerStorageValue(cid, 20062) == 15 then
				setPlayerStorageValue(cid, 20062,16)	
			elseif getPlayerStorageValue(cid, 20062) == 16 then
				setPlayerStorageValue(cid, 20062,17)	
			elseif getPlayerStorageValue(cid, 20062) == 17 then
				setPlayerStorageValue(cid, 20062,18)	
			elseif getPlayerStorageValue(cid, 20062) == 18 then
				setPlayerStorageValue(cid, 20062,19)	
			elseif getPlayerStorageValue(cid, 20062) == 19 then
				setPlayerStorageValue(cid, 20062,20)					
			end		
	end
	if item.itemid == item4 then
		if((rand >= 1) and (rand < 50)) then
			doCreatureSay(cid, "<clong!> <clong!> There This piece fixed.", TALKTYPE_ORANGE_1)
		elseif((rand >= 50) and (rand < 100)) then
			doCreatureSay(cid, "<clong!> <clong!> <scrit scrit scrit>This should do it.", TALKTYPE_ORANGE_1)
		end
		doTransformItem(item.uid,23409)
		addEvent(revertValvula, 60 * 60 * 1000, toPosition)
		doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
			if getPlayerStorageValue(cid, 20062) <= 0 then
				setPlayerStorageValue(cid, 20062,1)
				setPlayerStorageValue(cid, 20060,1)
			elseif getPlayerStorageValue(cid, 20062) == 1 then
				setPlayerStorageValue(cid, 20062,2)
			elseif getPlayerStorageValue(cid, 20062) == 2 then
				setPlayerStorageValue(cid, 20062,3)
			elseif getPlayerStorageValue(cid, 20062) == 3 then
				setPlayerStorageValue(cid, 20062,4)
			elseif getPlayerStorageValue(cid, 20062) == 4 then
				setPlayerStorageValue(cid, 20062,5)					
			elseif getPlayerStorageValue(cid, 20062) == 5 then
				setPlayerStorageValue(cid, 20062,6)
			elseif getPlayerStorageValue(cid, 20062) == 6 then
				setPlayerStorageValue(cid, 20062,7)
			elseif getPlayerStorageValue(cid, 20062) == 7 then
				setPlayerStorageValue(cid, 20062,8)
			elseif getPlayerStorageValue(cid, 20062) == 8 then
				setPlayerStorageValue(cid, 20062,9)	
			elseif getPlayerStorageValue(cid, 20062) == 9 then
				setPlayerStorageValue(cid, 20062,10)
			elseif getPlayerStorageValue(cid, 20062) == 10 then
				setPlayerStorageValue(cid, 20062,11)	
			elseif getPlayerStorageValue(cid, 20062) == 11 then
				setPlayerStorageValue(cid, 20062,12)	
			elseif getPlayerStorageValue(cid, 20062) == 12 then
				setPlayerStorageValue(cid, 20062,13)	
			elseif getPlayerStorageValue(cid, 20062) == 13 then
				setPlayerStorageValue(cid, 20062,14)	
			elseif getPlayerStorageValue(cid, 20062) == 14 then
				setPlayerStorageValue(cid, 20062,15)	
			elseif getPlayerStorageValue(cid, 20062) == 15 then
				setPlayerStorageValue(cid, 20062,16)	
			elseif getPlayerStorageValue(cid, 20062) == 16 then
				setPlayerStorageValue(cid, 20062,17)	
			elseif getPlayerStorageValue(cid, 20062) == 17 then
				setPlayerStorageValue(cid, 20062,18)	
			elseif getPlayerStorageValue(cid, 20062) == 18 then
				setPlayerStorageValue(cid, 20062,19)	
			elseif getPlayerStorageValue(cid, 20062) == 19 then
				setPlayerStorageValue(cid, 20062,20)					
			end		
	end
	return true
end
