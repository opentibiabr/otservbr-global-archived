-- Script for items that teleport when giving use
-- Add a new item in the action_unique table at the correct range

local setting = {
	fightAgainTime = 20, -- In hours
	clearRoomTime = 60, -- In minutes
	centerRoom = {x = 33396, y = 32648, z = 6},
	exitPosition = {x = 33395, y = 32662, z = 6},
	range = 11
}

local teleportItem = Action()

function teleportItem.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Scarlett Etzel teleport item
	if item.uid == 17003 then
		if roomIsOccupied(setting.centerRoom, setting.range, setting.range) then
			player:say("Someone is fighting against the boss! You need wait awhile.", TALKTYPE_MONSTER_SAY)
			return true
		end

		if player:getStorageValue(Storage.GraveDanger.ScarlettEtzel) > os.time() then
			player:say("You already have faced Scarlett Etzel in the last ".. setting.fightAgainTime .." hours. Try again later.", TALKTYPE_MONSTER_SAY)
			return true
		end

		Game.createMonster("scarlett etzel", {x = 33396, y = 32643, z = 6})
		player:teleportTo({x = 33395, y = 32657, z = 6})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.GraveDanger.ScarlettEtzel, os.time() + setting.fightAgainTime * 60 * 60)
		addEvent(clearRoom, setting.clearRoomTime * 60 * 1000, setting.centerRoom, setting.range, setting.range, setting.exitPosition)
		return true
	end

	local setting = UniqueTable[item.uid]
	if setting then
		player:teleportTo(setting.destination)
		player:getPosition():sendMagicEffect(setting.effect)
	end
	return true
end

for key = 17001, 18000 do
	teleportItem:uid(key)
end

teleportItem:register()
