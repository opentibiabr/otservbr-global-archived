-- <action itemid="ITEMID" script="other/stamina_refuel.lua"/> 

local stamina_full = 42 * 60 -- config. 42 = horas

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getStorageValue(481023) > 0) then
		local waitDays = player:getStorageValue(481023)
		if (waitDays - os.time() > 0) then
			waitDays = math.ceil((waitDays - os.time())/86400)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[STAMINA REFILL] Você só pode usar Stamina depois de " ..waitDays.. " dias.")
			return true
		end
	end

	if player:getStamina() >= stamina_full then
		player:sendCancelMessage("Your stamina is already full.")
	elseif player:getPremiumDays() < 1 then
		player:sendCancelMessage("You must have a premium account.")
	else
		player:setStamina(stamina_full)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your stamina has been refilled.")
		item:remove(1)
		player:setStorageValue(481023, os.time()+172800)
	end
	
	return true
end