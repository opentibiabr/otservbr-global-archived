local GoldenOutfitStore = CreatureEvent("GoldenOutfitStore")

function GoldenOutfitStore.onLogin(player)
    if player:getStorageValue(Storage.OutfitQuest.GoldenOutfit) == 3 then
        return true
    end
    local outfit = player:hasOutfit(1211) or player:hasOutfit(1210)
    if outfit == true then
    local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
    if inbox and inbox:getEmptySlots() > 0 then
        local decoKit = inbox:addItem(26054, 1)
        local decoItemName = ItemType(36345):getName()
            decoKit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Unwrap it in your own house to create a " .. decoItemName .. ".")
            decoKit:setCustomAttribute("unWrapId", 36345)
            selfSay("Take this armor as a token of great gratitude. Let us forever remember this day, my friend!", cid)
            player:getPosition():sendMagicEffect(171)
            player:setStorageValue(Storage.OutfitQuest.GoldenOutfit, 3)
            else
            selfSay("Please make sure you have free slots in your store inbox.", cid)
        end
        return true
    end
end

GoldenOutfitStore:register()
