if not setting then
	setting = {
		[45700] = {
			center = Position(33110, 31965, 10),
			maxRangeX = 12, minRangeX = 26, minRangeY = 15, maxRangeY = 17,
			bossResp = Position(33102, 31956, 10),
			boss = "Deathstrike",
			teleportTo = Position(33096, 31955, 10),
			locked = false,
			storage = Storage.BigfootBurden.BossWarzone1,
			interval = 20 * 60 * 60,-- 20 hours
			exit = Position(33001, 31900, 9)
		},
		[45701] = {
			center = Position(33117, 31956, 11),
			maxRangeX = 14, minRangeX = 14, minRangeY = 14, maxRangeY = 14,
			bossResp = Position(33116, 31956, 11),
			boss = "Gnomevil",
			teleportTo = Position(33106, 31955, 11),
			locked = false,
			storage = Storage.BigfootBurden.BossWarzone2,
			interval = 20 * 60 * 60,-- 20 hours
			exit = Position(33001, 31900, 9),
			wall = 18459 --Id of current crystais in warzone 2 (open killing parasite)
		},
		[45702] = {
			center = Position(33090, 31910, 12),
			maxRangeX = 12, minRangeX = 12, minRangeY = 12, maxRangeY = 12,
			bossResp = Position(33088, 31910, 12),
			boss = "Abyssador",
			teleportTo = Position(33083, 31904, 12), --Place where the player will be teleported inside the room
			locked = false,
			storage = Storage.BigfootBurden.BossWarzone3,
			interval = 20 * 60 * 60,-- 20 hours
			exit = Position(33001, 31900, 9)
		}
	}

	setting.spawnBoss = function (name, pos)
		local boss = Game.createMonster(name, pos)
		if boss then
			local c = setting.findByName(name)
			c.locked = true
			boss:registerEvent('WarzoneBossDeath')
		end
	end
	setting.findByName = function(name, last)
		local i, v = next(setting, last)
		if type(v) == 'table' and v.boss == name then
			return v
		elseif not i then
			return nil
		end
		return setting.findByName(name, i)
	end

	setting.resetRoom = function(roomwarzone, msg, releaseRoom)
		if releaseRoom then
			roomwarzone.locked = false
		end

		local spectators = Game.getSpectators(roomwarzone.center, false, false,
		roomwarzone.minRangeX, roomwarzone.maxRangeX, roomwarzone.minRangeY, roomwarzone.maxRangeY)
		for i = 1, #spectators do
			if spectators[i]:isPlayer() then
				spectators[i]:teleportTo(roomwarzone.exit)
				spectators[i]:sendTextMessage(MESSAGE_EVENT_ADVANCE, msg)
			else
				spectators[i]:remove()
			end
		end
	end
end

local function filter(list, f, i)
	if i < #list then
		if f(list[i]) then
			return list[i], filter(list, f, i + 1)
		else
			return filter(list, f, i + 1)
		end
	elseif list[i] and f(list[i]) then
		return list[i]
	end
end

local function spawnBoss(inf)
	local boss = Game.createMonster(inf.boss, inf.bossResp)
	boss:registerEvent('WarzoneBossDeath')
end

function onStepIn(creature, item, pos, fromPosition)
	if not creature:isPlayer() then
		creature:teleportTo(fromPosition)
		return false
	end

	local warzone = setting[item:getActionId()]
	if not warzone then
		return false
	end

	if creature:getStorageValue(warzone.storage) > os.time() then
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already cleared this warzone in the last 20 hours.")
		creature:teleportTo(fromPosition)
		return false
	end

	if warzone.locked then
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please, wait until the room is cleared. \z
		This happens 30 minutes after the last team entered.")
		creature:teleportTo(fromPosition)
		return true
	end

	creature:teleportTo(warzone.teleportTo)
	creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have half an hour to heroically defeat the \z
	" .. warzone.boss .. ". Otherwise you'll be teleported out by the gnomish emergency device." )
	return true
end