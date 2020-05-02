function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 10612 then
		return false
	end

	if player:getStorageValue(Storage.SeaOfLightQuest.Questline) ~= 8 then
		return false
	end

	player:say('You carefully put the mirror crystal into the astronomers\'s device.', TALKTYPE_MONSTER_SAY)
	player:setStorageValue(Storage.SeaOfLightQuest.Questline, 9)
	player:setStorageValue(Storage.SeaOfLightQuest.Mission3, 3)
	item:transform(10616)
	return true
end
