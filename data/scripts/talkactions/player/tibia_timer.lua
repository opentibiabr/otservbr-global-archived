local statusTime = TalkAction("!timer")
function statusTime.onSay(player, words, param)
	local time = getWorldTime()
	local light = getWorldLight()
	local dayOrNight = getTibiaTimerDayOrNight(getFormattedWorldTime(time))

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Now is ".. dayOrNight .." in Tibia Time, timer now is "..getFormattedWorldTime(time)..".")
	return false
end

statusTime:register()
