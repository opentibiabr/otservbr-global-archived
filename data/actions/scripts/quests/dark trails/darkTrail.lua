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
		
	        if player:getStorageValue(1) and not isPlayerInArea({x = 33475, y = 32068, z = 8, stackpos = 255}, {x = 33499, y = 32092, z = 8, stackpos = 255}) then
				pos1 = {x = 33417, y = 32102, z = getCreaturePosition(cid).z}
				pos2 = {x = 33418, y = 32102, z = getCreaturePosition(cid).z}
				pos3 = {x = 33419, y = 32102, z = getCreaturePosition(cid).z}
				pos4 = {x = 33420, y = 32102, z = getCreaturePosition(cid).z}
				--pos5 = {x = 33587, y = 31844, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				if(isPlayer(getTopCreature(pos3).uid)) then
				if(isPlayer(getTopCreature(pos4).uid)) then
				--if(isPlayer(getTopCreature(pos5).uid)) then
					doTeleportThing(getTopCreature(pos1).uid, {x = 33486, y =32088, z = 8})
					doTeleportThing(getTopCreature(pos2).uid, {x = 33487, y =32088, z = 8})
					doTeleportThing(getTopCreature(pos3).uid, {x = 33488, y =32088, z = 8})
					doTeleportThing(getTopCreature(pos4).uid, {x = 33489, y =32088, z = 8})
					--doTeleportThing(getTopCreature(pos5).uid, {x = 33489, y = 32121, z = 9})
	       -- doSummonCreature("the ravager", {x=33486, y=32081, z=8})
		--	doSummonCreature("demon", {x=33486, y=32083, z=8})
			--doSummonCreature("demon", {x=33488, y=32081, z=8})
			--doSummonCreature("demon", {x=33488, y=32083, z=8})
		--doRemoveItem(item.uid, 1)
			
		    end
	       end
	  end
     end
	 else doPlayerSendTextMessage(cid,19,"There are players inside the room or is missing players here.")
end

end
	return true
end