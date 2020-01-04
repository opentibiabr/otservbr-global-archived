-- oramond teleports
local moveevent = MoveEvent()
function moveevent.onStepIn(creature, item, position, fromPosition)
	
	local config ={"Teleport13", "Teleport14", "Teleport15", "Teleport16"}
	
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	for k, key in pairs(config) do
	local setting = GlobalConfig[key] 
		if setting.uniqueId == item.uid then
			player:teleportTo(setting.destination)
			fromPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
			position:sendMagicEffect(CONST_ME_GREEN_RINGS)
			player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end

for uniques = 5013,5016 do
moveevent:uid(uniques)
end
moveevent:register()

-- oramond dungeon entrance
local moveevent = MoveEvent()

local days = {
	["Sunday"] = Position(33459, 31715, 9), -- c: demons
	["Monday"] = Position(31254, 32604, 9), -- b: oramond minotaurs
	["Tuesday"] = Position(33459, 31715, 9), -- c: demons
	["Wednesday"]  = Position(31061, 32605, 9), -- a: golems
	["Thursday"] = Position(33459, 31715, 9), -- c: demons
	["Friday"]  = Position(33459, 31715, 9), -- c: demons
	["Saturday"] = Position(31254, 32604, 9), -- b: oramond minotaurs
}

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	local tmpTeleport = days[os.date("%A")]
	if tmpTeleport then
		player:teleportTo(tmpTeleport)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	end
	return true
end

moveevent:position({x=33669,y=31887,z=5})
moveevent:register()

-- oramond dungeon exits
local moveevent = MoveEvent()
function moveevent.onStepIn(creature, item, position ,fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	local position = Position(33668, 31887, 5)
		player:teleportTo(position)
		fromPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
		position:sendMagicEffect(CONST_ME_GREEN_RINGS)
		player:say("Slrrp!", TALKTYPE_MONSTER_SAY)
	return true
end

moveevent:position({x=31062,y=32605,z=9}) -- a: golemns
moveevent:position({x=31255,y=32604,z=9}) -- b: oramond minotaurs
moveevent:position({x=33460,y=31715,z=9}) -- c: demons exit
moveevent:register()

-- seacrest
local moveevent = MoveEvent()
function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	local setting = {
		teleportTo = Position(33552, 31775, 13),
		teleportFrom = Position(33544, 31861, 7),
		headItem = player:getSlotItem(CONST_SLOT_HEAD),
		itemID = {5460, 11585, 13995}
	}

	if setting.headItem and isInArray(setting.itemID, setting.headItem.itemid) then
		player:teleportTo(setting.teleportTo)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You enter the seacrest ground.')
	else
		player:teleportTo(setting.teleportFrom)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You must wear an underwater exploration helmet in order to dive.')
	end
	return true
end

moveevent:position({x=33545,y=31859,z=7})
moveevent:register()