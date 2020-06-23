local setting = {
	timeToFightAgain = 20,
	clearRoomTime = 60, -- In hour
	centerRoom = {x = 33364, y = 31318, z = 9},
	range = 10,
	storage = Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer,
	clearRoomStorage = GlobalStorage.OberonEventTime,
	bossName = "grand master oberon",
	bossPosition = {x = 33364, y = 31317, z = 9}
}

local playerPositions = {
	{fromPos = {x = 33364, y = 31344, z = 9}, toPos = {x = 33364, y = 31321, z = 9}},
	{fromPos = {x = 33363, y = 31344, z = 9}, toPos = {x = 33363, y = 31321, z = 9}},
	{fromPos = {x = 33365, y = 31344, z = 9}, toPos = {x = 33365, y = 31321, z = 9}},
	{fromPos = {x = 33362, y = 31344, z = 9}, toPos = {x = 33362, y = 31321, z = 9}},
	{fromPos = {x = 33366, y = 31344, z = 9}, toPos = {x = 33366, y = 31321, z = 9}}
}

-- Start Script
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 and item.actionid == 57605 then
		for i = 1, #playerPositions do
			local creature = Tile(playerPositions[i].fromPos):getTopCreature()
			if not creature then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need 5 players to fight with this boss.")
				return true
			end
		end

		if roomIsOccupied(setting.centerRoom, setting.range, setting.range)
					or Game.getStorageValue(setting.clearRoomStorage) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
			return true
		end

		for i = 1, #playerPositions do
			local creature = Tile(playerPositions[i].fromPos):getTopCreature()
			if creature and creature:isPlayer() then
				if not creature:getStorageValue(setting.storage) >= os.time() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have faced this boss in the last " .. setting.timeToFightAgain .. " hours.")
					return true
				end
				if creature:getStorageValue(setting.storage) < os.time() then
					creature:setStorageValue(setting.storage, os.time() + setting.timeToFightAgain * 60 * 60)
					creature:teleportTo(playerPositions[i].toPos)
					creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			else
				return false
			end
		end
		-- One hour for clean the room and other time goto again
		addEvent(clearRoom, setting.clearRoomTime * 60 * 1000, setting.centerRoom,
					setting.range, setting.range, setting.clearRoomStorage)
		Game.createMonster(setting.bossName, setting.bossPosition)
		Game.setStorageValue(setting.clearRoomStorage, 1)
	end
	return true
end
