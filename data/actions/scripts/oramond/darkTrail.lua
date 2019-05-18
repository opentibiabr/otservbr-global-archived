        local room = {     -- room with demons
        fromX = 33478,
        fromY = 32070,
        fromZ = 8,
        --------------
        toX = 33496,
        toY = 32089,
        toZ = 8
        }

        local monster_pos = {
        [1] = {pos = {33486, 32081, 8}, monster = "Greater Canopic Jar"},
        [2] = {pos = {33486, 32083, 8}, monster = "Greater Canopic Jar"},
        [3] = {pos = {33488, 32081, 8}, monster = "Greater Canopic Jar"},
        [4] = {pos = {33488, 32083, 8}, monster = "Greater Canopic Jar"},		
        [5] = {pos = {33487, 32082, 8}, monster = "The Ravager"}
        }

        local players_pos = {
        {x = 33417, y =32102, z = 10, stackpos = 253},
        {x = 33418, y =32102, z = 10, stackpos = 253},
        {x = 33419, y =32102, z = 10, stackpos = 253},
		{x = 33420, y =32102, z = 10, stackpos = 253}
        }

        local new_player_pos = {
        {x = 33486, y =32088, z = 8},
        {x = 33487, y =32088, z = 8},
        {x = 33488, y =32088, z = 8},
        {x = 33489, y =32088, z = 8}
        }

        local playersOnly = "no"
        local questLevel = 100

        ------------------------------------------------------
        --- CONFIG END ---------------------------------------
        ------------------------------------------------------

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local all_ready, monsters, player, level = 0, 0, {}, 0
        if item.itemid == 1945 then
                for i = 1, #players_pos do
                        table.insert(player, 0)
                end
                for i = 1, #players_pos do
                        player[i] = getThingfromPos(players_pos[i])
                        if player[i].itemid > 0 then
                                if string.lower(playersOnly) == "yes" then
                                        if isPlayer(player[i].uid) == TRUE then
                                                all_ready = all_ready+1
                                        else
                                                monsters = monsters+1
                                        end
                                else
                                        all_ready = all_ready+1
                                end
                        end
                end
                if all_ready == #players_pos then
                        for i = 1, #players_pos do
                                player[i] = getThingfromPos(players_pos[i])
                                if isPlayer(player[i].uid) == TRUE then
                                        if getPlayerLevel(player[i].uid) >= questLevel then
                                                level = level+1
                                        end
                                else
                                        level = level+1
                                end
                        end
                        if level == #players_pos then
                                if string.lower(playersOnly) == "yes" and monsters == 0 or string.lower(playersOnly) == "no" then
                                        local door = getTileItemById({x=33225, y=31659, z=13}, 5109).uid
					if door > 0 then
						doTransformItem(door, 5108)
					end

										for _, area in pairs(monster_pos) do
                                                        doSummonCreature(area.monster,{x=area.pos[1],y=area.pos[2],z=area.pos[3]})
                                        end
                                        for i = 1, #players_pos do
                                                doSendMagicEffect(players_pos[i], CONST_ME_POFF)
                                                doTeleportThing(player[i].uid, new_player_pos[i], FALSE)
                                                doSendMagicEffect(new_player_pos[i], CONST_ME_ENERGYAREA)
                                                doTransformItem(item.uid,1946)
                                        end
                                else
                                        doPlayerSendTextMessage(cid,19,"Only players can do this quest.")
                                end
                        else
                                doPlayerSendTextMessage(cid,19,"All Players have to be level "..questLevel.." to do this quest.")
                        end
                else
                        doPlayerSendTextMessage(cid,19,"You need 4 players to do this quest.")
                end
        elseif item.itemid == 1946 then
                local player_room = 0
                for x = room.fromX, room.toX do
                        for y = room.fromY, room.toY do
                                for z = room.fromZ, room.toZ do
                                        local pos = {x=x, y=y, z=z,stackpos = 253}
                                        local thing = getThingfromPos(pos)
                                        if thing.itemid > 0 then
                                                if isPlayer(thing.uid) == TRUE then
                                                        player_room = player_room+1
                                                end
                                        end
                                end
                        end
                end
                if player_room >= 1 then
                        doPlayerSendTextMessage(cid,19,"There is already a team in the quest room.")          
                elseif player_room == 0 then
                        for x = room.fromX, room.toX do
                                for y = room.fromY, room.toY do
                                        for z = room.fromZ, room.toZ do
                                                local pos = {x=x, y=y, z=z,stackpos = 253}
                                                local thing = getThingfromPos(pos)
                                                if thing.itemid > 0 then
                                                        doRemoveCreature(thing.uid)
                                                end
                                        end
                                end
                        end
                        doTransformItem(item.uid,1945)
                end
        end
        return TRUE
end