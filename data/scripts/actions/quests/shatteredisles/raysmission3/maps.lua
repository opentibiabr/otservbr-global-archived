local NargorMaps = Action()

function NargorMaps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end
	if player:getStorageValue(Storage.TheShatteredIsles.RaysMission3) == 1 then
		if player:getStorageValue(setting.storage) < 0 then
			player:setStorageValue(setting.storage, 1)
			player:say(setting.message, TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end

for value = 24906, 24908 do
	NargorMaps:uid(value)
end
NargorMaps:register()
