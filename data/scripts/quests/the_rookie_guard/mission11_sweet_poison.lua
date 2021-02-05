-- The Rookie Guard Quest - Mission 11: Sweet Poison

local missionTiles = {
	[50350] = {
		state = 1,
		message = "Cross the bridge to the west and go south to reach the wasps' nest.",
		arrowPosition = {x = 32090, y = 32147, z = 7}
	},
	[50353] = {
		state = 1,
		message = "You've found the wasp tower. Kill a wasp and use the flask you got from Vascalir on its corpse to retrieve some of its poison.",
		newState = 2
	}
}

-- Mission tutorial tiles

local missionGuide = MoveEvent()

function missionGuide.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	local missionState = player:getStorageValue(Storage.TheRookieGuard.Mission11)
	-- Skip if not was started or finished
	if missionState == -1 or missionState > 7 then
		return true
	end
	local tile = missionTiles[item.actionid]
	-- Check if need display message/arrow
	if missionState == tile.state then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, tile.message)
		if tile.newState then
			player:setStorageValue(Storage.TheRookieGuard.Mission11, tile.newState)
		end
		if tile.arrowPosition then
			Position(tile.arrowPosition):sendMagicEffect(CONST_ME_TUTORIALARROW)
		end
	end
	return true
end

for index, value in pairs(missionTiles) do
	missionGuide:aid(index)
end
missionGuide:register()

-- Special flask (gather poison on wasp corpse)

local specialFlask = Action()

function specialFlask.onUse(player, item, frompos, item2, topos)
	local missionState = player:getStorageValue(Storage.TheRookieGuard.Mission11)
	if missionState == 2 and item2.itemid == 5989 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You carefully gather some of the wasp poison. Bring it back to Vascalir.")
		player:setStorageValue(Storage.TheRookieGuard.Mission11, 3)
		player:removeItem(13924, 1)
		player:addItemEx(Game.createItem(13923, 1), true, CONST_SLOT_WHEREEVER)
	end
	return true
end

specialFlask:id(13924)
specialFlask:register()
