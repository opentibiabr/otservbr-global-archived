local oressaStair = {
	[25009] = {
		destination = {x = 32063, y = 31891, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You cannot go upstairs. You have chosen a vocation and must now leave for the Mainlands."
	}
}

local chestRoomTile = {
	[25010] = {
		destination = {x = 32054, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[25011] = {
		destination = {x = 32073, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[25012] = {
		destination = {x = 32059, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[25013] = {
		destination = {x = 32068, y = 31883, z = 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	}
}

local vocations = {
	msgVoc = "You should leave for the Mainland now. Go left to reach the ship.",
	msgNoVoc = "You have not the right vocation to enter this room.",
	[25014] = {vocation = VOCATION.ID.SORCERER, destination = {x = 32054, y = 31879, z = 6}},
	[25015] = {vocation = VOCATION.ID.DRUID, destination = {x = 32073, y = 31879, z = 6}},
	[25016] = {vocation = VOCATION.ID.PALADIN, destination = {x = 32059, y = 31879, z = 6}},
	[25017] = {vocation = VOCATION.ID.KNIGHT, destination = {x = 32068, y = 31879, z = 6}},
}

local setVocation = {
	[VOCATION.ID.SORCERER] = VOCATION.ID.DAWNPORT_SORCERER,
	[VOCATION.ID.DRUID] = VOCATION.ID.DAWNPORT_DRUID,
	[VOCATION.ID.PALADIN] = VOCATION.ID.DAWNPORT_PALADIN,
	[VOCATION.ID.KNIGHT] = VOCATION.ID.DAWNPORT_KNIGHT
}

local effects = {
	CONST_ME_TUTORIALARROW,
	CONST_ME_TUTORIALSQUARE
}

-- Oressa stair, back if have reached level 20 or choose vocation
-- Chest vocation rook back before pass
local dawnportTileBack = MoveEvent()

function dawnportTileBack.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = chestRoomTile[item.actionid]
	if teleport then
		if player:getStorageValue(Storage.Dawnport.DoorVocation) == player:getVocation():getId() then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, teleport.msg)
			player:teleportTo(teleport.destination, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end

	local stair = oressaStair[item.actionid]
	if stair then
		if player:getStorageValue(Storage.Dawnport.DoorVocation) == player:getVocation():getId() then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, stair.msg)
			player:teleportTo(stair.destination, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		elseif player:getLevel() == 20 then
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
	end

	local vocationTeleport = vocations[item.actionid]
	if vocationTeleport then
		if player:getStorageValue(Storage.Dawnport.ChestRoomFinish) < 1 then
			player:setStorageValue(Storage.Dawnport.ChestRoomFinish, 1)
			return true
		end

		if player:getStorageValue(Storage.Dawnport.ChestRoomFinish) == 1 then
			if player:getVocation():getId() == vocationTeleport.vocation then
				player:teleportTo(vocationTeleport.destination, true)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, vocations.msgVoc)
			else
				player:teleportTo(vocationTeleport.destination, true)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, vocations.msgNoVoc)
			end
		end
	end
	return true
end

for index, value in pairs(chestRoomTile) do
	dawnportTileBack:aid(index)
end

dawnportTileBack:aid(25009)
dawnportTileBack:register()

-- First tutorial tile, on the first dawnport town
local tutorialTile = MoveEvent()

function tutorialTile.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getLastLoginSaved() == 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Use these stairs to enter the Adventurer's Outpost on Dawnport.")
		player:sendTutorial(1)
		for i = 1, #effects do
			Position({x = 32075, y = 31900, z = 6}):sendMagicEffect(effects[i])
		end
	end
	return true
end

tutorialTile:position({x = 32069, y = 31901, z = 6})
tutorialTile:register()

-- Before up stair on the first dawnport town
local tutorialTile1 = MoveEvent()

function tutorialTile1.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getStorageValue(Storage.Quest.Dawnport.Questline) == 1 then
		return true
	end

	if player:getStorageValue(Storage.Quest.Dawnport.Questline) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Welcome to Dawnport! Walk around and explore on your own, or talk to Inigo if you need directions.")
		player:sendTutorial(2)
		player:setStorageValue(Storage.Quest.Dawnport.Questline, 1)
		player:setStorageValue(Storage.Quest.Dawnport.GoMain, 1)
		player:setTown(Town(TOWNS_LIST.DAWNPORT))
	end
	return true
end

tutorialTile1:position({x = 32075, y = 31898, z = 5})
tutorialTile1:register()

-- Tutorial tile for not back to dawnport first town
local tutorialTile2 = MoveEvent()

function tutorialTile2.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if item.itemid == 22693 then
		player:teleportTo({x = 32070, y = 31900, z = 6}, true)
	elseif item.itemid == 23745 then
		player:teleportTo({x = 32075, y = 31899, z = 5}, true)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "<krrk> <krrrrrk> You move away hurriedly.")
	end
	return true
end

tutorialTile2:id(22693, 23745)
tutorialTile2:register()

-- Message on step in the stair for go to NPC's
local tutorialTile3 = MoveEvent()

function tutorialTile3.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getStorageValue(Storage.Dawnport.Tutorial) ~= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "To walk on STAIRS, use your arrow keys on your keyboard. You can also use them to walk in general.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.Dawnport.Tutorial, 0)
	end
	return true
end

local positions = {
	{x = 32075, y = 31896, z = 5},
	{x = 32074, y = 31896, z = 5},
	{x = 32073, y = 31896, z = 5},
	{x = 32072, y = 31896, z = 5},
	{x = 32072, y = 31895, z = 5}
}

for i = 1, #positions do
	tutorialTile3:position(positions[i])
end

tutorialTile3:register()

-- Message before down stairs of vocation tiles
local tutorialTile4 = MoveEvent()

function tutorialTile4.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getStorageValue(Storage.Dawnport.MessageStair) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "To ATTACK, click on a target in the battle list next to the game window. A red frame shows which enemy you're attacking.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.Dawnport.MessageStair, 1)
	end
	return true
end

local positions = {
	{x = 32063, y = 31906, z = 6},
	{x = 32064, y = 31906, z = 6},
	{x = 32065, y = 31906, z = 6},
	{x = 32049, y = 31890, z = 6},
	{x = 32049, y = 31891, z = 6},
	{x = 32049, y = 31892, z = 6},
	{x = 32079, y = 31890, z = 6},
	{x = 32079, y = 31891, z = 6},
	{x = 32079, y = 31892, z = 6},
	{x = 32063, y = 31875, z = 6},
	{x = 32064, y = 31875, z = 6},
	{x = 32065, y = 31875, z = 6}
}

for i = 1, #positions do
	tutorialTile4:position(positions[i])
end

tutorialTile4:register()

-- If death with vocation main from level 8 to 7, return back to the dawnport vocation
local backVocation = MoveEvent()

function backVocation.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local setting = setVocation[player:getVocation():getId()]
	if not setting then
		return true
	end

	if player:getLevel() == 7 then
		player:setVocation(Vocation(setting))
	end
	return true
end

backVocation:position({x= 32064, y = 31894, z = 6})
backVocation:register()
