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
            [CONST_SLOT_RIGHT] = {23771, 1, true}, -- spellbook of the novice
			[11] = {8704, 2, true, limitStorage = 10030, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = 10031, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = 10032, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = 10033, limit = 1} -- 2 light stone shower runes
        },
        -- druid
        [2] = {
            [CONST_SLOT_LEFT] = {23721, 1, true}, -- the chiller
            [CONST_SLOT_RIGHT] = {23771, 1, true}, -- spellbook of the novice
			[11] = {8704, 2, true, limitStorage = 10034, limit = 1}, -- potion
			[12] = {7620, 10, true, limitStorage = 10035, limit = 1}, -- potion
			[13] = {23723, 2, true, limitStorage = 10036, limit = 1}, -- 2 lightest missile runes
			[14] = {23722, 2, true, limitStorage = 10037, limit = 1} -- 2 light stone shower runes
        },
        -- paladin
        [3] = {
            [CONST_SLOT_LEFT] = {2456, 1, true}, -- bow
            [CONST_SLOT_AMMO] = {23839, 100, true}, -- 100 arrows
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
	player:setVocation(toVocation) -- first set vocation, to add items
    for toVocation = 1, 4 do
        for slot, info in pairs(vocationsItems[toVocation]) do
            local itemCount = player:getItemCount(info[1])
            if itemCount > 0 and info[3] then
				if info[1] ~= 8704 and info[1] ~= 7620 and info[1] ~= 23723 and info[1] ~= 23722 then
                player:removeItem(info[1], itemCount)
				end
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
	
	local tutorials = {5, 6, 4, 3}
	player:sendTutorial(tutorials[toVocation])
	
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
		--recalculate cap hp and mana
		player:setMaxHealth(130 + (player:getVocation():getHealthGain() * player:getLevel()))
		player:addHealth(player:getMaxHealth())
		player:setMaxMana(0 + (player:getVocation():getManaGain() * player:getLevel()))
		player:addMana(player:getMaxMana())
		player:setCapacity(40000 + (player:getVocation():getCapacityGain() * player:getLevel()))
		
		msg = {'As a sorcerer, you can use the following spells: Magic Patch, Buzz, Scorch.',
		'As a druid, you can use these spells: Mud Attack, Chill Out, Magic Patch.',
		'As a paladin, you can use the following spells: Magic Patch, Arrow Call.',
		'As a knight, you can use the following spells: Bruise Bane.'}
		
		trialStorages = {Storage.Dawnport.Sorcerer, Storage.Dawnport.Druid, Storage.Dawnport.Paladin, Storage.Dawnport.Knight}		
				
		if player:getStorageValue(trialStorages[1]) == -1 and player:getStorageValue(trialStorages[2]) == -1 and player:getStorageValue(trialStorages[3]) == -1 and player:getStorageValue(trialStorages[4]) == -1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'As this is the first time you try out a vocation, the Guild has kitted you out. ' .. msg[toVocation])
		elseif player:getStorageValue(trialStorages[toVocation]) == -1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('As this is your first time as a %s' .. ', you received a few extra items. ' .. msg[toVocation], player:getVocation():getName()))
		elseif player:getStorageValue(trialStorages[toVocation]) > -1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('You have received the weapons of a %s' .. '. ' .. msg[toVocation], player:getVocation():getName()))
		end
		
		
		if fromVocation ~= 0 then
		player:setStorageValue(trialStorages[toVocation], 1)
			if toVocation == 1 or toVocation == 2 then -- sorc
				skills, limits = {1,2,3,4,5}, {0, 20}
			elseif toVocation == 3 then -- pala
				skills, limits = {1,2,3,5}, {7, 20}
			elseif toVocation == 4 then -- ek
				skills, limits = {4}, {3, 20}
			end
				
			for i= 1, #skills do
				if limits[1] > 0 and getPlayerMagLevel(player) > limits[1] or getPlayerSkill(player, skills[i]) > limits[2] then

			player:setStorageValue(trialStorages[toVocation], 1)
			if toVocation == 1 or toVocation == 2 then
				skills, limits = {1,2,3,4,5}, {nil, 20} --((/SORC e DRUID/skill ids de 1 a 5), (limite: nil ML, 20 MELEE))
			elseif toVocation == 3 then
				skills, limits = {1,2,3,5}, {5, 20} --((/PALA/checar skill ids 1, 2, 3 e 5. ignorar 4 distance), (limite: 5 ML, 20 MEELE))
			elseif toVocation == 4 then
				skills, limits = {4}, {3, 20} --((/EK/checar skill id 4 distance), (limite: 3 ML, 20 MELEE))
			end
				
			for i= 1, #skills do
				if limits[1] ~= nil and getPlayerMagLevel(player) > limits[1] or getPlayerSkill(player, skills[i]) > limits[2] then

					local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(player:getName():lower()))
					local accountId = result.getDataInt(resultId, "id")
					player:remove()
					db.query("UPDATE `players` SET `maglevel` = '0', `manaspent` = '0', `skill_fist` = '10', `skill_fist_tries` = '0', `skill_club` = '10', `skill_club_tries` = '0', `skill_sword` = '10', `skill_sword_tries` = '0', `skill_axe` = '10', `skill_axe_tries` = '0', `skill_dist` = '10', `skill_dist_tries` = '0', `skill_shielding` = '10', `skill_shielding_tries` = '0', `skill_fishing` = '10', `skill_fishing_tries` = '0' WHERE `players`.`id` = " .. accountId)

				end
			end
		

					return true
				end
			end

		end
end

local centerPosition = Position(32065, 31891, 5)

function onStepIn(creature, item, position, fromPosition)
    if creature:isPlayer() then
        local player = Player(creature)
        local toVocation = Tile(position):getGround():getActionId() - 20000
        local fromVocation = player:getVocation():getId()
		
		if player:getLevel() > 19 and (centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position)) then
			player:teleportTo(Position(fromPosition))
		elseif fromVocation ~= toVocation and (centerPosition:getDistance(fromPosition) < centerPosition:getDistance(position)) and player:getStorageValue(Storage.Dawnport.oressa) < 1 then
            getFirstItems(player)
			player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
			changeVocation(player, fromVocation, toVocation)
		end
    end
    return true
end
