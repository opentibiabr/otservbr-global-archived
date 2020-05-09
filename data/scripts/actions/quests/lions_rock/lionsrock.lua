
local lionsRockSanctuaryRockId = 3608

local rewards = {
	'emerald bangle',
	'giant shimmering pearl',
	'gold ingot',
	'green gem',
	'red gem',
	"lion's heart",
	'yellow gem'
}

-- Lions rock skeleton
local lionsRockSkeleton = Action()

function lionsRockSkeleton.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.storage) < 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have discovered a skeleton. It seems to hold an old parchment.')
		player:addItem(23784, 1):setAttribute(
			ITEM_ATTRIBUTE_TEXT,
			"\"Still it is hard to believe that I finally found the mystical rock formations near Darashia, \z
            known as Lion's Rock. According to ancient records there is a temple for an unknown, probably long \z
            forgotten deity, built in the tunnels deep below the rock centuries ago. This holy site was once guarded \z
            by mystical lions and they may still be down there. But yet I haven't succeeded in entering the inner \z
            sanctum. The entrance to the lower temple areas is protected by an old and powerful enchantment. I \z
            studied the inscriptions on the temple walls and thus learned that the key to the inner sanctum is the \z
            passing of three tests. The first test is the Lion's Strength. In order to honour the site's mystical \z
            cats of prey one has to hunt and slay a cobra. The cobra's tongue must be laid down at a stone statue as \z
            a sacrifice. The second test is the Lion's Beauty. One has to burn the petals of a lion's mane flower on \z
            a coal basin. In the sand at the rock's foot I saw some dried lion's mane petals. Maybe these flowers \z
            grow somewhere upwards. The third test is called the Lion's Tears. It seems one has to purify an \z
            ornamented stone pedestal with ...\" At this point the records end because the parchment is destroyed. \z
            It seems that is was torn by a big paw ..."
		)
		player:setStorageValue(setting.storage, 1)
		player:setStorageValue(Storage.TibiaTales.DefaultStart, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
	return true
end

lionsRockSkeleton:uid(24909)
lionsRockSkeleton:register()

-- Lions rock sacrifices
local lionsRockSacrificesTest = Action()

function lionsRockSacrificesTest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[target.uid]
	if not setting then
		return true
	end

	if not setting.useItem then
		return true
	end

	local pagodaPos = setting.pagodaPos
	local pagodaID = 3709
	local pagodaLitID = 3710

	local function reset()
		local pagodaLit = Tile(pagodaPos):getItemById(pagodaLitID)
		if pagodaLit then
			pagodaLit:transform(pagodaID)
		end
	end

	if item.itemid == setting.useItem then
		if player:getStorageValue(setting.need) == setting.needCount then
			if player:getStorageValue(setting.storage) < 0 then
				local pagoda = Tile(pagodaPos):getItemById(pagodaID)
				if pagoda then
					pagoda:transform(pagodaLitID)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message)
					player:setStorageValue(setting.storage, 1)
					player:setStorageValue(setting.need, setting.needNext)
					player:removeItem(setting.useItem, 1)
					toPosition:sendMagicEffect(setting.effect)
					addEvent(reset, 15 * 1000)
				end
			end
		end
	end
	return true
end

lionsRockSacrificesTest:id(10551)
lionsRockSacrificesTest:id(23760)
lionsRockSacrificesTest:id(23835)
lionsRockSacrificesTest:register()

-- Get lions mane
local lionsGetLionsMane = Action()

function lionsGetLionsMane.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 23759 then
		if player:getStorageValue(Storage.LionsRock.Progress) > 0 then
			if player:getStorageValue(Storage.LionsRock.GetLionsMane) < 0 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You picked a beautiful lion's mane flower.")
				player:addItem(23760, 1)
				player:setStorageValue(Storage.LionsRock.GetLionsMane, 1)
			end
		end
	end
	return true
end

lionsGetLionsMane:id(23759)
lionsGetLionsMane:register()

-- Get holy water
local lionsGetHolyWater = Action()

function lionsGetHolyWater.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	if player:getStorageValue(setting.need) > 0 then
		if player:getStorageValue(setting.storage) < 0 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You took some holy water from the sacred well.')
			player:addItem(setting.addItem, 1)
			player:setStorageValue(setting.storage, 1)
		end
	end
	return true
end

lionsGetHolyWater:uid(24913)
lionsGetHolyWater:register()

-- Rock translation scroll
local lionsRockTranslationScroll = Action()

function lionsRockTranslationScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local setting = UniqueTable[item.uid]
	if not setting then
		return true
	end

	local amphoraPos = Position(setting.itemPos)
	local amphoraID = setting.itemId
	local amphoraBrokenID = setting.itemBrokenId

	local function reset()
		local brokenAmphora = Tile(amphoraPos):getItemById(amphoraBrokenID)
		if brokenAmphora then
			brokenAmphora:transform(amphoraID)
		end
	end

	if player:getStorageValue(setting.need) == setting.needCount then
		local amphora = Tile(amphoraPos):getItemById(amphoraID)
		if amphora then
			amphora:transform(amphoraBrokenID)
			player:sendTextMessage(
				MESSAGE_EVENT_ADVANCE,
				'As you pass incautiously, the ancient amphora crumbles to shards and dust. \z
				Amidst the debris you discover an old scroll.'
			)
			player:setStorageValue(setting.need, 5)
			player:addItem(setting.addItem, 1)
			toPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
			addEvent(reset, 15 * 1000)
		end
	end
	return true
end

lionsRockTranslationScroll:id(24314)
lionsRockTranslationScroll:register()

-- Lions rock fountain
local lionsRockFountain = Action()

function lionsRockFountain.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.LionsRock.Time) < os.time() then
		local reward = ''
		if (player:hasMount(40)) then
			repeat
				reward = math.random(1, #rewards)
			until (rewards[reward] ~= "lion's heart")
		else
			reward = math.random(1, #rewards)
		end

		if (player:getStorageValue(Storage.LionsRock.Progress) == 10) then
			player:setStorageValue(Storage.LionsRock.Progress, 11)
		end

		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			"Something sparkles in the fountain's water. You draw out a " .. rewards[reward] .. '.'
		)
		toPosition:sendMagicEffect(CONST_ME_HOLYAREA)
		player:addAchievement("Lion's Den Explorer")
		item:transform(lionsRockSanctuaryRockId)
		player:addItem(rewards[reward], 1)
		player:setStorageValue(Storage.LionsRock.Time, os.time() + 24 * 60 * 60)
	else
		player:sendTextMessage(
			MESSAGE_EVENT_ADVANCE,
			'At the moment there is neither a treasure nor anything else in the fountain. Perhaps you might return later.'
		)
	end
	return true
end

lionsRockFountain:id(6390)
lionsRockFountain:register()
