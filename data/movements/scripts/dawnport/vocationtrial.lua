local function givePlayerItem(player, item, slot)
	local ret = player:addItemEx(item, false, sot)
	if not ret then
		player:addItemEx(item, false, INDEX_WHEREEVER, 0)
	end
end

local function getFirstItems(player)
	local firstItems = {
		storage = 4687,

		slots = {
			[CONST_SLOT_HEAD] = Game.createItem(2461),
			[CONST_SLOT_ARMOR] = Game.createItem(2651),
			[CONST_SLOT_LEGS] = Game.createItem(2649),
			[CONST_SLOT_FEET] = Game.createItem(2643)
			--[CONST_SLOT_BACKPACK] = Game.createItem(1988)
		}
	}

	--[[ add backpack items here
	local backpack = firstItems.slots[CONST_SLOT_BACKPACK]
	backpack:addItem(ITEM_GOLD_COIN, 25)]]

	if player:getStorageValue(firstItems.storage) < 0 then
		for slot, item in pairs(firstItems.slots) do
			givePlayerItem(player, item, slot)
		end
		player:setStorageValue(firstItems.storage, 1)
	end
end

local function changeVocation(player, fromVocation, toVocation)
    local vocationsItems = {
		-- sorcerer
        [1] = {
            [CONST_SLOT_LEFT] = {23719, 1, true}, -- the scorcher
            [CONST_SLOT_RIGHT] = {2175, 1, true}, -- spellbook
			[11] = {8704, 2, true, limitStorage = 10030, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = 10031, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = 10032, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = 10033, limit = 1} -- 2 light stone shower runes
        },
        -- druid
        [2] = {
            [CONST_SLOT_LEFT] = {23721, 1, true}, -- the chiller
            [CONST_SLOT_RIGHT] = {2175, 1, true}, -- spellbook
			[11] = {8704, 2, true, limitStorage = 10034, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = 10035, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = 10036, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = 10037, limit = 1} -- 2 light stone shower runes
        },
        -- paladin
        [3] = {
            [CONST_SLOT_LEFT] = {2456, 1, true}, -- bow
            [CONST_SLOT_AMMO] = {23839, 50, true}, -- 100 arrows
            [11] = {8704, 7, true, limitStorage = 10038, limit = 1}, -- potion
			[12] = {7620, 5, true, limitStorage = 10039, limit = 1}, -- potion
			[13] = {23723, 1, true, limitStorage = 10040, limit = 1}, -- 1 lightest missile rune
			[14] = {23722, 1, true, limitStorage = 10041, limit = 1} -- 1 light stone shower rune
        },
        -- knight
        [4] = {
            [CONST_SLOT_LEFT] = {2379, 1, true}, -- dagger
            [CONST_SLOT_RIGHT] = {2512, 1, true}, -- wooden shield
			[11] = {8704, 10, true, limitStorage = 10042, limit = 1}, -- potion
			[12] = {7620, 2, true, limitStorage = 10043, limit = 1}, -- potion
			[13] = {23723, 1, true, limitStorage = 10044, limit = 1}, -- 1 lightest missile rune
			[14] = {23722, 1, true, limitStorage = 10045, limit = 1} -- 1 light stone shower rune
        }
    }
 
    local vocationsOutfits = {
       	-- sorcerer
        [1] = {
            lookBody = 109,
            lookAddons = 0,
            lookTypeName = {Mage}, -- {male, female}
            lookTypeEx = 130,
			lookTypeFm = 138,
            lookHead = 95,
            lookMount = 0,
            lookLegs = 112,
            lookFeet = 128
        },
        -- druid
        [2] = {
            lookBody = 123,
            lookAddons = 0,
            lookTypeName = {Mage}, -- {male, female}
            lookTypeEx = 130,
			lookTypeFm = 138,
            lookHead = 95,
            lookMount = 0,
            lookLegs = 9,
            lookFeet = 118
        },
        -- paladin
        [3] = {
            lookBody = 117,
            lookAddons = 0,
            lookTypeName = {Hunter}, -- {male, female}
            lookTypeEx = 129,
			lookTypeFm = 137,
            lookHead = 95,
            lookMount = 0,
            lookLegs = 98,
            lookFeet = 78
        },
        -- knight
        [4] = {
            lookBody = 38,
            lookAddons = 0,
            lookTypeName = {Knight}, -- {male, female}
            lookTypeEx = 131,
			lookTypeFm = 139,
            lookHead = 95,
            lookMount = 0,
            lookLegs = 94,
            lookFeet = 115,
        }
    }
 
    for toVocation = 1, 4 do
        for slot, info in pairs(vocationsItems[toVocation]) do
            local itemCount = player:getItemCount(info[1])
            if itemCount > 0 and info[3] then
                player:removeItem(info[1], itemCount)
            end
        end
    end
 
    local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
    for slot, info in pairs(vocationsItems[toVocation]) do
        local extra
        if slot > CONST_SLOT_AMMO then
            extra = true
        else
            local equipped = player:getSlotItem(slot)
            if equipped then
                equipped:moveTo(backpack)
            end
        end
 
        local giveItem = true
        if info.limit and info.limitStorage then
            local given = math.max(player:getStorageValue(info.limitStorage), 0)
            if given >= info.limit then
                giveItem = false
            else
                player:setStorageValue(info.limitStorage, given + 1)
            end
        end
 
        if giveItem then
            if extra then
                player:addItemEx(Game.createItem(info[1], info[2]), false, INDEX_WHEREEVER, 0)
            else
                local ret = player:addItem(info[1], info[2], false, 1, slot)
                if not ret then
                    player:addItemEx(Game.createItem(info[1], info[2]), false, slot)
                end
            end
        end
    end
 
   local outfit = vocationsOutfits[toVocation]
    if toVocation ~= 0 then	
	if player:getSex() == PLAYERSEX_MALE then
		player:setOutfit(
        {
            lookBody = outfit.lookBody,
            lookAddons = outfit.lookAddons,
            lookTypeName = outfit.lookTypeName,
            lookType = outfit.lookTypeEx,
            lookHead = outfit.lookHead,
            lookMount = outfit.lookMount,
            lookLegs = outfit.lookLegs,
            lookFeet = outfit.lookFeet,
        }
		)
		else
		player:setOutfit(
        {
            lookBody = outfit.lookBody,
            lookAddons = outfit.lookAddons,
            lookTypeName = outfit.lookTypeName,
            lookType = outfit.lookTypeFm,
            lookHead = outfit.lookHead,
            lookMount = outfit.lookMount,
            lookLegs = outfit.lookLegs,
            lookFeet = outfit.lookFeet,
        }
		)
		end
		end
		
		--
		-- done
		local position = player:getPosition()
		position:getNextPosition(player:getDirection())
		player:teleportTo(position)
		player:setVocation(toVocation)
		--recalculate cap hp and mana
		--
		player:setMaxHealth(130 + (player:getVocation():getHealthGain() * player:getLevel()))
		player:addHealth(player:getMaxHealth())
		player:setMaxMana(0 + (player:getVocation():getManaGain() * player:getLevel()))
		player:addMana(player:getMaxMana())
		player:setCapacity(40000 + (player:getVocation():getCapacityGain() * player:getLevel()))
		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('Congratulations! Now you are %s.', player:getVocation():getName()))
		
		if fromVocation ~= 0 then
		local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(player:getName():lower()))
		local accountId = result.getDataInt(resultId, "id")
		player:remove()
		db.query("UPDATE `players` SET `maglevel` = '0', `manaspent` = '0', `skill_fist` = '10', `skill_fist_tries` = '0', `skill_club` = '10', `skill_club_tries` = '0', `skill_sword` = '10', `skill_sword_tries` = '0', `skill_axe` = '10', `skill_axe_tries` = '0', `skill_dist` = '10', `skill_dist_tries` = '0', `skill_shielding` = '10', `skill_shielding_tries` = '0', `skill_fishing` = '10', `skill_fishing_tries` = '0' WHERE `players`.`id` = " .. accountId)
		end
end

local centerPosition = Position(32065, 31891, 5)

function onStepIn(creature, item, position, fromPosition)
    if creature:isPlayer() then
        local player = Player(creature)
        local toVocation = Tile(position):getGround():getActionId() - 20000
        local fromVocation = player:getVocation():getId()
        if fromVocation ~= toVocation and (centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position)) then
            getFirstItems(player)
			player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
			changeVocation(player, fromVocation, toVocation)
		end
		
    end
    return true
end
