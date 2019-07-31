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
GlobalStorage.FerumbrasAscendantQuest.TheShattererLever,
GlobalStorage.Feroxa.Active,
GlobalStorage.FerumbrasAscendantQuest.Habitats.AllHabitats,
GlobalStorage.FerumbrasAscendantQuest.Elements.Active,
GlobalStorage.FerumbrasAscendantQuest.Elements.First,
GlobalStorage.FerumbrasAscendantQuest.Elements.Second,
GlobalStorage.FerumbrasAscendantQuest.Elements.Third,
GlobalStorage.FerumbrasAscendantQuest.Elements.Done
}

function onStartup()
	print(string.format('>> Loaded %d npcs and spawned %d monsters.\n>> Loaded %d towns with %d houses in total.', Game.getNpcCount(), Game.getMonsterCount(), #Game.getTowns(), #Game.getHouses()))
	for i = 1, #startupGlobalStorages do
		Game.setStorageValue(startupGlobalStorages[i], 0)
	end

	local time = os.time()
	db.asyncQuery('TRUNCATE TABLE `players_online`')

	-- zerar storages e permitir compra de boost na store
	db.query('UPDATE `player_storage` SET `value` = 0 WHERE `player_storage`.`key` = 51052')

	-- deletar as guilds canceladas e rejeitadas
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 2')
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 3')

	-- deletar as guilds que estão muito tempo pendentes 3 dias
	db.asyncQuery('DELETE FROM `guild_wars` WHERE `status` = 0 AND (`started` + 72 * 60 * 60) <= ' .. os.time())

	--db.asyncQuery("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. os.time() .. " WHERE `status` = 1 AND (`started` + 3* 60 * 60) < " .. os.time())
	db.asyncQuery('DELETE FROM `players` WHERE `deletion` != 0 AND `deletion` < ' .. time)
	db.asyncQuery('DELETE FROM `ip_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	db.asyncQuery('DELETE FROM `market_history` WHERE `inserted` <= ' .. (time - configManager.getNumber(configKeys.MARKET_OFFER_DURATION)))

	-- Move expired bans to ban history
	local resultId = db.storeQuery('SELECT * FROM `account_bans` WHERE `expires_at` != 0 AND `expires_at` <= ' .. time)
	if resultId ~= false then
		repeat
			local accountId = result.getNumber(resultId, 'account_id')
			db.asyncQuery('INSERT INTO `account_ban_history` (`account_id`, `reason`, `banned_at`, `expired_at`, `banned_by`) VALUES (' .. accountId .. ', ' .. db.escapeString(result.getString(resultId, 'reason')) .. ', ' .. result.getNumber(resultId, 'banned_at') .. ', ' .. result.getNumber(resultId, 'expires_at') .. ', ' .. result.getNumber(resultId, 'banned_by') .. ')')
			db.asyncQuery('DELETE FROM `account_bans` WHERE `account_id` = ' .. accountId)
		until not result.next(resultId)
		result.free(resultId)
	end

	-- Ferumbras Ascendant quest
	for i = 1, #GlobalStorage.FerumbrasAscendantQuest.Habitats do
	local storage = GlobalStorage.FerumbrasAscendantQuest.Habitats[i]
	Game.setStorageValue(storage, 0)
	end

	-- Check house auctions
	local resultId = db.storeQuery('SELECT `id`, `highest_bidder`, `last_bid`, (SELECT `balance` FROM `players` WHERE `players`.`id` = `highest_bidder`) AS `balance` FROM `houses` WHERE `owner` = 0 AND `bid_end` != 0 AND `bid_end` < ' .. time)
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
				db.asyncQuery('UPDATE `houses` SET `last_bid` = 0, `bid_end` = 0, `highest_bidder` = 0, `bid` = 0 WHERE `id` = ' .. house:getId())
			end
		until not result.next(resultId)
		result.free(resultId)
	end

	-- register
	local types = {
		["axe"] = "hand",
		["club"] = "hand",
		["sword"] = "hand",
		["rod"] = "hand",
		["wand"] = "hand",
		["bow"] = "hand",
		["crossbow"] = "hand",
		["especial"] = "hand",
		["boots"] = "feet",
		["helmet"] = "head",
		["helmetmage"] = "head",
		["spellbooks"] = "shield",
	}
	for tp, info in pairs(Imbuements_Weapons) do
		for _, id in pairs(info) do
			if not Game.itemidHasMoveevent(id) then
				local reg = types[tp]
				if not reg then
					reg = tp
				end
				-- Equip function
				local equip = MoveEvent()
				equip.onEquip = defaultEquip
				equip:type("equip")
				equip:id(id)
				equip:slot(reg)
				equip:register()

				-- DeEquip function
				local deequip = MoveEvent()
				deequip.onEquip = defaultDeEquip
				deequip:type("deequip")
				deequip:id(id)
				deequip:slot(reg)
				deequip:register()
			end
		end
	end

	-- Client XP Display Mode
	-- 0 = ignore exp rate /stage
	-- 1 = include exp rate / stage
	Game.setStorageValue(GlobalStorage.XpDisplayMode, 0)
end
