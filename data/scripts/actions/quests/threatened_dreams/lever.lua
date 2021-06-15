local config = {
	bossName = "prince drazzak",
	storage = Storage.ThreatenedDreams.FacelessBaneTime,
	requiredLevel = 250,
	timeToFightAgain = 20, -- In hour
	clearRoomTime = 60, -- In minutes
	daily = true,
	leverPosition = {x = 33637, y = 32562, z = 13},
	exitPosition = {x = 33618, y = 32522, z = 15},
	bossPosition = {x = 33617, y = 32561, z = 13},
	centerRoom = {x = 33617, y = 32562, z = 13},
	range = 8
}

local playersPositions = {
	{fromPos = {x = 33638, y = 32562, z = 13}, toPos = {x = 33617, y = 32567, z = 13}},
	{fromPos = {x = 33639, y = 32562, z = 13}, toPos = {x = 33617, y = 32567, z = 13}},
	{fromPos = {x = 33640, y = 32562, z = 13}, toPos = {x = 33617, y = 32567, z = 13}},
	{fromPos = {x = 33641, y = 32562, z = 13}, toPos = {x = 33617, y = 32567, z = 13}},
	{fromPos = {x = 33642, y = 32562, z = 13}, toPos = {x = 33617, y = 32567, z = 13}}
}

local threatenedLever = Action()
function threatenedLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local clearRoomEvent = nil
	if item.itemid == 10030 then
		if toPosition:checkLeverPlayers(player, config.leverPosition, playersPositions, "You need 5 players to fight with this boss.") then
			return true
		end

		if Position(config.centerRoom):checkRoomPlayers(config.range, config.range) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
			return true
		end

		for i = 1, #playersPositions do
			local creature = Tile(playersPositions[i].fromPos):getTopCreature()
			if creature --[[and creature:isPlayer()]] then
				-- Check players level
				if creature:getLevel() < config.requiredLevel then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level ".. config.requiredLevel .." or higher.")
					return true
				end
				if config.daily and creature:getStorageValue(config.storage) >= os.time() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have faced this boss in the last " .. config.timeToFightAgain .. " hours.")
					return true
				end
				if creature:getStorageValue(config.storage) < os.time() then
					if config.daily then
						creature:setStorageValue(config.storage, os.time() + config.timeToFightAgain * 60 * 60)
					end
					clearRoom(config.centerRoom, config.range, config.range)
					creature:teleportTo(playersPositions[i].toPos)
					creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have ".. config.clearRoomTime .." minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
				end
			else
				return false
			end
		end
		if clearRoomEvent then
			stopEvent(clearRoomEvent)
		end
		local clearRoomEvent = addEvent(clearRoom, config.clearRoomTime * 60 * 1000, config.centerRoom, config.range, config.range, config.exitPosition)
		Game.createMonster(config.bossName, config.bossPosition)
		item:transform(10029)
	elseif item.itemid == 10029 then
		item:transform(10030)
	end
	return true
end

threatenedLever:uid(1039)
threatenedLever:register()