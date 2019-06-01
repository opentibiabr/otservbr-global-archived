function onUse(cid, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

if Player(cid) then
Item(item.uid):remove(1)
		 doPlayerSendTextMessage(cid,19,"Relogue para ativar seu outfit ou montaria.")
		 end
		 
		player:setStorageValue(Storage.Exaust.Time, os.time())
		 
		return true
end