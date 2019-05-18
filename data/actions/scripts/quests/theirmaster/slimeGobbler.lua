local positions = {
	Position(33313, 31852, 9),
	Position(33313, 31881, 9),
	Position(33328, 31860, 9),
	Position(33328, 31873, 9),
	Position(33328, 31885, 9),
	Position(33308, 31873, 9),
	Position(33320, 31873, 9),
	Position(33335, 31873, 9),
	Position(33360, 31873, 9),
	Position(33336, 31914, 9),
	Position(33343, 31914, 9),
	Position(33353, 31914, 9),
	Position(33361, 31914, 9),
	Position(33345, 31900, 9),
	Position(33352, 31900, 9),
	Position(33355, 31854, 9),
	Position(33355, 31885, 9),
	Position(33345, 31864, 9),
	Position(33345, 31881, 9),
	Position(33309, 31867, 9),
	Position(33317, 31879, 9),
	Position(33311, 31854, 9),
	Position(33334, 31889, 9),
	Position(33340, 31890, 9),
	Position(33347, 31889, 9)
}

local servants = {
	'iron servant', -- 50%
	'iron servant',
	'iron servant',	
	'iron servant',	
	'iron servant',	
	'golden servant', -- 40%	
	'golden servant',
	'golden servant',	
	'golden servant',	
	'diamond servant' -- 10%
}

local function getFungusInArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for i = 13585, 13589 do
				if(getTileItemById({x = x, y = y, z = 9}, i).uid > 1) then
					return true
				end
			end
		end
	end
	return false
end

local function summonServant(position)
	Game.createMonster(servants[math.random(#servants)], position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 13601) then
		if(isInArray({13585, 13586, 13587, 13588, 13589}, itemEx.itemid)) then
			if(getPlayerStorageValue(cid, SlimeGobblerTimeout) + 5 < os.time()) then
				doTransformItem(itemEx.uid, 13590, 1)
				setPlayerStorageValue(cid, SlimeGobblerTimeout, os.time())
				doSendMagicEffect(toPosition, CONST_ME_POFF)
				if(getFungusInArea({x = 33306, y = 31847}, {x = 33369, y = 31919}) == false) then
					for i = 1, #positions do
						addEvent(summonServant, 5 * 1000, positions[i])
					end
					doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_RED)
					doCreatureSay(cid, "COME! My servants! RISE!", TALKTYPE_ORANGE_1)
					setGlobalStorageValue(985, 0)
					setGlobalStorageValue(984, 0)
				else
					doCreatureSay(cid, "The slime gobbler gobbles large chunks of the slime fungus with great satisfaction.", TALKTYPE_ORANGE_1)
					doPlayerAddExp(cid, 20, true, true)
				end
			end
		end
	end
	return true
end