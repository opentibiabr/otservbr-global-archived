

-- This script is for registering teleports, follow the sequence in the configuration lib and add at the variable "TeleportName"
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)

local teleportName = {
	"Teleport",
	"Teleport1"
	}
	
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for k, key in pairs(teleportName) do
	local setting = GlobalConfig[key]
		if setting.uniqueId == item.uid or setting.actionId == item.actionid then
			player:teleportTo(setting.destination)
			setting.destination:sendMagicEffect(setting.effect)
		end
	end
	return true
end

for uids = 5000,5001 do
moveevent:uid(uids)
end

-- rookgaard premium bridge
local moveevent = MoveEvent()

function moveevent.onStepIn(player, item, toPosition, fromPosition)
	
	if not player then
		return true
	end

	local setting = GlobalConfig["PremiumBridge"]
	if setting.actionId == item.actionid then
		if player:isPremium() then
			player:teleportTo(toPosition)
			player:getPosition():sendMagicEffect(setting.effect)
		else 
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(setting.effect)
		end
	end
	return true
end

moveevent:aid(30001)
moveevent:register()

-- tomb coal basin
local moveevent = MoveEvent()

function moveevent.onAddItem(moveitem, tileitem, position)
	local setting = Uniques.TombCoalBasin[tileitem.uid]
	if not setting then
		return true
	end

	if moveitem.itemid ~= 3042 then
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	moveitem:remove()
	position:sendMagicEffect(CONST_ME_HITBYFIRE)

	Tile(setting.flamePosition):relocateTo(setting.toPosition)
	setting.toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

moveevent:id(1485)
moveevent:register()

-- roshamuul carpet
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local town = Town(2)
	if not town then
		return true
	end

	local destination = town:getTemplePosition()
	player:teleportTo(destination)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flying carpet brought you back to Thais.')
	position:sendMagicEffect(CONST_ME_POFF)
	destination:sendMagicEffect(CONST_ME_POFF)
	return true
end

moveevent:position({x=33514,y=32345,z=4})
moveevent:register()

-- gray beach vortex
-- go to gray beach
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
local positionGo = Position(33456, 31346, 8)

	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(positionGo)
	targetPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dive into the vortex to swim below the rocks to the other side of the cave.')
	return true
end

moveevent:position({x=32201,y=31977,z=8})
moveevent:register()
-- back of gray beach to edron
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
local positionBack = Position(33199, 31978, 8)

	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	player:teleportTo(positionBack)
	targetPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dive into the vortex to swim below the rocks to the other side of the cave.')
	return true
end

moveevent:position({x=33456,y=31346,z=8})
moveevent:register()

-- ab'dendriel teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = Uniques.AbDendrielTeleports[item.uid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

for uids = 5230,5235 do
moveevent:uid(uids)
end
moveevent:register()

-- ab'dendriel teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local exitPosition = Position(32308, 32267, 7)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getVocation():getBase():getId() == 1 then
		return true
	end

	player:teleportTo(exitPosition)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end

moveevent:position({x=32300,y=32267,z=7})
moveevent:position({x=32300,y=32268,z=7})
moveevent:register()

-- deeper banuta shortcut teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = config[item.uid]
	if not targetPosition then
		return true
	end

	if player:getStorageValue(Storage.DeeperBanutaShortcut) < 100 then
		player:teleportTo(targetPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

for uids = 5250,5252 do
moveevent:uid(uids)
end
moveevent:register()

-- porthope deathlings entrance/exit
local moveevent = MoveEvent()

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = destination[item.actionid]
	if teleport then
		player:teleportTo(teleport)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		teleport:sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end

moveevent:uid(5253,5254)
moveevent:register()

-- vengoth teleports
local moveevent = MoveEvent()

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetPosition = Uniques.VengothTeleports[item.uid]
	if not targetPosition then
		return true
	end

	player:teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
	return true
end

for uids = 5270,5279 do
moveevent:uid(uids)
end
moveevent:register()

-- the spike entrance
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = Uniques.KazordoonTeleports[item.uid]
	if not teleport then
		return true
	end
	if teleport then
		if isPremium() == FALSE then
			player:teleportTo(fromPosition)
			player:sendCancelMessage("You need a premium account to access this area.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		elseif isPremium() == TRUE then
			player:teleportTo(teleport.destination)
			item:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end

moveevent:uid(5400)
moveevent:register()

-- the spike teleports
local moveevent = MoveEvent()

function moveevent.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = Uniques.KazordoonTeleports[item.uid]
	if not teleport then
		return true
	end

	
	if player:getLevel() >= teleport.levelMin and player:getLevel() <= teleport.levelMax then 
			player:teleportTo(teleport.destination)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			teleport.destination:sendMagicEffect(CONST_ME_TELEPORT)
			else
			player:teleportTo(fromPosition)
			return true
		end
end

for uids = 5401,5417 do
moveevent:uid(uids)
end
moveevent:register()

