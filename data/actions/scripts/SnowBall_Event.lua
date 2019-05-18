function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(10109) > 0 and player:getStorageValue(10108) <= 30  then

		player:setStorageValue(10108, player:getStorageValue(10108) + SnowBall_Configurations.Ammo_Configurations.Ammo_Ammount)
		player:setStorageValue(10109, player:getStorageValue(10109) - SnowBall_Configurations.Ammo_Configurations.Ammo_Price)
		player:sendTextMessage(29, "Você acaba de comprar ".. SnowBall_Configurations.Ammo_Configurations.Ammo_Ammount .." bolas de neve por ".. SnowBall_Configurations.Ammo_Configurations.Ammo_Price .."\nVocê tem ".. player:getStorageValue(10108) .." bolas de neve\nVocê tem ".. player:getStorageValue(10109) .." ponto(s).")
	elseif player:getStorageValue(10109) < 1 then

		player:sendCancelMessage("Você não tem ".. SnowBall_Configurations.Ammo_Configurations.Ammo_Price .." ponto(s).")
	elseif player:getStorageValue(10108) > 30 then

		player:sendCancelMessage("Você só pode comprar bolas de neve com o minimo de 30 bolas.")
	end
    return true
end
