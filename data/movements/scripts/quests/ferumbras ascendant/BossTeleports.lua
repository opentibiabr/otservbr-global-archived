local config = {
	[24830] = {storageKey = Storage.FerumbrasAscension.Razzagorn},
	[24831] = {storageKey = Storage.FerumbrasAscension.Ragiaz},
	[24832] = {storageKey = Storage.FerumbrasAscension.Zamulosh},
	[24833] = {storageKey = Storage.FerumbrasAscension.Mazoran},
	[24834] = {storageKey = Storage.FerumbrasAscension.Tarbaz},
	[24835] = {storageKey = Storage.FerumbrasAscension.Shulgrax},
	[24836] = {storageKey = Storage.FerumbrasAscension.Plagirath}
}
function onStepIn(creature, item, position, fromPosition)
	local teleport = config[item.actionid]
	if not teleport then
		return false
	end
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(teleport.storageKey) == 1 then
		local position = player:getPosition()
		position.z = position.z - 1
		player:teleportTo(position)
	end
	return true
end
