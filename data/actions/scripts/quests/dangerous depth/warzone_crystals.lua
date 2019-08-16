local crystals = {
	-- Warzone IV
	[57350] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal1},
	[57351] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal1},
	[57352] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.bigCrystal2},
	[57353] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.mediumCrystal2},
	[57354] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal1},
	[57355] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneVI.smallCrystal2},

	-- Warzone V
	[57356] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal1},
	[57357] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal1},
	[57358] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.bigCrystal2},
	[57359] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.mediumCrystal2},
	[57360] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal1},
	[57361] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneV.smallCrystal2},

	-- Warzone IV
	[57362] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.bigCrystal1},
	[57363] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.mediumCrystal1},
	[57364] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.bigCrystal2},
	[57365] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.mediumCrystal2},
	[57366] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.smallCrystal1},
	[57367] = {storageTime = Storage.DangerousDepths.Crystals.WarzoneIV.smallCrystal2},
}

local function createCrystal(crystalId, player)
	local chance = math.random(10)
	local itemId = nil
	if crystalId == 30738 then -- Large Crystal
		itemId = chance == 1 and 18554 or 31993
	elseif crystalId == 30740 or crystalId == 17017 then -- Medium Crystal
		itemId = chance <= 5 and 18554 or 31993
	elseif crystalId == 32405 then -- Small Crystal
		itemId = chance <= 7 and 18554 or 31993
	end

	if itemId then
		local item = Game.createItem(itemId, 1)
		local ret = player:addItemEx(item)
		if ret ~= RETURNVALUE_NOERROR then
			player:sendCancelMessage(Game.getReturnMessage(ret))
			return true
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local crystal = crystals[item:getActionId()]
	if not crystal then
		return true
	end

	local storageTime = crystal.storageTime
	if storageTime > os.time() then
		return true
	end

	local itemId = item:getId()
	createCrystal(itemId, player)
	player:setStorageValue(storageTime, os.time() + 5 * 60)
	return true
end