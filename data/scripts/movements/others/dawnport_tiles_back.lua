local setting = {
	[40005] = {
		destination = {x = 32063, y = 31891, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You cannot go upstairs. You have chosen a vocation and must now leave for the Mainlands."
	},
	[40006] = {
		destination = {x = 32054, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[40007] = {
		destination = {x = 32073, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[40008] = {
		destination = {x = 32059, y = 31883, z= 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	},
	[40009] = {
		destination = {x = 32068, y = 31883, z = 6},
		storage = Storage.Dawnport.DoorVocation,
		msg = "You have chosen your vocation. You cannot go back."
	}
}

local vocations = {
	msgVoc = "You should leave for the Mainland now. Go left to reach the ship.",
	msgNoVoc = "You have not the right vocation to enter this room.",
	[40010] = {vocation = VOCATION.SORCERER, destination = {x = 32054, y = 31879, z = 6}},
	[40011] = {vocation = VOCATION.DRUID, destination = {x = 32073, y = 31879, z = 6}},
	[40012] = {vocation = VOCATION.PALADIN, destination = {x = 32059, y = 31879, z = 6}},
	[40013] = {vocation = VOCATION.KNIGHT, destination = {x = 32068, y = 31879, z = 6}},
}

local dawnportOressaStair = MoveEvent()

function dawnportOressaStair.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.actionid]
	if teleport then
		if player:getStorageValue(teleport.storage) == player:getVocation():getId() then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, teleport.msg)
			player:teleportTo(teleport.destination, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end

	local vocationTeleport = vocations[item.actionid]
	if vocationTeleport then
		if player:getStorageValue(Storage.Dawnport.DoorVocation) == player:getVocation():getId() then
			if player:getVocation():getId() == vocationTeleport.vocation then
				player:teleportTo(vocationTeleport.destination)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, vocations.msgVoc)
			else
				player:teleportTo(vocationTeleport.destination)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, vocations.msgNoVoc)
			end
		end
	end
	if player:getLevel() == 20 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

for key = 40005, 40013 do
	dawnportOressaStair:aid(key)
end

dawnportOressaStair:register()

local tutorialTiles = MoveEvent()

function tutorialTiles.onStepIn(creature, item, position, fromPosition)
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

tutorialTiles:id(22693, 23745)
tutorialTiles:register()

local tutorialTiles2 = MoveEvent()

function tutorialTiles2.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if item.uid == 25027 then
		if player:getStorageValue(Storage.Quest.Dawnport.Questline) < 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Welcome to Dawnport! Walk around and explore on your own, or talk to Inigo if you need directions.")
			player:sendTutorial(2)
			player:setStorageValue(Storage.Quest.Dawnport.Questline, 1)
			player:setStorageValue(Storage.Quest.Dawnport.GoMain, 1)
		end
	end
	return true
end

tutorialTiles2:uid(25027)
tutorialTiles2:register()
