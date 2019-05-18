function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


     local player = Player(cid)
     if itemEx.itemid == 2694 then
         if toPosition.x ~= CONTAINER_POSITION then
             Game.createItem(13939, 1, toPosition)
         else
             player:addItem(13939, 1)
             toPosition = player:getPosition()
         end
         toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)  
         Item(item.uid):remove(1)
         Item(itemEx.uid):remove(1)
     end
	 player:setStorageValue(Storage.Exaust.tempo, os.time())
     return true
end