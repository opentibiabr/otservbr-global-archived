function onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	if(isMonster(target)) then
	local killAmount = player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount)
		if(string.lower(getCreatureName(target)) == "minotaur") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "depowered minotaur") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "execowtioner") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "glooth powered minotaur") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur amazon") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur archer") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur bruiser") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur guard") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur hunter") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur mage") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "minotaur poacher") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "mooh'tah warrior") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "moohtant") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
			 
			 elseif(string.lower(getCreatureName(target)) == "worm priestess") and killAmount < 5000 and player:getStorageValue(Storage.KillingInTheNameOf.BudrikMinos) == 1 then
			 player:setStorageValue(Storage.KillingInTheNameOf.BudrikMinosCount, killAmount + 1)
		end
	end

	return true
end