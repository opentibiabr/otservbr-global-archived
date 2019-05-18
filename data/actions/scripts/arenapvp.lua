dofile('data/lib/arenapvp.lua')

function onUse(cid, item, toPosition, itemEx, fromPosition)

	local player1 = getTopCreature(arena.player1pos).uid
	local player2 = getTopCreature(arena.player2pos).uid

	if item.itemid == 1945 then
		doTransformItem(item.uid, item.itemid+1)
		if getGlobalStorageValue(arena.gstorage) < 1 then
			if isPlayer(player1) and isPlayer(player2) then
				doPlayerSendTextMessage(player1, MESSAGE_STATUS_WARNING, "Fight!")
       			doPlayerSendTextMessage(player2, MESSAGE_STATUS_WARNING, "Fight!")
       			doSendMagicEffect(getThingPos(player1), CONST_ME_POFF)
       			doSendMagicEffect(getThingPos(player2), CONST_ME_POFF)
       			setPlayerStorageValue(player1, arena.pstorage, 1)
				setPlayerStorageValue(player2, arena.pstorage, 1)
				doTeleportThing(player1, arena.nplayer1pos)
				doTeleportThing(player2, arena.nplayer2pos)
				setGlobalStorageValue(arena.gstorage, 1)
				addEvent(function ()
					if getQuantidadeCreature(arena.toPos, arena.fromPos) > 0 then
						doRemoveCreature(arena.toPos, arena.fromPos, arena.exitPos, arena.pstorage)
						setGlobalStorageValue(arena.gstorage, -1)
					end
				end, 1000*60*arena.time)
			else
				doCreatureSay(cid, "need two players to start", TALKTYPE_ORANGE_1)
			end
		else
			doCreatureSay(cid, "has two players in arena", TALKTYPE_ORANGE_1)
		end
	elseif item.itemid == 1946 then
		doTransformItem(item.uid, item.itemid-1)
	end

	return true
end