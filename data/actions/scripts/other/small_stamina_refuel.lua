-- <action itemid="ITEMID" script="other/stamina_refuel.lua"/> 

local stamina_full = 42 * 60 -- config. 42 = horas

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if (not target) then
		return false
	end

	if (target:getStorageValue(481024) > 0) then
		local waitDays = target:getStorageValue(481024)
		if (waitDays - os.time() > 0) then
			waitDays = math.ceil((waitDays - os.time())/86400)
			target:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[SMALL STAMINA REFILL] Você só pode usar Stamina depois de " ..waitDays.. " dia.")
			return true
		end
	end

	if target:getStamina() >= stamina_full then
		target:sendCancelMessage("Your stamina is already full.")
	else
		target:setStamina(8*60)
		target:sendTextMessage(MESSAGE_INFO_DESCR, "Your stamina has been refilled for 8 hours.")
		item:remove(1)
		target:setStorageValue(481024, os.time()+86400)
	end

	return true
end