local dormitori = Position(33018, 32437, 10)
local dormitori2 = Position(33015, 32440, 10)
local BOSS = "Necromancer Servant" -- boss name
local BOSS_POS = {x = 33008, y = 32437, z = 11} -- boss spawn coord

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.actionid == 4534 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission55) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission56) < 1 then

		player:setStorageValue(Storage.GravediggerOfDrefia.Mission56,1)
		player:setStorageValue(Storage.GravediggerOfDrefia.Mission57,1)
		player:teleportTo(dormitori2)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You should hurry, try not to dwell here any longer than a few minutes.')
	    Game.createMonster(BOSS, BOSS_POS)
	else
		player:teleportTo(dormitori)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The teleport is accessible only once.')

	end

	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
