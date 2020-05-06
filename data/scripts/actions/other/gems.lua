local gems = Action()

local lionsRockSanctuaryPos = Position(33073, 32300, 9)
local lionsRockSanctuaryRockId = 3608
local lionsRockSanctuaryFountainId = 6390

local iceFeyristStart = {x = 32194, y = 31418, z = 2} -- top left corner
local icePaymentItem = 2146 -- small emerald
local icePositionAfterEnchantment = Position(33430, 32278, 7)

local fireFeyristStart = {x = 32910, y = 32338, z = 15} -- top left corner
local firePaymentItem = 2147 -- small ruby
local firePositionAfterEnchantment = Position(33586, 32263, 7)

local earthFeyristStart = {x = 32973, y = 32225, z = 7} -- top left corner
local earthPaymentItem = 2149 -- small saphire
local earthPositionAfterEnchantment = Position(33539, 32209, 7)

local energyFeyristStart = {x = 33060, y = 32713, z = 5} -- top left corner
local energyPaymentItem = 2150 -- small amethyst
local energyPositionAfterEnchantment = Position(33527, 32301, 4)

function gems.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then
        return
    end

    local setting = UniqueTable[target.uid]
    if not setting then
        if (icePaymentItem == item.itemid) then
            if
                player:getItemCount(icePaymentItem) >= 1 and toPosition.x == iceFeyristStart.x or
                    toPosition.x == (iceFeyristStart.x + 1) and toPosition.y == iceFeyristStart.y or
                    toPosition.y == (iceFeyristStart.y + 1) and toPosition.z == iceFeyristStart.z
             then
                player:removeItem(icePaymentItem, 1)
                player:teleportTo(icePositionAfterEnchantment)
                player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
                return true
            end
        elseif (firePaymentItem == item.itemid) then
            if
                player:getItemCount(firePaymentItem) >= 1 and toPosition.x == fireFeyristStart.x or
                    toPosition.x == (fireFeyristStart.x + 1) and toPosition.y == fireFeyristStart.y or
                    toPosition.y == (fireFeyristStart.y + 1) and toPosition.z == fireFeyristStart.z
             then
                player:removeItem(firePaymentItem, 1)
                player:teleportTo(firePositionAfterEnchantment)
                player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
                return true
            end

            if player:getItemCount(firePaymentItem) >= 1 and target.itemid == 2342 then
                target:transform(2343)
                target:decay()
                item:remove(1)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
                toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
                return true
            end
        elseif (earthPaymentItem == item.itemid) then
            if
                player:getItemCount(earthPaymentItem) >= 1 and toPosition.x == earthFeyristStart.x or
                    toPosition.x == (earthFeyristStart.x + 1) and toPosition.y == earthFeyristStart.y or
                    toPosition.y == (earthFeyristStart.y + 1) and toPosition.z == earthFeyristStart.z
             then
                player:removeItem(earthPaymentItem, 1)
                player:teleportTo(earthPositionAfterEnchantment)
                player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
                return true
            end
        elseif (energyPaymentItem == item.itemid) then
            if
                player:getItemCount(energyPaymentItem) >= 1 and toPosition.x == energyFeyristStart.x or
                    toPosition.x == (energyFeyristStart.x + 1) and toPosition.y == energyFeyristStart.y or
                    toPosition.y == (energyFeyristStart.y + 1) and toPosition.z == energyFeyristStart.z
             then
                player:removeItem(energyPaymentItem, 1)
                player:teleportTo(energyPositionAfterEnchantment)
                player:getPosition():sendMagicEffect(CONST_ME_SMALLPLANTS)
                return true
            end
        end
        return true
    end

    local function lionsRockFieldReset()
        local gemSpot = Tile(setting.itemPos):getItemById(setting.fieldId)
        if gemSpot then
            Game.setStorageValue(GlobalStorage.lionsRockFields, Game.getStorageValue(GlobalStorage.lionsRockFields) - 1)
            gemSpot:remove()
        end
    end

    local function checkLionsRockFields(storage)
        if Game.getStorageValue(GlobalStorage.lionsRockFields) == 3 then
            local stone = Tile(lionsRockSanctuaryPos):getItemById(lionsRockSanctuaryRockId)
            if stone then
                stone:transform(lionsRockSanctuaryFountainId)
                lionsRockSanctuaryPos:sendMagicEffect(CONST_ME_THUNDER)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Something happens at the center of the room ...')
                player:setStorageValue(storage, 10)
            end
        end
    end

    local function lionsRockCreateField(itemPos, fieldId, storage)
        local gemSpot = Tile(itemPos):getItemById(fieldId)
        if not gemSpot then
            Game.createItem(fieldId, 1, itemPos)
            Game.setStorageValue(GlobalStorage.lionsRockFields, Game.getStorageValue(GlobalStorage.lionsRockFields) + 1)
            checkLionsRockFields(storage)
        end
    end
    if player:getStorageValue(setting.need) >= setting.needCount then
        if setting.needItem == item.itemid then
            local gemSpot = Tile(setting.itemPos):getItemById(setting.fieldId)
            if not gemSpot then
                toPosition:sendMagicEffect(setting.effect)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, setting.message)
                addEvent(lionsRockCreateField, 2 * 1000, setting.itemPos, setting.fieldId, setting.need)
                addEvent(lionsRockFieldReset, 60 * 1000)
            end
        end
    end

    return true
end

for value = 2146, 2150 do
    gems:id(value)
end
gems:id(9970)
gems:register()
