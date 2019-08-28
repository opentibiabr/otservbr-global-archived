function onKill(cid, target)
	if (getCreatureName(target) == "Sheep") and player:getStorageValue(64444) < 1 then
	player:setStorageValue(64444, 1)
	end
	return true
end