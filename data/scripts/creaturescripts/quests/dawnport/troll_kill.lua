local trollKill = CreatureEvent("MorrisTrollKill")
function trollKill.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end

	if not target:getName():lower() == "mountain troll" then
		return true
	end

	local killAmount = player:getStorageValue(Storage.DawnportQuest.MorrisTrollCount)
	if player:getStorageValue(Storage.DawnportQuest.MorriskTroll) >= 0 and killAmount < 5000 then
		player:setStorageValue(Storage.DawnportQuest.MorrisTrollCount, killAmount + 1)
	end
	return true
end

trollKill:register()
