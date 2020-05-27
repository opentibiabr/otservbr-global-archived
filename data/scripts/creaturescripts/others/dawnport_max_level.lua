local dawnportMaxLevel = CreatureEvent("DawnportMaxLevel")

function dawnportMaxLevel.onAdvance(creature, target)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local town = player:getTown()
	if player:getLevel() == 20 and town and town:getId() == TOWNS_LIST.DAWNPORT then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"You have reached the limit level and have to choose your vocation and leave Dawnport.")
		addEvent(function(uid)
		local player = Player(uid)
			if player then
				player:teleportTo(town:getTemplePosition())
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
		end, 5 * 60 * 1000, player:getId())
	end
	return true
end

dawnportMaxLevel:register()
