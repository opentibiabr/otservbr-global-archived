local function isPlayerInArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                    if (isPlayer(creature.uid)) then
                    return true
                end
            end
        end
    end
    return false
end



function onUse(cid, item, fromPosition, itemEx) -- {x = 33477, y = 32102, z = 9}   {x = 33500, y = 32124, z = 9}
	local player = Player(cid)
	if not player then
	
		return true
	end
        if item.itemid == 1945 then
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33477, y = 32102, z = 9, stackpos = 255}, {x = 33500, y = 32124, z = 9, stackpos = 255}) then
				pos1 = {x = 33583, y = 31844, z = getCreaturePosition(cid).z}
				pos2 = {x = 33584, y = 31844, z = getCreaturePosition(cid).z}
				pos3 = {x = 33585, y = 31844, z = getCreaturePosition(cid).z}
				pos4 = {x = 33586, y = 31844, z = getCreaturePosition(cid).z}
				pos5 = {x = 33587, y = 31844, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				if(isPlayer(getTopCreature(pos3).uid)) then
				if(isPlayer(getTopCreature(pos4).uid)) then
				if(isPlayer(getTopCreature(pos5).uid)) then
					doTeleportThing(getTopCreature(pos1).uid, {x = 33485, y = 32121, z = 9})
					doTeleportThing(getTopCreature(pos2).uid, {x = 33486, y = 32121, z = 9})
					doTeleportThing(getTopCreature(pos3).uid, {x = 33487, y = 32121, z = 9})
					doTeleportThing(getTopCreature(pos4).uid, {x = 33488, y = 32121, z = 9})
					doTeleportThing(getTopCreature(pos5).uid, {x = 33489, y = 32121, z = 9})
	       -- doSummonCreature("death priest shargon", {x=33490, y=32108, z=9})
		--	doSummonCreature("greater death minion", {x=33481, y=32112, z=9})
			--doSummonCreature("greater death minion", {x=33482, y=32112, z=9})
		--	doSummonCreature("greater death minion", {x=33481, y=32113, z=9})
						
		--doRemoveItem(item.uid, 1)
			end
		    end
	       end
	  end
     end
	else doPlayerSendTextMessage(cid,19,"There are players inside the room or is missing players here.") 
end

end
	return true
end