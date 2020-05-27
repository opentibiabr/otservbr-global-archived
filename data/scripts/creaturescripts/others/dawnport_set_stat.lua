local setting = {
	[VOCATION.ID.DAWNPORT_SORCERER] = VOCATION.ID.SORCERER,
	[VOCATION.ID.DAWNPORT_DRUID] = VOCATION.ID.DRUID,
	[VOCATION.ID.DAWNPORT_PALADIN] = VOCATION.ID.PALADIN,
	[VOCATION.ID.DAWNPORT_KNIGHT] = VOCATION.ID.KNIGHT
}

local dawnportSetVocation = CreatureEvent("dawnportSetVocation")

function dawnportSetVocation.onAdvance(player, skill, oldLevel, newLevel)
	if newLevel <= oldLevel then
		return true
	end

	local vocation = setting[player:getVocation():getId()]
	if not vocation then
		return true
	end

	if newLevel == 8 then
		player:setVocation(Vocation(vocation))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Congratulations! You may now choose your vocation and leave Dawnport. Talk to Oressa in the temple.")
	end
	return true
end

dawnportSetVocation:register()
