local t = {
	[8201] = {{x=28224, y=14445, z=1}, {x=28224, y=14445, z=4}, effect = true}, --last, to flying carpet
	[8202] = {{x=28224, y=14445, z=4}, {x=28224, y=14445, z=1}, effect = true}, --to flying carpet
	[8203] = {{x=28226, y=14452, z=4}, {x=28308, y=14434, z=14}, effect = true}, -- elevator to Farmine
	[8204] = {{x=28308, y=14434, z=10}, {x=28226, y=14452, z=4}, effect = true}, -- Farmine Stage 3
	[8205] = {{x=28308, y=14434, z=12}, {x=28226, y=14452, z=4}, effect = true}, -- Farmine Stage 2
	[8206] = {{x=28308, y=14434, z=14}, {x=28226, y=14452, z=4}, effect = true} -- Farmine Stage 1
}

local elevatorLever = Action()

function elevatorLever.onUse(cid, item, fromPosition, itemEx, toPosition)
	local k = t[item.actionid]
	local thing = getTopCreature(k[1]).uid
	if(item.actionid == 9120 and item.itemid == 2772) then -- elevator to Farmine
		if(isPlayer(thing)) then
			if cid:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then -- if Farmine is on Stage 3
				k[2].z = 10
			elseif cid:getStorageValue(Storage.TheNewFrontier.Mission03) >= 2 then -- if Farmine is on Stage 2
				k[2].z = 12
			elseif cid:getStorageValue(Storage.TheNewFrontier.Mission03) < 2 then -- if Farmine is on Stage 1
				k[2].z = 14
			end
			doTeleportThing(thing, k[2], false)
			if(k.effect) then
				doSendMagicEffect(k[2], CONST_ME_TELEPORT)
			end
		end
	elseif(k and item.itemid == 2772) then
		if(isPlayer(thing)) then
			doTeleportThing(thing, k[2], false)
			if(k.effect) then
				doSendMagicEffect(k[2], CONST_ME_TELEPORT)
			end
		end
	end
	return doTransformItem(item.uid, item.itemid == 2772 and 2773 or 2772)
end

elevatorLever:aid(9118, 8202, 8203, 8204, 8205, 8206)
elevatorLever:register()
