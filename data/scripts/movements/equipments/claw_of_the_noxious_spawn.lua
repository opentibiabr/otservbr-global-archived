-- claw of 'The Noxious Spawn'
local ring = MoveEvent()
function ring.onEquip(player, item, slot, isCheck)
	item:transform(9392)
	if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
		return true
	end

	doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -200, -200, CONST_ME_DRAWBLOOD)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It tightens around your wrist as you take it on.')
return true
end
ring:id(9394)
ring:level(100)
ring:register()

local ring = MoveEvent()
function ring.onDeEquip(player, item, slot, isCheck)
	item:transform(9394)
	return true
end
ring:id(9392)
ring:level(100)
ring:register()

local ring = MoveEvent()
function ring.onEquip(player, item, slot, isCheck)
	return true
end
ring:id(9397)
ring:level(100)
ring:register()

local ring = MoveEvent()
function ring.onDeEquip(player, item, slot, isCheck)
	return true
end
ring:id(9397)
ring:level(100)
ring:register()