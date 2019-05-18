local statues = {
	[18488] = SKILL_SWORD,
	[18489] = SKILL_AXE,
	[18490] = SKILL_CLUB,
	[18491] = SKILL_DISTANCE,
	[18492] = SKILL_MAGLEVEL
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local skill = statues[item:getId()]
	if not player:isPremium() then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUNEEDPREMIUMACCOUNT))
		return true
	end

	if player:isPzLocked() then
		return false
	end
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	player:setOfflineTrainingSkill(skill)
	player:remove()
	return true
end
