local sacrificee = Position(32844, 32228, 14)
local sacrificee2 = Position(32835, 32225, 14)
local ssacrificee3 = Position(32790, 32227, 14)
local ssacrificee4 = Position(32784, 32226, 14)

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if item.actionid == 50149 and player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= 2 then
		player:teleportTo(sacrificee2)
		doSendMagicEffect(sacrificee2,CONST_ME_POFF)
	else
		player:teleportTo(sacrificee)

	if not player then
		return true
	end
	if item.actionid == 50150 and player:getStorageValue(Storage.OutfitQuest.BrotherhoodOutfit) >= 2 then
		player:teleportTo(ssacrificee4)
		doSendMagicEffect(sacrificee2,CONST_ME_POFF)
	else
		player:teleportTo(ssacrificee3)
	end
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return true
end
end
