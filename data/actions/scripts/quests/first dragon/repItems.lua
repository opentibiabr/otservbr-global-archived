local config = {
	[27609] = {storage = Storage.FirstDragon.Horn},
	[27607] = {storage = Storage.FirstDragon.Scale},
	[27608] = {storage = Storage.FirstDragon.Tooth},
	[27610] = {storage = Storage.FirstDragon.Bones}
}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local item2 = config[item.itemid]
	if not item2 then
		return true
	end
	if not target.actionid == 24886 then
		return false
	end
	if player:getStorageValue(item2.storage) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already sacrificed this item to pass.')
		return true
	end
	player:setStorageValue(item2.storage, 1)
	if player:getStorageValue(Storage.FirstDragon.AccessCave) < 0 then
		player:setStorageValue(Storage.FirstDragon.AccessCave, 0)
	end
	player:setStorageValue(Storage.FirstDragon.AccessCave, player:getStorageValue(Storage.FirstDragon.AccessCave) + 1)
	if player:getStorageValue(Storage.FirstDragon.AccessCave) < 4 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You\'re plunging ' ..item:getName().. ' into the lava.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You\'re plunging ' ..item:getName().. ' into the lava. You are now worthy to enter The First Dragon\'s Lair. Touch the lava pool again.')
	end
	item:remove()
	return true
end
