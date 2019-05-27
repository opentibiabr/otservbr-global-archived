function onUse(cid, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


if getPlayerStorageValue(cid,21026) == 500 then
	doPlayerSendTextMessage(cid,18,"Congratulations! You earned the achievement \"Jinx\".")
	doPlayerAddAchievement(cid, 26)
end


local rand = math.random(1, 15)
local lotteryid = 5957

if item.itemid == lotteryid then
	if rand == 1 then
		doCreatureSay(cid, "You have a winning lottery ticket!", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, item.itemid + 1)
		setPlayerStorageValue(cid, 21026, getPlayerStorageValue(cid, 21026) + 1)
		doSendMagicEffect(fromPosition,12)
	else
		doCreatureSay(cid, "Sorry, This is not a winning lottery ticket.", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, item.itemid - 1)
		setPlayerStorageValue(cid, 21026, getPlayerStorageValue(cid, 21026) + 1)
	end
end
	player:setStorageValue(Storage.Exaust.Time, os.time())
return TRUE
end