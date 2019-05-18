function onRecvbyte(player, msg, byte)
	local fightMode = msg:getByte()
	local chaseMode = msg:getByte()
	local secureMode = msg:getByte() ~= 0
	local pvpMode, oldPvpMode = msg:getByte(), player:getPvpMode()

	local expertPvp = configManager.getBoolean(configKeys.EXPERT_PVP)

	player:setFightMode(fightMode)
	player:setChaseMode(chaseMode)
	if expertPvp then
		local worldType = Game.getWorldType()
		if worldType == WORLD_TYPE_NO_PVP and pvpMode == PVP_MODE_RED_FIST then
			player:setPvpMode(player:getPvpMode())
		elseif worldType == WORLD_TYPE_PVP_ENFORCED and pvpMode ~= PVP_MODE_RED_FIST then
			player:setPvpMode(PVP_MODE_RED_FIST)
		else
			player:setPvpMode(pvpMode)
		end

		-- SecureMode Formula!
		if worldType == WORLD_TYPE_NO_PVP and secureMode == false or (worldType == WORLD_TYPE_PVP_ENFORCED and secureMode == true) then
			player:setSecureMode(not secureMode)
		else
			if player:getPvpMode() == PVP_MODE_RED_FIST then
				-- force secureMode false while red fist is on!
				player:setSecureMode(false)
			else
				player:setSecureMode(secureMode)
			end

			if oldPvpMode == PVP_MODE_RED_FIST then
				player:setSecureMode(true)
			end
		end

		addPlayerEvent(Player.updateFightModes, 250, player)
	else
		player:setSecureMode(secureMode)
	end
end
