function onStepIn(creature, item, position, fromPosition)

    local player = creature:getPlayer()
    if player == nil then
        return true
    end

    if not lionrock.checkPlayerCanEnterMysticFlame(player) then
        if item.actionid == 41344 then
            player:teleportTo(fromPosition, true)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not able to pass in this teleport yet.")
        end
        return false
    end
    -- Mystic Flame.
    if item.actionid == 41344 then
        if player:getStorageValue(lionrock.storages.firstMysticEnter) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have passed the Lion's Tests and are now worthy to enter the inner sanctum!")
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            player:setStorageValue(lionrock.storages.firstMysticEnter, 1)
        end
        -- teleporting
        player:teleportTo({x = 33122, y = 32308, z = 8})
        return true
    end

    -- Player should have the scroll to do next things.
if player:getItemCount(lionrock.items.scroll) == 0 then
  return true
 end


    -- Translations
    if item.actionid == 41346 then -- 1
        if player:getStorageValue(lionrock.storages.translation1) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "With the aid of the old scroll you translate the inscriptions on the golden statue: And the mighty lion defeated the greedy hyaena." ..
                "As a sign of victory he took its blood, red as voracity and lust, and created a precious treasure.")
            player:setStorageValue(lionrock.storages.translation1, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end

    if item.actionid == 41347 then -- 2
        if player:getStorageValue(lionrock.storages.translation2) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "With the aid of the old scroll you translate the inscriptions on the floor: And the mighty lion defeated the lazy lizard." ..
                "As a sign of victory he took its egg, blue as sloth and conceit, and out of a foul creature he created a precious treasure.")
            player:setStorageValue(lionrock.storages.translation2, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end

    if item.actionid == 41348 then -- 3
        if player:getStorageValue(lionrock.storages.translation3) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "With the aid of the old scroll you translate the inscriptions on the floor: And the mighty lion defeated the jealous snake." ..
                "As a sign of victory he took its eye, yellow as envy and malevolence, and out of a foul creature he created a precious treasure.")
            player:setStorageValue(lionrock.storages.translation3, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end

    if item.actionid == 41349 then -- 4
        if player:getStorageValue(lionrock.storages.translation4) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "With the aid of the old scroll you translate the inscriptions on the golden altar: And the mighty lion defeated the treacherous." ..
                "scorpion. As a sign of victory he took its poison, violet as deceit and betrayal, and created a precious treasure.")
            player:setStorageValue(lionrock.storages.translation4, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end

    return true
end
