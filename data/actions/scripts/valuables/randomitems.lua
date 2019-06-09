local config = {
	[13670] = { -- belonging of a deceased
		chances = {
			{from = 1, to = 1442, itemId = 2238},
			{from = 1443, to = 2856, itemId = 2237},
			{from = 2857, to = 4262, itemId = 2115},
			{from = 4263, to = 4819, itemId = 2148, count = 6},
			{from = 4820, to = 5325, itemId = 2787},
			{from = 5326, to = 5813, itemId = 5890},
			{from = 5814, to = 6283, itemId = 3976, count = 4},
			{from = 6284, to = 6751, itemId = 2328},
			{from = 6752, to = 7175, itemId = 5899},
			{from = 7176, to = 7576, itemId = 5894},
			{from = 7577, to = 7949, itemId = 10606},
			{from = 7950, to = 8315, itemId = 2403},
			{from = 8316, to = 8673, itemId = 8859},
			{from = 8674, to = 8972, itemId = 5902},
			{from = 8973, to = 9187},
			{from = 9188, to = 9328, itemId = 2661},
			{from = 9329, to = 9428, itemId = 2199},
			{from = 9429, to = 9515, itemId = 13926},
			{from = 9516, to = 9594, itemId = 2143},
			{from = 9595, to = 9666, itemId = 5879},
			{from = 9667, to = 9732, itemId = 2114},
			{from = 9733, to = 9791, itemId = 13925},
			{from = 9792, to = 9845, itemId = 10563},
			{from = 9846, to = 9891, itemId = 2110},
			{from = 9892, to = 9929, itemId = 5895},
			{from = 9930, to = 9967, itemId = 5880},
			{from = 9968, to = 9998, itemId = 13508},
			{from = 9999, to = 10001, itemId = 2195}
		},
		effect = CONST_ME_POFF
	},
	[15572] = { -- gooey mass
		chances = {
			{from = 1, to = 2},
			{from = 3, to = 2167, itemId = 15487, count = 10},
			{from = 2168, to = 4243, itemId = 2152, count = 2},
			{from = 4244, to = 6196, itemId = 2144, count = 2},
			{from = 6197, to = 8149, itemId = 7591, count = 2},
			{from = 8150, to = 9823, itemId = 7590, count = 2},
			{from = 9824, to = 9923, itemId = 9971},
			{from = 9924, to = 9990, itemId = 15546},
			{from = 9991, to = 10001, itemId = 15492}
		},
		effect = CONST_ME_HITBYPOISON
	},
	[18215] = { -- gnomish supply package
		chances = {
			{from = 1, to = 1440, itemId = 2787, count = 20},
			{from = 1441, to = 2434, itemId = 18397},
			{from = 2435, to = 3270, itemId = 18437, count = 15},
			{from = 3271, to = 4085, itemId = 18304, count = 15},
			{from = 4086, to = 4836, itemId = 18457},
			{from = 4837, to = 5447, itemId = 7588, count = 2},
			{from = 5448, to = 6047, itemId = 7589, count = 2},
			{from = 6048, to = 6576, itemId = 7618, count = 4},
			{from = 6577, to = 7094, itemId = 7620, count = 4},
			{from = 7095, to = 7559, itemId = 7590},
			{from = 7560, to = 7963, itemId = 7591},
			{from = 7964, to = 8317, itemId = 7443},
			{from = 8318, to = 8628, itemId = 7439},
			{from = 8629, to = 8932, itemId = 2152, count = 5},
			{from = 8933, to = 9232, itemId = 5911},
			{from = 9233, to = 9511, itemId = 7440},
			{from = 9512, to = 9636, itemId = 18455},
			{from = 9637, to = 9747, itemId = 18522},
			{from = 9748, to = 9836, itemId = 18519},
			{from = 9837, to = 9893, itemId = 2160},
			{from = 9894, to = 9929, itemId = 2156},
			{from = 9930, to = 9958, itemId = 18509},
			{from = 9959, to = 9987, itemId = 2154},
			{from = 9988, to = 9994, itemId = 2158},
			{from = 9995, to = 10001, itemId = 2155}
		},
		effect = CONST_ME_CRAPS
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useId = config[item.itemid]
	if not useId then
		return false
	end

	local chance = math.random(10001)
	for i = 1, #useId.chances do
		local randomItem = useId.chances[i]
		if chance >= randomItem.from and chance <= randomItem.to then
			if randomItem.itemId then
				local itemId, count = randomItem.itemId, randomItem.count or 1
				player:addItem(itemId, count)
				if item.itemid == 13670 then
					local itemType = ItemType(itemId)
					player:say('You found ' .. (count > 1 and count or (itemType:getArticle() ~= '' and itemType:getArticle() or '')) .. ' ' .. (count > 1 and itemType:getPluralName() or itemType:getName()) .. ' in the bag.', TALKTYPE_MONSTER_SAY)
				end
			else
				player:say('You found nothing useful.', TALKTYPE_MONSTER_SAY)
			end

			item:getPosition():sendMagicEffect(useId.effect)
			item:remove(1)
			break
		end
	end
	return true
end
