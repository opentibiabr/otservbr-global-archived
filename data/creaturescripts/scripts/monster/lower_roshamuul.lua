local setting = {
	["frazzlemaw"] = roshamuul_killed_frazzlemaws,
	["silencer"] = ROSHAMUUL_KILLED_SILENCERS
}

function onKill(creature, target)
	local monster = setting[target:getName():lower()]
	if monster then
		creature:setStorageValue(monster, math.max(0, creature:getStorageValue(monster)) + 1)
	end
	return true
end
