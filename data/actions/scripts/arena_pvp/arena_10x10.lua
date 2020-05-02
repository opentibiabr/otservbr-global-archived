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

function onUse(cid, item, fromPosition, itemEx)
		player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
		return true
    end

	local player = Player(cid)
	if not player then
		return true
	end
        if(itemEx.itemid == 24732) then
	        if player:getStorageValue(1) and not isPlayerInArea({x = 32244, y = 32169, z = 9, stackpos = 255}, {x = 32267, y = 32189, z = 9, stackpos = 255}) then
				pos1 = {x = 32242, y = 32175, z = getCreaturePosition(cid).z} -- {x = 32242, y = 32175, z = 8}
				pos2 = {x = 32242, y = 32176, z = getCreaturePosition(cid).z} -- 32242, 32178, 8
				pos3 = {x = 32242, y = 32177, z = getCreaturePosition(cid).z}
				pos4 = {x = 32242, y = 32178, z = getCreaturePosition(cid).z}
				pos5 = {x = 32241, y = 32179, z = getCreaturePosition(cid).z}

				-- team 2

				pos6 = {x = 32242, y = 32180, z = getCreaturePosition(cid).z} -- 32242, 32180, 8
				pos7 = {x = 32242, y = 32181, z = getCreaturePosition(cid).z} -- 32242, 32178, 8
				pos8 = {x = 32242, y = 32182, z = getCreaturePosition(cid).z}
				pos9 = {x = 32242, y = 32183, z = getCreaturePosition(cid).z}
				pos10 = {x = 32242, y = 32184, z = getCreaturePosition(cid).z}



				-- team 1
				if(isPlayer(getTopCreature(pos1).uid)) then
				if(isPlayer(getTopCreature(pos2).uid)) then
				if(isPlayer(getTopCreature(pos3).uid)) then
				if(isPlayer(getTopCreature(pos4).uid)) then
				if(isPlayer(getTopCreature(pos5).uid)) then

				-- team 2

				if(isPlayer(getTopCreature(pos6).uid)) then
				if(isPlayer(getTopCreature(pos7).uid)) then
				if(isPlayer(getTopCreature(pos8).uid)) then
				if(isPlayer(getTopCreature(pos9).uid)) then
				if(isPlayer(getTopCreature(pos10).uid)) then



				-- team 1
					doTeleportThing(getTopCreature(pos1).uid, {x = 32246, y = 32175, z = 9})
					doTeleportThing(getTopCreature(pos2).uid, {x = 32246, y = 32177, z = 9})
					doTeleportThing(getTopCreature(pos3).uid, {x = 32246, y = 32179, z = 9})
					doTeleportThing(getTopCreature(pos4).uid, {x = 32246, y = 32181, z = 9})
					doTeleportThing(getTopCreature(pos5).uid, {x = 32245, y = 32183, z = 9})

		        -- team 2
					doTeleportThing(getTopCreature(pos6).uid, {x = 32264, y = 32174, z = 9})
					doTeleportThing(getTopCreature(pos7).uid, {x = 32264, y = 32176, z = 9})
					doTeleportThing(getTopCreature(pos8).uid, {x = 32264, y = 32178, z = 9})
					doTeleportThing(getTopCreature(pos9).uid, {x = 32264, y = 32180, z = 9})
					doTeleportThing(getTopCreature(pos10).uid, {x = 32264, y = 32182, z = 9})
					doRemoveItem(item.uid, 1)
				end
				end
				end
				end
				end
				end
				end
				end
				else doCreatureSay(cid, "You need 10 players for enter in Arena.", TALKTYPE_ORANGE_1)
				end
				else doCreatureSay(cid, "Please wait for the fighters come out of the arena.", TALKTYPE_ORANGE_1)
			end
		end
	return true
end
