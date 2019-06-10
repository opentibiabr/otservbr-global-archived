function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local yielothaxKill = 673004
	local enoughKills = 775559
	local playerStor = killer:getStorageValue(yielothaxKill)
	local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'raging mage' then
		return true
	end

	broadcastMessage("The remains of the Raging Mage are scattered on the floor of his Tower. The dimensional portal quakes.", MESSAGE_EVENT_ADVANCE)
	targetMonster:say("I WILL RETURN!! My death will just be a door to await my homecoming, my physical hull will be... my... argh...", TALKTYPE_MONSTER_SAY, 0, 0, Position(33142, 31529, 2))
	addEvent(function()
		local tilePos = Tile(Position(33143, 31527, 2)):getItemById(11796)
		if not tilePos then
			return true
		end
		tilePos:remove()
		broadcastMessage("With a great bang the dimensional portal in Zao collapsed and with it the connection to the other dimension shattered.", MESSAGE_EVENT_ADVANCE)
	end, 5 * 60 * 1000)
	mostDamageKiller:setStorageValue(yielothaxKill, 0)
	Game.setStorageValue(enoughKills, 0)
	return true
end
