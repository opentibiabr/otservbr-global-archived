local startupGlobalStorages = {
	GlobalStorage.TheAncientTombs.AshmunrahSwitchesGlobalStorage,
	GlobalStorage.TheAncientTombs.DiprathSwitchesGlobalStorage,
	GlobalStorage.TheAncientTombs.ThalasSwitchesGlobalStorage,
	GlobalStorage.HeroRathleton.FirstMachines,
	GlobalStorage.HeroRathleton.SecondMachines,
	GlobalStorage.HeroRathleton.ThirdMachines,
	GlobalStorage.HeroRathleton.DeepRunning,
	GlobalStorage.HeroRathleton.HorrorRunning,
	GlobalStorage.HeroRathleton.LavaRunning,
	GlobalStorage.HeroRathleton.MaxxenRunning,
	GlobalStorage.HeroRathleton.LavaCounter,
	GlobalStorage.HeroRathleton.FourthMachines,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal1,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal2,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal3,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal4,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal5,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal6,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal7,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.Crystal8,
	GlobalStorage.FerumbrasAscendantQuest.Crystals.AllCrystals,
	GlobalStorage.FerumbrasAscendantQuest.FerumbrasEssence,
	GlobalStorage.Feroxa.Active,
	GlobalStorage.FerumbrasAscendantQuest.Habitats.AllHabitats,
	GlobalStorage.FerumbrasAscendantQuest.Elements.Active,
	GlobalStorage.FerumbrasAscendantQuest.Elements.First,
	GlobalStorage.FerumbrasAscendantQuest.Elements.Second,
	GlobalStorage.FerumbrasAscendantQuest.Elements.Third,
	GlobalStorage.FerumbrasAscendantQuest.Elements.Done
}

function onStartup()
	loadCustomMaps()
	print("> Loaded " .. (#CustomMapTable) .. " custom map.")

	loadLuaNpcs()
	print(string.format("> Loaded ".. (#NpcTable) .." npcs and spawned %d monsters.\n> \z
	Loaded %d towns with %d houses in total.", Game.getMonsterCount(), #Game.getTowns(), #Game.getHouses()))

	loadLuaMapAttributes()
	print("> Loaded " .. (#SignTable) .. " signs in the map.")
	print("> Loaded " .. (#BookTable) .. " books in the map.")
	print("> Loaded action and unique per Lua")

	for i = 1, #startupGlobalStorages do
		Game.setStorageValue(startupGlobalStorages[i], 0)
	end

	local time = os.time()
	db.asyncQuery('TRUNCATE TABLE `players_online`')

	-- reset storages and allow purchase of boost in the store
	db.query('UPDATE `player_storage` SET `value` = 0 WHERE `player_storage`.`key` = 51052')

	-- delete canceled and rejected guilds
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 2')
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 3')

	-- Delete guilds that are pending for 3 days
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 0 AND (`started` + 72 * 60 * 60) <= ' .. os.time())

	db.asyncQuery('DELETE FROM `players` WHERE `deletion` != 0 AND `deletion` < ' .. time)
	db.asyncQuery('DELETE FROM `ip_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	db.asyncQuery('DELETE FROM `market_history` WHERE `inserted` <= \z
	' .. (time - configManager.getNumber(configKeys.MARKET_OFFER_DURATION)))

	-- Move expired bans to ban history
	local banResultId = db.storeQuery('SELECT * FROM `account_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	if banResultId ~= false then
		repeat
			local accountId = result.getNumber(banResultId, 'account_id')
			db.asyncQuery('INSERT INTO `account_ban_history` (`account_id`, `reason`, `banned_at`, \z
			`expired_at`, `banned_by`) VALUES (' .. accountId .. ', \z
			' .. db.escapeString(result.getString(banResultId, 'reason')) .. ', \z
			' .. result.getNumber(banResultId, 'banned_at') .. ', ' .. result.getNumber(banResultId, 'expires_at') .. ', \z
			' .. result.getNumber(banResultId, 'banned_by') .. ')')
			db.asyncQuery('DELETE FROM `account_bans` WHERE `account_id` = ' .. accountId)
		until not result.next(banResultId)
		result.free(banResultId)
	end

	-- Ferumbras Ascendant quest
	for i = 1, #GlobalStorage.FerumbrasAscendantQuest.Habitats do
		local storage = GlobalStorage.FerumbrasAscendantQuest.Habitats[i]
		Game.setStorageValue(storage, 0)
	end

	-- Check house auctions
	local resultId = db.storeQuery('SELECT `id`, `highest_bidder`, `last_bid`, (SELECT `balance` FROM \z
	`players` WHERE `players`.`id` = `highest_bidder`) AS `balance` FROM `houses` WHERE `owner` = 0 AND \z
	`bid_end` != 0 AND `bid_end` < ' .. time)
	if resultId ~= false then
		repeat
			local house = House(result.getNumber(resultId, 'id'))
			if house then
				local highestBidder = result.getNumber(resultId, 'highest_bidder')
				local balance = result.getNumber(resultId, 'balance')
				local lastBid = result.getNumber(resultId, 'last_bid')
				if balance >= lastBid then
					db.query('UPDATE `players` SET `balance` = ' .. (balance - lastBid) .. ' WHERE `id` = ' .. highestBidder)
					house:setOwnerGuid(highestBidder)
				end
				db.asyncQuery('UPDATE `houses` SET `last_bid` = 0, `bid_end` = 0, `highest_bidder` = 0, \z
				`bid` = 0 WHERE `id` = ' .. house:getId())
			end
		until not result.next(resultId)
		result.free(resultId)
	end

	-- Client XP Display Mode
	-- 0 = ignore exp rate /stage
	-- 1 = include exp rate / stage
	Game.setStorageValue(GlobalStorage.XpDisplayMode, 0)
	
	-- Hireling System
	HirelingsInit()
end
