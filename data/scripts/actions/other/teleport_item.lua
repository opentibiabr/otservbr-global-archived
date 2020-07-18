-- Script for items that teleport when giving use
-- Add a new item in the action_unique table at the correct range

local teleportItem = Action()

function teleportItem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Scarlett Etzel teleport item
	if item.uid == 15003 then
		if roomIsOccupied({x = 33396, y = 32648, z = 6}, 11, 11)
					or Game.getStorageValue(GlobalStorage.ScarlettEtzelEventTime) == 1 then
			player:say("Someone is fighting against the boss! You need wait awhile.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if player:getStorageValue(Storage.GraveDanger.ScarlettEtzel) > os.time() then
			player:say("You already have faced Scarlett Etzel in the last 20 hours. Try again later.", TALKTYPE_MONSTER_SAY)
			return true
		end

		Game.createMonster("scarlett etzel", {x = 33396, y = 32643, z = 6})
		player:teleportTo({x = 33395, y = 32657, z = 6})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.GraveDanger.ScarlettEtzel, os.time() + 20 * 60 * 60)
		-- addEvent = One hour for clean the room and other time goto again
		addEvent(clearRoom, 60 * 60 * 1000, {x = 33396, y = 32648, z = 6}, 11, 11, GlobalStorage.ScarlettEtzelEventTime)
		Game.setStorageValue(GlobalStorage.ScarlettEtzelEventTime, 1)
		return true
	end

	local setting = TeleportItemUnique[item.uid]
	if setting then
		player:teleportTo(setting.destination)
		player:getPosition():sendMagicEffect(setting.effect)
	end
	return true
end

for uniqueRange = 15001, 20000 do
	teleportItem:uid(uniqueRange)
end

teleportItem:register()
