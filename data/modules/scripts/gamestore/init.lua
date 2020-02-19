-- Please don't edit those information!
GameStore = {
  ModuleName = "GameStore",
  Developers = { "Slavi Dodo", "Cjaker", "metabob" },
  Version = "0.4",
  LastUpdated = "15-04-2019 17:40PM"
}

--== Enums ==--
GameStore.OfferTypes = {
  OFFER_TYPE_NONE = 0, -- (this will disable offer)
  OFFER_TYPE_ITEM = 1,
  OFFER_TYPE_STACKABLE = 2,
  OFFER_TYPE_OUTFIT = 3,
  OFFER_TYPE_OUTFIT_ADDON = 4,
  OFFER_TYPE_MOUNT = 5,
  OFFER_TYPE_NAMECHANGE = 6,
  OFFER_TYPE_SEXCHANGE = 7,
  OFFER_TYPE_PROMOTION = 8,
  OFFER_TYPE_HOUSE = 9,
  OFFER_TYPE_EXPBOOST = 10,
  OFFER_TYPE_PREYSLOT = 11,
  OFFER_TYPE_PREYBONUS = 12,
  OFFER_TYPE_TEMPLE = 13,
  OFFER_TYPE_BLESSINGS = 14,
  OFFER_TYPE_PREMIUM = 15,
  OFFER_TYPE_POUCH = 16,
  OFFER_TYPE_ALLBLESSINGS = 17
}

GameStore.ClientOfferTypes = {
  CLIENT_STORE_OFFER_OTHER = 0,
  CLIENT_STORE_OFFER_NAMECHANGE = 1
}

GameStore.HistoryTypes = {
  HISTORY_TYPE_NONE = 0,
  HISTORY_TYPE_GIFT = 1,
  HISTORY_TYPE_REFUND = 2
}

GameStore.States = {
  STATE_NONE = 0,
  STATE_NEW = 1,
  STATE_SALE = 2,
  STATE_TIMED = 3
}

GameStore.StoreErrors = {
  STORE_ERROR_PURCHASE = 0,
  STORE_ERROR_NETWORK = 1,
  STORE_ERROR_HISTORY = 2,
  STORE_ERROR_TRANSFER = 3,
  STORE_ERROR_INFORMATION = 4
}

GameStore.ServiceTypes = {
  SERVICE_STANDERD = 0,
  SERVICE_OUTFITS = 3,
  SERVICE_MOUNTS = 4,
  SERVICE_BLESSINGS = 5
}

GameStore.SendingPackets = {
  S_CoinBalance = 0xDF, -- 223
  S_StoreError = 0xE0, -- 224
  S_RequestPurchaseData = 0xE1, -- 225
  S_CoinBalanceUpdating = 0xF2, -- 242
  S_OpenStore = 0xFB, -- 251
  S_StoreOffers = 0xFC, -- 252
  S_OpenTransactionHistory = 0xFD, -- 253
  S_CompletePurchase = 0xFE  -- 254
}

GameStore.RecivedPackets = {
  C_StoreEvent = 0xE9, -- 233
  C_TransferCoins = 0xEF, -- 239
  C_OpenStore = 0xFA, -- 250
  C_StoreSelectOffer = 0xE8, -- 232
  C_RequestStoreOffers = 0xFB, -- 251
  C_StoreSelectOffer = 0xE8, -- 232
  C_BuyStoreOffer = 0xFC, -- 252
  C_OpenTransactionHistory = 0xFD, -- 253
  C_RequestTransactionHistory = 0xFE, -- 254
}

GameStore.ExpBoostValues = {
  [1] = 30,
  [2] = 45,
  [3] = 90,
  [4] = 180,
  [5] = 360
}

GameStore.DefaultValues = {
  DEFAULT_VALUE_ENTRIES_PER_PAGE = 26
}

GameStore.DefaultDescriptions = {
  OUTFIT      = { "This outfit looks nice. Only high-class people are able to wear it!",
             "An outfit that was created to suit you. We are sure you'll like it.",
             "Legend says only smart people should wear it, otherwise you will burn!" },
  MOUNT       = { "This is a fantastic mount that helps to become faster, try it!",
            "The first rider of this mount became the leader of his country! legends say that." },
  NAMECHANGE  = { "Are you hunted? Tired of that? Get a new name, a new life!",
                 "A new name to suit your needs!" },
  SEXCHANGE   = { "Bored of your character's sex? Get a new sex for him now!!" },
  EXPBOOST    = { "Are you tired of leveling slow? try it!" },
  PREYSLOT    = { "It's hunting season! Activate a prey to gain a bonus when hunting a certain monster. Every character can purchase one Permanent Prey Slot, which enables the activation of an additional prey. \nIf you activate a prey, you can select one monster out of nine. The bonus for your prey will be selected randomly from one of the following: damage boost, damage reduction, bonus XP, improved loot. The bonus value may range from 5% to 50%. Your prey will be active for 2 hours hunting time: the duration of an active prey will only be reduced while you are hunting." },
  PREYBONUS   = { "You activated a prey but do not like the randomly selected bonus? Roll for a new one! Here you can purchase five Prey Bonus Rerolls! \nA Bonus Reroll allows you to get a bonus with a higher value (max. 50%). The bonus for your prey will be selected randomly from one of the following: damage boost, damage reduction, bonus XP, improved loot. The 2 hours hunting time will start anew once you have rolled for a new bonus. Your prey monster will stay the same." },
  TEMPLE      = { "Need a quick way home? Buy this transportation service to get instantly teleported to your home temple. \n\nNote, you cannot use this service while having a battle sign or a protection zone block. Further, the service will not work in no-logout zones or close to your home temple." }
}

--==Parsing==--
GameStore.isItsPacket = function(byte)
  for k, v in pairs(GameStore.RecivedPackets) do
    if v == byte then
      return true
    end
  end
  return false
end

local function queueSendStoreAlertToUser(message, delay, playerId, storeErrorCode)
  storeErrorCode = storeErrorCode and storeErrorCode or  GameStore.StoreErrors.STORE_ERROR_NETWORK
  addPlayerEvent(sendStoreError, delay, playerId, storeErrorCode, message)
end

function onRecvbyte(player, msg, byte)
  if not configManager.getBoolean(STOREMODULES) then return true end
  if player:getVocation():getId() == 0 and not GameStore.haveCategoryRook() then
    return player:sendCancelMessage("Store don't have offers for rookgaard citizen.")
  end

  if byte == GameStore.RecivedPackets.C_StoreEvent then
    -- Not Used!
  elseif byte == GameStore.RecivedPackets.C_TransferCoins then
    parseTransferCoins(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_OpenStore then
    parseOpenStore(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_RequestStoreOffers then
    parseRequestStoreOffers(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_StoreSelectOffer then
    parseSendDescription(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_BuyStoreOffer then
    parseBuyStoreOffer(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_OpenTransactionHistory then
    parseOpenTransactionHistory(player:getId(), msg)
  elseif byte == GameStore.RecivedPackets.C_RequestTransactionHistory then
    parseRequestTransactionHistory(player:getId(), msg)
  end
  return true
end

function parseSendDescription(playerId, msg)
  local player = Player(playerId)
  if not player then
    return false
  end
  if player:getClient().version < 1180 then
    return false
  end
  local offerId = msg:getU32()
  if offerId then
    addPlayerEvent(sendShowDescription, 350, playerId, offerId)
  end
end

function parseTransferCoins(playerId, msg)
  local player = Player(playerId)
  if not player then
    return false
  end

  local reciver = msg:getString()
  local amount = msg:getU32()

  if (player:getCoinsBalance() < amount) then
    return addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_TRANSFER, "You don't have this amount of coins.")
  end

  if reciver:lower() == player:getName():lower() then
    return addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_TRANSFER, "You can't transfer coins to yourself.")
  end

  local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(reciver:lower()) .. "")
  if not resultId then
    return addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_TRANSFER, "We couldn't find that player.")
  end

  local accountId = result.getDataInt(resultId, "account_id")
  if accountId == player:getAccountId() then
    return addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_TRANSFER, "You cannot transfer coin to a character in the same account.")
  end

  db.query("UPDATE `accounts` SET `coins` = `coins` + " .. amount .. " WHERE `id` = " .. accountId)
  player:removeCoinsBalance(amount)
  addPlayerEvent(sendStorePurchaseSuccessful, 550, playerId, "You have transfered " .. amount .. " coins to " .. reciver .. " successfully")

  -- Adding history for both reciver/sender
  GameStore.insertHistory(accountId, GameStore.HistoryTypes.HISTORY_TYPE_NONE, player:getName() .. " transfered you this amount.", amount)
  GameStore.insertHistory(player:getAccountId(), GameStore.HistoryTypes.HISTORY_TYPE_NONE, "You transfered this amount to " .. reciver, -1 * amount) -- negative
end

function sendShowDescription(playerId, offerId)
  local player = Player(playerId)
  if not player then
    return false
  end
  local offer = GameStore.getOfferById(offerId)
  local msg = NetworkMessage()
  msg:addByte(0xea)
  msg:addU32(offerId)
  msg:addString(offer.description or "No description to be displayed")
  msg:sendToPlayer(player)
end

function parseOpenStore(playerId, msg)
  openStore(playerId)

  local serviceType = msg:getByte()
  local category = GameStore.Categories and GameStore.Categories[1] or nil

  local servicesName = {
    [GameStore.ServiceTypes.SERVICE_OUTFITS] = "outfits",
    [GameStore.ServiceTypes.SERVICE_MOUNTS] = "mounts",
    [GameStore.ServiceTypes.SERVICE_BLESSINGS] = "blessings"
  }

  if servicesName[serviceType] then
    category = GameStore.getCategoryByName(servicesName[serviceType])
  end

  if category then
    addPlayerEvent(sendShowStoreOffers, 350, playerId, category)
  end
end

function parseRequestStoreOffers(playerId, msg)
  local player = Player(playerId)
  if not player then
    return false
  end

  local serviceType = GameStore.ServiceTypes.SERVICE_STANDERD
  if player:getClient().version >= 1092 then
    serviceType = msg:getByte()
  end

  local categoryName = msg:getString()

  local category = GameStore.getCategoryByName(categoryName)
  if category then
    addPlayerEvent(sendShowStoreOffers, 350, playerId, category)
  end
end

function parseBuyStoreOffer(playerId, msg)
  local player = Player(playerId)
  local id = msg:getU32()
  local offer = GameStore.getOfferById(id)
  local productType = msg:getByte()

  -- All guarding conditions under which the offer should not be processed must be included here
  if (table.contains(GameStore.OfferTypes, offer.type) == false)                      -- we've got an invalid offer type
      or (not player)                                                                 -- player not found
      or (player:getVocation():getId() == 0) and (not GameStore.haveOfferRook(id))    -- we don't have such offer
      or (not offer)                                                                  -- we could not find the offer
      or (offer.type == GameStore.OfferTypes.OFFER_TYPE_NONE)                         -- offer is disabled
      or (offer.type ~= GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_EXPBOOST and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_PREYBONUS and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_PREYSLOT and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_TEMPLE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_POUCH and
          not offer.id) then
    return queueSendStoreAlertToUser("This offer is unavailable [1]", 350, playerId, GameStore.StoreErrors.STORE_ERROR_INFORMATION)
  end

  -- At this point the purchase is assumed to be formatted correctly
  local offerPrice = offer.type == GameStore.OfferTypes.OFFER_TYPE_EXPBOOST and GameStore.ExpBoostValues[player:getStorageValue(51052)] or offer.price

  if not player:canRemoveCoins(offerPrice) then
    return queueSendStoreAlertToUser("You don't have enough coins. Your purchase has been cancelled.", 250, playerId)
  end

  -- Use pcall to catch unhandled errors and send an alert to the user because the client expects it at all times; (OTClient will unlock UI)
  -- Handled errors are thrown to indicate that the purchase has failed;
  -- Handled errors have a code index and unhandled errors do not
  local pcallOk, pcallError = pcall(function()
    if offer.type == GameStore.OfferTypes.OFFER_TYPE_ITEM                 then GameStore.processItemPurchase(player, offer.id, offer.count)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_POUCH          then GameStore.processItemPurchase(player, offer.id, offer.count)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_BLESSINGS      then GameStore.processSignleBlessingPurchase(player, offer.id)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_ALLBLESSINGS   then GameStore.processAllBlessingsPurchase(player)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PREMIUM        then GameStore.processPremiumPurchase(player, offer.id)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_STACKABLE      then GameStore.processStackablePurchase(player, offer.id, offer.count, offer.name, offer.number)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_HOUSE          then GameStore.processHouseRelatedPurchase(player, offer.id, offer.count)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT         then GameStore.processOutfitPurchase(player, offer.sexId, offer.addon)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON   then GameStore.processOutfitPurchase(player, offer.sexId, offer.addon)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_MOUNT          then GameStore.processMountPurchase(player, offer.id)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE     then local newName = msg:getString(); GameStore.processNameChangePurchase(player, offer, productType, newName)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE      then GameStore.processSexChangePurchase(player)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_EXPBOOST       then GameStore.processExpBoostPuchase(player)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PREYSLOT       then GameStore.processPreySlotPurchase(player)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PREYBONUS      then GameStore.processPreyBonusReroll(player, offer.count)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_TEMPLE         then GameStore.processTempleTeleportPurchase(player)
      elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PROMOTION      then GameStore.processPromotionPurchase(player, offer.id)
    else
      -- This should never happen by our convention, but just in case the guarding condition is messed up...
      error({code = 0, message = "This offer is unavailable [2]"})
    end
  end)

  if not pcallOk then
    local alertMessage = pcallError.code and pcallError.message or "Something went wrong. Your purchase has been cancelled."

    if not pcallError.code then -- unhandled error
      -- log some debugging info
      print(string.format("Gamestore: Purchase failed due to an unhandled script error. \n\tStacktrace: %s\n", pcallError))
    end

    return queueSendStoreAlertToUser(alertMessage, 500, playerId)
  end

  if offer.type == GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE then
    return
  end

  player:removeCoinsBalance(offerPrice)
  GameStore.insertHistory(player:getAccountId(), GameStore.HistoryTypes.HISTORY_TYPE_NONE, offer.name, (offerPrice) * -1)

  local message = string.format("You have purchased %s for %d coins.", offer.name, offerPrice)
  return addPlayerEvent(sendStorePurchaseSuccessful, 650, playerId, message)
end

-- Both functions use same formula!
function parseOpenTransactionHistory(playerId, msg)
  local page = 1
  GameStore.DefaultValues.DEFAULT_VALUE_ENTRIES_PER_PAGE = msg:getByte()
  sendStoreTransactionHistory(playerId, page, GameStore.DefaultValues.DEFAULT_VALUE_ENTRIES_PER_PAGE)
end

function parseRequestTransactionHistory(playerId, msg)
  local page = msg:getU32()
  sendStoreTransactionHistory(playerId, page + 1, GameStore.DefaultValues.DEFAULT_VALUE_ENTRIES_PER_PAGE)
end

local function getCategoriesRook()
  local tmpTable, count = {}, 0
  for i, v in pairs(GameStore.Categories) do
    if (v.rookgaard) then
      tmpTable[#tmpTable + 1] = v
      count = count + 1
    end
  end

  return tmpTable, count
end

--==Sending==--
function openStore(playerId)
  local player = Player(playerId)
  if not player then
    return false
  end

  if not GameStore.Categories then
    return false
  end
  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_OpenStore)
  if player:getClient().version < 1180 then
    msg:addByte(0x00)
  end

  local GameStoreCategories, GameStoreCount = nil, 0
  if (player:getVocation():getId() == 0) then
    GameStoreCategories, GameStoreCount = getCategoriesRook()
  else
    GameStoreCategories, GameStoreCount = GameStore.Categories, #GameStore.Categories
  end

  if (GameStoreCategories) then
    msg:addU16(GameStoreCount)
    for k, category in ipairs(GameStoreCategories) do
      msg:addString(category.name)
      if player:getClient().version < 1180 then
        msg:addString(category.description)
      end

      if player:getClient().version >= 1093 then
        msg:addByte(category.state or GameStore.States.STATE_NONE)
      end

      msg:addByte(#category.icons)
      for m, icon in ipairs(category.icons) do
        msg:addString(icon)
      end

      msg:addString(category.parentCategory)
    end
    msg:sendToPlayer(player)

    sendCoinBalanceUpdating(playerId, true)
  end
end

function sendShowDescription(playerId, offerId)
  local player = Player(playerId)
  if not player then
    return false
  end
  local offer = GameStore.getOfferById(offerId)
  local msg = NetworkMessage()
  msg:addByte(0xea)
  msg:addU32(offerId)
  msg:addString(offer.description or "No description to be displayed")
  msg:sendToPlayer(player)
end

function sendShowStoreOffers(playerId, category)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  local haveSaleOffer = 0
  msg:addByte(GameStore.SendingPackets.S_StoreOffers)

  msg:addString(category.name)
  if player:getClient().version >= 1180 then
    msg:addU32(0)
    if player:getClient().version >= 1185 then
        msg:addU32(0)
    else
        msg:addU16(0)
    end
  end
  msg:addU16(category.offers and #category.offers or 0x00)

  if category.offers then
    for k, offer in ipairs(category.offers) do
        local name = ""
        if offer.type == GameStore.OfferTypes.OFFER_TYPE_ITEM and offer.count then
            name = offer.count .. "x "
        end
    
        if offer.type == GameStore.OfferTypes.OFFER_TYPE_STACKABLE and offer.count then
            name = offer.number .. "x "
        end
    
        name = name .. (offer.name or "Something Special")

        local newPrice = nil
        local offerPrice = 0
        if (offer.state == GameStore.States.STATE_SALE) then
            local daySub = offer.validUntil - os.date("*t").day
            if (daySub < 0) then
            newPrice = offer.basePrice
            end
        end

        xpBoostPrice = nil
        if offer.type == GameStore.OfferTypes.OFFER_TYPE_EXPBOOST then
            xpBoostPrice = GameStore.ExpBoostValues[player:getStorageValue(51052)]
        end

        if xpBoostPrice then
            offerPrice = xpBoostPrice
        else
            offerPrice = newPrice or offer.price or 0xFFFF
        end

        local disabled, disabledReason = 0, ""
      if offer.disabled == true or not offer.type then
        disabled = 1
      end

      if offer.type ~= GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_EXPBOOST and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_PREYSLOT and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_PREYBONUS and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_TEMPLE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE and
          offer.type ~= GameStore.OfferTypes.OFFER_TYPE_POUCH and
          not offer.id then
        disabled = 1
      end

      if disabled == 1 and offer.disabledReason then
        -- dynamic disable
        disabledReason = offer.disabledReason
      end

      if disabled ~= 1 then
        if offer.type == GameStore.OfferTypes.OFFER_TYPE_POUCH then
          local pouch = player:getItemById(26377, true)
          if pouch then
            disabled = 1
            disabledReason = "You already have Gold Pouch."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_BLESSINGS then
          if player:hasBlessing(offer.id) and offer.id < 9 then
            disabled = 1
            disabledReason = "You already have this Bless."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_ALLBLESSINGS then
          if player:hasBlessing(1) and player:hasBlessing(2) and player:hasBlessing(3) and player:hasBlessing(4) and player:hasBlessing(5) and player:hasBlessing(6) and player:hasBlessing(7) and player:hasBlessing(8) then
            disabled = 1
            disabledReason = "You already have all Blessings."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT or offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON then
          local outfitLookType
          if player:getSex() == PLAYERSEX_MALE then
            outfitLookType = offer.sexId.male
          else
            outfitLookType = offer.sexId.female
          end

          if outfitLookType then
            if offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT and player:hasOutfit(outfitLookType) then
              disabled = 1
              disabledReason = "You already have this outfit."
            elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON then
              if player:hasOutfit(outfitLookType) then
                if player:hasOutfit(outfitLookType, offer.addon) then
                  disabled = 1
                  disabledReason = "You already have this addon."
                end
              else
                disabled = 1
                disabledReason = "You don't have the outfit, you can't buy the addon."
              end
            end
          else
            disabled = 1
            disabledReason = "The offer is fake."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_MOUNT then
          local hasMount = player:hasMount(offer.id)
          if hasMount == true then
            disabled = 1
            disabledReason = "You already have this mount."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PROMOTION then
          if GameStore.canAddPromotionToPlayer(playerId, offer.id).ability == false then
            disabled = 1
            disabledReason = "You can't get this promotion"
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_PREYSLOT then
          local unlockedColumns = player:getStorageValue(STORE_SLOT_STORAGE)
          if (unlockedColumns == 1) then
            disabled = 1
            disabledReason = "You already have 3 slots released."
          end
        elseif offer.type == GameStore.OfferTypes.OFFER_TYPE_EXPBOOST then
          if (player:getStorageValue(51052) == 6 and (os.time() - player:getStorageValue(51053)) < 86400) then
            disabled = 1
            disabledReason = "You can't buy XP Boost for today."
          end
        end
      end

        if player:getClient().version >= 1180 then
            msg:addString(name);
			msg:addByte(0x01);
			msg:addU32(offer.id and offer.id or 0xFFFF);
			msg:addU16(1);
            msg:addU32(offerPrice);

            msg:addByte(0x00);
  
            msg:addByte(disabled)
            if disabled == 1 and player:getClient().version >= 1093 then
                msg:addByte(0x01);
                msg:addString(disabledReason)
            end

            if (offer.state) then
                if (offer.state == GameStore.States.STATE_SALE) then
                  local daySub = offer.validUntil - os.date("*t").day
                  if (daySub >= 0) then
                    msg:addByte(offer.state)
                    msg:addU32(os.time() + daySub * 86400)
                    msg:addU32(offer.basePrice)
                    haveSaleOffer = 1
                  else
                    msg:addByte(GameStore.States.STATE_NONE)
                  end
                else
                  msg:addByte(offer.state)
                end
              else
                msg:addByte(GameStore.States.STATE_NONE)
              end
            msg:addByte(0x00);

            msg:addString(offer.icons[1])
            
            msg:addU16(0);
			msg:addU16(0x01);
			msg:addU16(0x0182);
			msg:addU16(0);
			msg:addU16(0);
			msg:addByte(0x00);
        else
            msg:addU32(offer.id and offer.id or 0xFFFF) -- offerid
            msg:addString(name)
            msg:addString(offer.description or GameStore.getDefaultDescription(offer.type))
            msg:addU32(offerPrice)

            if (offer.state) then
                if (offer.state == GameStore.States.STATE_SALE) then
                  local daySub = offer.validUntil - os.date("*t").day
                  if (daySub >= 0) then
                    msg:addByte(offer.state)
                    msg:addU32(os.time() + daySub * 86400)
                    msg:addU32(offer.basePrice)
                    haveSaleOffer = 1
                  else
                    msg:addByte(GameStore.States.STATE_NONE)
                  end
                else
                  msg:addByte(offer.state)
                end
              else
                msg:addByte(GameStore.States.STATE_NONE)
              end

              if table.contains({ CLIENTOS_OTCLIENT_LINUX, CLIENTOS_OTCLIENT_WINDOWS, CLIENTOS_OTCLIENT_MAC }, player:getClient().os) then
                if disabled == 1 then
                  msg:addByte(0) -- offer type 0 means disabled
                else
                  msg:addByte(offer.type)
                end
              else
                -- supporting the old way
                msg:addByte(disabled)
              end
              if disabled == 1 and player:getClient().version >= 1093 then
                msg:addString(disabledReason)
              end
        
              msg:addByte(#offer.icons)
              for k, icon in ipairs(offer.icons) do
                msg:addString(icon)
              end
        
              msg:addU16(0) -- We still don't support SubOffers!
        end
    end
  end

  player:sendButtonIndication(haveSaleOffer, 1)
  msg:sendToPlayer(player)
end

function sendStoreTransactionHistory(playerId, page, entriesPerPage)
  local player = Player(playerId)
  if not player then
    return false
  end

  local totalEntries = GameStore.retrieveHistoryTotalPages(player:getAccountId())
  local totalPages = math.ceil(totalEntries / entriesPerPage)
  local entries = GameStore.retrieveHistoryEntries(player:getAccountId(), page, entriesPerPage) -- this makes everything easy!
  if #entries == 0 then
    return addPlayerEvent(sendStoreError, 250, playerId, GameStore.StoreErrors.STORE_ERROR_HISTORY, "You don't have any entries yet.")
  end
  
  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_OpenTransactionHistory)
  
  msg:addU32(totalPages > 0 and page - 1 or 0x0) -- current page
  msg:addU32(totalPages > 0 and totalPages or 0x0) -- total page
  msg:addByte(#entries)

  for k, entry in ipairs(entries) do
    msg:addU32(entry.time)
    msg:addByte(entry.mode)
    msg:addU32(entry.amount)
    if player:getClient().version >= 1200 then
     msg:addByte(0x0) -- 0 = transferable tibia coin, 1 = normal tibia coin
    end
    msg:addString(entry.description)
  end

  msg:sendToPlayer(player)
end

function sendStorePurchaseSuccessful(playerId, message)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_CompletePurchase)

  msg:addByte(0x00)

  msg:addString(message)
  msg:addU32(player:getCoinsBalance())
  msg:addU32(player:getCoinsBalance())

  msg:sendToPlayer(player)
end

function sendStoreError(playerId, errorType, message)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_StoreError)

  msg:addByte(errorType)
  msg:addString(message)

  msg:sendToPlayer(player)
end

function sendCoinBalanceUpdating(playerId, updating)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_CoinBalanceUpdating)
  msg:addByte(0x00)
  msg:sendToPlayer(player)

  if updating == true then
    sendUpdateCoinBalance(playerId)
  end
end

function sendUpdateCoinBalance(playerId)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_CoinBalanceUpdating)
  msg:addByte(0x01)

  msg:addByte(GameStore.SendingPackets.S_CoinBalance)
  msg:addByte(0x01)

  msg:addU32(player:getCoinsBalance())
  msg:addU32(player:getCoinsBalance())

  msg:sendToPlayer(player)
end

function sendRequestPurchaseData(playerId, offerId, type)
  local player = Player(playerId)
  if not player then
    return false
  end

  local msg = NetworkMessage()
  msg:addByte(GameStore.SendingPackets.S_RequestPurchaseData)
  msg:addU32(offerId)
  msg:addByte(type)
  msg:sendToPlayer(player)
end

--==GameStoreFunctions==--
GameStore.getCategoryByName = function(name)
  for k, category in ipairs(GameStore.Categories) do
    if category.name:lower() == name:lower() then
      return category
    end
  end
  return nil
end

GameStore.getOfferById = function(id)
  for Cat_k, category in ipairs(GameStore.Categories) do
    if category.offers then
      for Off_k, offer in ipairs(category.offers) do
        if type(offer.id) == "number" then
          if offer.id == id then
            return offer
          end
        elseif type(offer.id) == "table" then
          for m, offerId in pairs(offer.id) do
            -- in case of outfits we have offer.id = {male = ..., female = ...}
            if offerId == id then
              return offer
            end
          end
        end

      end
    end
  end
  return nil
end

GameStore.haveCategoryRook = function()
  for Cat_k, category in ipairs(GameStore.Categories) do
    if category.offers and category.rookgaard then
      return true
    end
  end

  return false
end

GameStore.haveOfferRook = function(id)
  for Cat_k, category in ipairs(GameStore.Categories) do
    if category.offers and category.rookgaard then
      for Off_k, offer in ipairs(category.offers) do
        if offer.id == id then
          return true
        end
      end
    end
  end
  return nil
end

GameStore.insertHistory = function(accountId, mode, description, amount)
  return db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s)", accountId, mode, db.escapeString(description), amount, os.time()))
end

GameStore.retrieveHistoryTotalPages = function (accountId) 
  local resultId = db.storeQuery("SELECT count(id) as total FROM store_history WHERE account_id = " .. accountId)
  if resultId == false then
    return 0
  end
  
  local totalPages = result.getDataInt(resultId, "total")
  result.free(resultId)
  return totalPages
end

GameStore.retrieveHistoryEntries = function(accountId, currentPage, entriesPerPage)
  local entries = {}
  local offset = currentPage > 1 and entriesPerPage * (currentPage - 1) or 0
  
  local resultId = db.storeQuery("SELECT * FROM `store_history` WHERE `account_id` = " .. accountId .. " ORDER BY `time` DESC LIMIT " .. offset .. ", " .. entriesPerPage .. ";")
  if resultId ~= false then
    repeat
      local entry = {
        mode = result.getDataInt(resultId, "mode"),
        description = result.getDataString(resultId, "description"),
        amount = result.getDataInt(resultId, "coin_amount"),
        time = result.getDataInt(resultId, "time"),
      }
      table.insert(entries, entry)
    until not result.next(resultId)
    result.free(resultId)
  end
  return entries
end

GameStore.getDefaultDescription = function(offerType)
  local t, descList = GameStore.OfferTypes
  if offerType == t.OFFER_TYPE_OUTFIT or offerType == t.OFFER_TYPE_OUTFIT_ADDON then
    descList = GameStore.DefaultDescriptions.OUTFIT
  elseif offerType == t.OFFER_TYPE_MOUNT then
    descList = GameStore.DefaultDescriptions.MOUNT
  elseif offerType == t.OFFER_TYPE_NAMECHANGE then
    descList = GameStore.DefaultDescriptions.NAMECHANGE
  elseif offerType == t.OFFER_TYPE_SEXCHANGE then
    descList = GameStore.DefaultDescriptions.SEXCHANGE
  elseif offerType == t.OFFER_TYPE_EXPBOOST then
    descList = GameStore.DefaultDescriptions.EXPBOOST
  elseif offerType == t.OFFER_TYPE_PREYSLOT then
    descList = GameStore.DefaultDescriptions.PREYSLOT
  elseif offerType == t.OFFER_TYPE_PREYBONUS then
    descList = GameStore.DefaultDescriptions.PREYBONUS
  elseif offerType == t.OFFER_TYPE_TEMPLE then
    descList = GameStore.DefaultDescriptions.TEMPLE
  else
    return ""
  end

  return descList[math.floor(math.random(1, #descList))] or ""
end

GameStore.canChangeToName = function(name)
  local result = {
    ability = false
  }
  if name:len() < 3 or name:len() > 14 then
    result.reason = "The length of your new name must be between 3 and 14 characters."
    return result
  end

  local match = name:gmatch("%s+")
  local count = 0
  for v in match do
    count = count + 1
  end

  local matchtwo = name:match("^%s+")
  if (matchtwo) then
    result.reason = "Your new name can't have whitespace at begin."
    return result
  end

  if (count > 1) then
    result.reason = "Your new name have more than 1 whitespace."
    return result
  end

  -- just copied from znote aac.
  local words = { "owner", "gamemaster", "hoster", "admin", "staff", "tibia", "account", "god", "anal", "ass", "fuck", "sex", "hitler", "pussy", "dick", "rape", "adm", "cm", "gm", "tutor", "counsellor" }
  local split = name:split(" ")
  for k, word in ipairs(words) do
    for k, nameWord in ipairs(split) do
      if nameWord:lower() == word then
        result.reason = "You can't use word \"" .. word .. "\" in your new name."
        return result
      end
    end
  end

  local tmpName = name:gsub("%s+", "")
  for i = 1, #words do
    if (tmpName:lower():find(words[i])) then
      result.reason = "You can't use word \"" .. words[i] .. "\" with whitespace in your new name."
      return result
    end
  end

  if MonsterType(name) then
    result.reason = "Your new name \"" .. name .. "\" can't be a monster's name."
    return result
  elseif Npc(name) then
    result.reason = "Your new name \"" .. name .. "\" can't be a npc's name."
    return result
  end

  local letters = "{}|_*+-=<>0123456789@#%^&()/*'\\.,:;~!\"$"
  for i = 1, letters:len() do
    local c = letters:sub(i, i)
    for i = 1, name:len() do
      local m = name:sub(i, i)
      if m == c then
        result.reason = "You can't use this letter \"" .. c .. "\" in your new name."
        return result
      end
    end
  end
  result.ability = true
  return result
end

GameStore.canAddPromotionToPlayer = function(playerId, promotion, send)
  local player = Player(playerId)
  if not player then
    return false
  end

  local result = {
    ability = true
  }
  local vocation = player:getVocation()
  -- Working --
  local vocationCopy, baseVocation = vocation, vocation
  vocation = vocation:getDemotion()
  while vocation do
    baseVocation = vocation
    vocation = vocation:getDemotion()
  end

  local baseVocationsCount = GameStore.BaseVocationsCount or 4

  local newVocId = (baseVocationsCount * promotion) + baseVocation:getId()

  if not Vocation(newVocId) then
    if send then
      addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_NETWORK, "The offer is fake, please report it!")
    end
    result.ability = false
    return result
  end
  -- If promotion is less than player's voc, or player don't have previous promotion
  if newVocId <= vocationCopy:getId() then
    if send then
      addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_NETWORK, "You already have this promotion!")
    end
    result.ability = false
    return result
  end

  if (newVocId - baseVocationsCount) ~= vocationCopy:getId() then
    if send then
      addPlayerEvent(sendStoreError, 350, playerId, GameStore.StoreErrors.STORE_ERROR_NETWORK, "You need higher promotion to get his one.")
    end
    result.ability = false
    return result
  end

  result.vocId = newVocId
  return result
end

GameStore.addPromotionToPlayer = function(playerId, promotion)
  local player = Player(playerId)
  if not player then
    return false
  end

  local result = GameStore.canAddPromotionToPlayer(player, promotion, true)
  if result.ability == false then return false end

  local basics = {
    health = 185,
    mana = 40,
    cap = 500
  }

  player:setVocation(result.vocId)
  local newVoc = player:getVocation()
  player:setMaxHealth(basics.health + (newVoc:getHealthGain() * player:getLevel()))
  player:setMaxMana(basics.mana + (newVoc:getManaGain() * player:getLevel()))
  player:setCapacity(basics.cap + (newVoc:getCapacityGain() * player:getLevel()))

  player:addHealth(player:getMaxHealth())
  player:addMana(player:getMaxMana())

  player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been promoted to " .. newVoc:getName())
  return true
end

--
-- PURCHASE PROCESSOR FUNCTIONS
-- Must throw an error when the purchase has not been made. The error must of
-- take a table {code = ..., message = ...} if the error is handled. When no code
-- index is present the error is assumed to be unhandled.

function GameStore.processItemPurchase(player, offerId, offerCount)
  if player:getFreeCapacity() < ItemType(offerId):getWeight(offerCount) then
    return error({ code = 0, message = "Please make sure you have free capacity to hold this item."})
  end

  local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
  if inbox and inbox:getEmptySlots() > offerCount then
    for t = 1, offerCount do
      inbox:addItem(offerId, offerCount or 1)
    end
  else
    return error({ code = 0, message = "Please make sure you have free slots in your store inbox."})
  end
end

function GameStore.processSignleBlessingPurchase(player, offerId)
  if not player:hasBlessing(offerId) then
    player:addBlessing(offerId, 1)
  else
    return error({ code = 0, message = "You already have this blessing."})
  end
end

function GameStore.processAllBlessingsPurchase(player)
  if player:hasBlessing(1) and player:hasBlessing(2) and player:hasBlessing(3) and player:hasBlessing(4) and player:hasBlessing(5) and player:hasBlessing(6) and player:hasBlessing(7) and player:hasBlessing(8) then
    return error({ code = 0, message = "You already have all blessings."})
  else
    player:addBlessing(1, 1)
    player:addBlessing(2, 1)
    player:addBlessing(3, 1)
    player:addBlessing(4, 1)
    player:addBlessing(5, 1)
    player:addBlessing(6, 1)
    player:addBlessing(7, 1)
    player:addBlessing(8, 1)
  end
end

function GameStore.processPremiumPurchase(player, offerId)
  player:addPremiumDays(offerId-3000)
  
  -- Update Prey Data
  for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
    player:sendPreyData(slot)
  end
end

function GameStore.processStackablePurchase(player, offerId, offerCount, offerName)
  local function isKegExerciseItem(itemId)
    return ((itemId >= ITEM_KEG_START and itemId <= ITEM_KEG_END) or (itemId >= ITEM_EXERCISE_START and itemId <= ITEM_EXERCISE_END) or itemId == 32109)
  end
  
  if isKegExerciseItem(offerId) then
    if player:getFreeCapacity() < ItemType(offerId):getWeight(1) then
      return error({code = 0, message = "Please make sure you have free capacity to hold this item."})
    end
  else
    if player:getFreeCapacity() < ItemType(offerId):getWeight(offerCount) then
      return error({code = 0, message = "Please make sure you have free capacity to hold this item."})  
    end
  end

  local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
  if inbox and inbox:getEmptySlots() > 0 then
    if (isKegExerciseItem(offerId)) then
      if (offerCount >= 500) then
        local parcel = Item(inbox:addItem(23782, 1):getUniqueId())
        local function changeParcel(parcel)
          local packagename = '' .. offerCount .. 'x ' .. offerName .. ' package.'
          if parcel then
            parcel:setAttribute(ITEM_ATTRIBUTE_NAME, packagename)
            local pendingCount = offerCount
            while (pendingCount > 0) do
              local pack
              if (pendingCount > 500) then
                pack = 500
              else
                pack = pendingCount
              end
              local kegExerciseItem = parcel:addItem(offerId, 1)
              kegExerciseItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, pack)
              pendingCount = pendingCount - pack
            end
          end
        end
        addEvent(function() changeParcel(parcel) end, 250)
      else
        local kegExerciseItem = inbox:addItem(offerId, 1)
        kegExerciseItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, offerCount)
      end
    elseif (offerCount > 100) then
      local parcel = Item(inbox:addItem(23782, 1):getUniqueId())
      local function changeParcel(parcel)
        local packagename = '' .. offerCount .. 'x ' .. offerName .. ' package.'
        if parcel then
          parcel:setAttribute(ITEM_ATTRIBUTE_NAME, packagename)
          local pendingCount = offerCount
          while (pendingCount > 0) do
            local pack
            if (pendingCount > 100) then
              pack = 100
            else
              pack = pendingCount
            end
            parcel:addItem(offerId, pack)
            pendingCount = pendingCount - pack
          end
        end
      end
      addEvent(function() changeParcel(parcel) end, 250)
    else
      inbox:addItem(offerId, offerCount)
    end
  else
    return error({code = 0, message = "Please make sure you have free slots in your store inbox."})
  end
end

function GameStore.processHouseRelatedPurchase(player, offerId, offerCount)
  local function isCaskItem(itemId)
    return (itemId >= ITEM_HEALTH_CASK_START and itemId <= ITEM_HEALTH_CASK_END) or
        (itemId >= ITEM_MANA_CASK_START and itemId <= ITEM_MANA_CASK_END) or
        (itemId >= ITEM_SPIRIT_CASK_START and itemId <= ITEM_SPIRIT_CASK_END)
  end

  local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
  if inbox and inbox:getEmptySlots() > 0 then
    local decoKit = inbox:addItem(26054, 1)
    local function changeKit(kit)
      local decoItemName = ItemType(offerId):getName()
      if kit then
        kit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "You bought this item in the Store.\nUnwrap it in your own house to create a <" .. decoItemName .. ">.")
        kit:setActionId(offerId)

        if isCaskItem(offerId) then
          kit:setAttribute(ITEM_ATTRIBUTE_DATE, offerCount)
        end
      end
    end
    addEvent(function() changeKit(decoKit) end, 250)
  else
    return error({code = 0, message = "Please make sure you have free slots in your store inbox."})
  end
end

function GameStore.processOutfitPurchase(player, offerSexIdTable, addon)
  local looktype
  local _addon = addon and addon or 0

  if player:getSex() == PLAYERSEX_MALE then
    looktype = offerSexIdTable.male
  elseif player:getSex() == PLAYERSEX_FEMALE then
    looktype = offerSexIdTable.female
  end

  if not looktype then
    return error({code = 0, message = "This outfit seems not to suit your sex, we are sorry for that!"})
  elseif (not player:hasOutfit(looktype, 0)) and (_addon == 1 or _addon == 2) then
    return error({code = 0, message = "You must own the outfit before you can buy its addon."})
  elseif player:hasOutfit(looktype, _addon) then
    return error({code = 0, message = "You already own this outfit."})
  else
    if not (player:addOutfitAddon(looktype, _addon))  -- TFS call failed
        or (not player:hasOutfit(looktype, _addon))   -- Additional check; if the looktype doesn't match player sex for example,
                                                      --   then the TFS check will still pass... bug? (TODO)
    then
      error({ code = 0, message = "There has been an issue with your outfit purchase. Your purchase has been cancelled."})
    end
  end
end

function GameStore.processMountPurchase(player, offerId)
  player:addMount(offerId)
end

function GameStore.processNameChangePurchase(player, offer, productType, newName)
  local playerId = player:getId()
  local offerId = offer.id

  if productType == GameStore.ClientOfferTypes.CLIENT_STORE_OFFER_NAMECHANGE then
    local tile = Tile(player:getPosition())
    if (tile) then
      if (not tile:hasFlag(TILESTATE_PROTECTIONZONE)) then
        return error({code = 1, message = "You can change name only in Protection Zone."})
      end
    end

    local resultId = db.storeQuery("SELECT * FROM `players` WHERE `name` = " .. db.escapeString(newName) .. "")
    if resultId ~= false then
      return error({code = 1, message = "This name is already used, please try again!"})
    end

    local result = GameStore.canChangeToName(newName)
    if not result.ability then
      return error({code = 1, message = result.reason})
    end

    newName = newName:lower():gsub("(%l)(%w*)", function(a, b) return string.upper(a) .. b end)
    db.query("UPDATE `players` SET `name` = " .. db.escapeString(newName) .. " WHERE `id` = " .. player:getGuid())
    player:removeCoinsBalance(offer.price)
    GameStore.insertHistory(player:getAccountId(), GameStore.HistoryTypes.HISTORY_TYPE_NONE, offer.name, (offer.price) * -1)
    message = "You have successfully changed you name, relogin!"
    addEvent(function()
      local player = Player(playerId)
      if not player then
        return false
      end

      player:remove()
    end, 500)
    -- If not, we ask him to do!
  else
    return addPlayerEvent(sendRequestPurchaseData, 250, playerId, offerId, GameStore.ClientOfferTypes.CLIENT_STORE_OFFER_NAMECHANGE)
  end
end

function GameStore.processSexChangePurchase(player)
  player:toggleSex()
end


function GameStore.processExpBoostPuchase(player)
  local currentExpBoostTime = player:getExpBoostStamina()

  player:setStoreXpBoost(50)
  player:setExpBoostStamina(currentExpBoostTime + 3600)

  if (player:getStorageValue(51052) == -1 or player:getStorageValue(51052) == 6) then
    player:setStorageValue(51052, 1)
  end

  player:setStorageValue(51052, player:getStorageValue(51052) + 1)
  player:setStorageValue(51053, os.time()) -- last bought
end

function GameStore.processPreySlotPurchase(player)
	if player:getStorageValue(STORE_SLOT_STORAGE) < 1 then
		player:setStorageValue(STORE_SLOT_STORAGE, 1)
		player:setPreyUnlocked(CONST_PREY_SLOT_THIRD, 2)
		player:setPreyState(CONST_PREY_SLOT_THIRD, 1)
		
		-- Update Prey Data
		for slot = CONST_PREY_SLOT_FIRST, CONST_PREY_SLOT_THIRD do
			player:sendPreyData(slot)
		end
	end
end

function GameStore.processPreyBonusReroll(player, offerCount)
	player:setPreyBonusRerolls(player:getPreyBonusRerolls() + offerCount)
end

function GameStore.processTempleTeleportPurchase(player)
  if player:getCondition(CONDITION_INFIGHT) or player:isPzLocked() then
    return error({code = 0, message = "You can't use temple teleport in fight!"})
  end

  player:teleportTo(player:getTown():getTemplePosition())
  player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
  player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have been teleported to your hometown.')
end

function GameStore.processPromotionPurchase(player, offerId)
  if not GameStore.addPromotionToPlayer(player.id, offerId) then
    return error({code = 0})
  end
end

--==Player==--
function Player.getCoinsBalance(self)
  resultId = db.storeQuery("SELECT `coins` FROM `accounts` WHERE `id` = " .. self:getAccountId())
  if not resultId then return 0 end
  return result.getDataInt(resultId, "coins")
end

function Player.setCoinsBalance(self, coins)
  db.query("UPDATE `accounts` SET `coins` = " .. coins .. " WHERE `id` = " .. self:getAccountId())
  return true
end

function Player.canRemoveCoins(self, coins)
  if self:getCoinsBalance() < coins then
    return false
  end
  return true
end

function Player.removeCoinsBalance(self, coins)
  if self:canRemoveCoins(coins) then
    return self:setCoinsBalance(self:getCoinsBalance() - coins)
  end

  return false
end

function Player.addCoinsBalance(self, coins, update)
  self:setCoinsBalance(self:getCoinsBalance() + coins)
  if update then sendCoinBalanceUpdating(self, true) end
  return true
end

function Player.sendButtonIndication(self, value1, value2)
  local msg = NetworkMessage()
  msg:addByte(0x19)
  msg:addByte(value1) -- Sale
  msg:addByte(value2) -- New Item
  msg:sendToPlayer(self)
end

function Player.toggleSex(self)
  local currentSex = self:getSex()
  local playerOutfit = self:getOutfit()

  if currentSex == PLAYERSEX_FEMALE then
    self:setSex(PLAYERSEX_MALE)
    playerOutfit.lookType = 128
  else
    self:setSex(PLAYERSEX_FEMALE)
    playerOutfit.lookType = 136
  end
  self:setOutfit(playerOutfit)
end
