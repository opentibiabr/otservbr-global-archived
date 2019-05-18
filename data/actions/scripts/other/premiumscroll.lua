local function doPlayerAddPremiumPoints(cid, count)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


		db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end

function onUse(cid, item, fromPosition, itemEx, toPosition) 
	doPlayerAddPremiumPoints(cid, 30)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have recived 30 Tibia Coins to your account.")
	doSendMagicEffect(getCreaturePosition(cid), 28)
	doRemoveItem(item.uid,1)
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end