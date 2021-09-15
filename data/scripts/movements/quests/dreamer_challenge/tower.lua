local config = {
	[4229] = {storageValue = 1, toPosition = Position(32360, 31782, 7)}, -- Carlin
	[4230] = {storageValue = 1, toPosition = Position(32369, 32241, 7)}, -- Thais
	[4231] = {storageValue = 1, toPosition = Position(32750, 32344, 14)}, -- Dream realm
	[4232] = {storageValue = 2, toPosition = Position(32649, 31925, 11)}, -- Kazoordoon
	[4233] = {storageValue = 2, toPosition = Position(32732, 31634, 7)}, -- Ab
	[4234] = {storageValue = 2, toPosition = Position(32181, 32436, 7)}, -- Fibula
	[4235] = {storageValue = 4, toPosition = Position(33213, 32454, 1)}, -- Darashia
	[4236] = {storageValue = 4, toPosition = Position(33194, 32853, 8)}, -- Ankrahmun
	[4237] = {storageValue = 4, toPosition = Position(32417, 32139, 15)} -- Mintwalin
}

local tower = MoveEvent()

function tower.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local targetTeleport = config[item.uid]
	if not targetTeleport then
		return true
	end

	if (player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= targetTeleport.storageValue
	or player:getStorageValue(Storage.OutfitQuest.BrotherhoodOutfit) >= targetTeleport.storageValue)
	and player:removeItem(5021, 1) then
		player:teleportTo(targetTeleport.toPosition)
	else
		player:teleportTo(fromPosition)
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

tower:type("stepin")

for index, value in pairs(config) do
	tower:uid(index)
end

tower:register()
