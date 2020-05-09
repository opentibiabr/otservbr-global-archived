local rareCrystal = Action()
local collectorCorpse = Action()

function rareCrystal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[target.uid]
	if not setting then
		return true
	end

	local destination = setting.destination

	if player:getStorageValue(setting.storage) ~= setting.storageNeeded then
		return false
	end

	player:setStorageValue(setting.storage, player:getStorageValue(setting.storage) + 1)
	player:setStorageValue(setting.updateStorage, player:getStorageValue(setting.updateStorage) + 1)

	player:teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_TELEPORT)
	item:remove()
	return true
end

function collectorCorpse.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 10612 then
		return false
	end

	if player:getStorageValue(Storage.SeaOfLightQuest.Questline) ~= 8 then
		return false
	end

	player:say("You carefully put the mirror crystal into the astronomers's device.", TALKTYPE_MONSTER_SAY)
	player:setStorageValue(Storage.SeaOfLightQuest.Questline, 9)
	player:setStorageValue(Storage.SeaOfLightQuest.Mission3, 3)
	item:transform(10616)
end

rareCrystal:id(10614)
rareCrystal:register()

collectorCorpse:id(10615)
collectorCorpse:register()
