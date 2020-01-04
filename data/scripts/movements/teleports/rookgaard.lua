-- rookgaard premium bridge
local moveevent = MoveEvent()

function moveevent.onStepIn(player, item, toPosition, fromPosition)
	
	if not player then
		return true
	end

	local setting = GlobalConfig["PremiumBridge"]
	if setting.actionId == item.actionid then
		if player:isPremium() then
			player:teleportTo(toPosition)
			player:getPosition():sendMagicEffect(setting.effect)
		else 
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(setting.effect)
		end
	end
	return true
end

moveevent:aid(30001)
moveevent:register()