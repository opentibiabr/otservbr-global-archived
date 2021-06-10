local config = {
	bossName = "Duke Krule",
	storage = Storage.GraveDanger.DukeKruleTime,
	requiredLevel = 250,
	leverId = 9825,
	timeToFightAgain = 20, -- In hour
	timeToDefeatBoss = 20, -- In minutes
	clearRoomTime = 60, -- In minutes
	daily = true,
	centerRoom = Position(33457, 31473, 13),
	playerPositions = {
		Position(33455, 31493, 13),
		Position(33456, 31493, 13),
		Position(33457, 31493, 13),
		Position(33458, 31493, 13),
		Position(33459, 31493, 13)
	},
	teleportPosition = Position(33455, 31480, 13),
	bossPosition = Position(33456, 31467, 13),
	specPos = Position(32347, 32167, 12)
}

local dukekruleLever = Action()
function dukekruleLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == config.leverId then
		-- Check if the player that pulled the lever is on the correct position
		if player:getPosition() ~= config.playerPositions[1] then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can\'t start the battle.")
			return true
		end

		local team, participant = {}
		for participantPos = 1, #config.playerPositions do
			participant = Tile(config.playerPositions[participantPos]):getTopCreature()

			-- Check there is a participant player
			if participant and participant:isPlayer() then
				-- Check participant level
				if participant:getLevel() < config.requiredLevel then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level ".. config.requiredLevel .." or higher.")
					return true
				end

				-- Check participant boss timer
				if config.daily and participant:getStorageValue(config.storage) > os.time() then
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You or a member in your team have to wait ".. config.timeToFightAgain .."  hours to face Druke Krule again!")
					return true
				end
				team[#team + 1] = participant
			end
		end

		-- Check if a team currently inside the boss room
		local specs, _ = Game.getSpectators(config.centerRoom, false, false, 14, 14, 13, 13)
		for specPlayers = 1, #specs do
			spec = specs[specPlayers]
			if spec:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There's someone fighting with Duke Krule.")
				return true
			end
			spec:remove()
		end

		-- One hour for clean the room
		addEvent(clearRoom, config.clearRoomTime * 60 * 1000, config.centerRoom)
		Game.createMonster(config.bossName, config.bossPosition)

		-- Teleport team participants
		for teamPlayers = 1, #team do
			team[teamPlayers]:getPosition():sendMagicEffect(CONST_ME_POFF)
			team[teamPlayers]:teleportTo(config.teleportPosition)
			team[teamPlayers]:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have ".. config.timeToDefeatBoss .." minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.")
			-- Assign boss timer
			team[teamPlayers]:setStorageValue(config.storage, os.time() + config.timeToFightAgain * 60 * 60) -- 20 hours
			item:transform(config.leverId)

				addEvent(function()
					local spectators, _ = Game.getSpectators(config.centerRoom, false, false, 14, 14, 13, 13)
						for spectatorsPos = 1, #spectators do
							spec = spectators[spectatorsPos]
							if spec:isPlayer() then
								spec:teleportTo(config.specPos)
								spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
								spec:say("Time out! You were teleported out by strange forces.", TALKTYPE_MONSTER_SAY)
							end
						end
				end, config.timeToDefeatBoss * 60 * 1000)
		end
	end
	return true
end

dukekruleLever:uid(30029)
dukekruleLever:register()
