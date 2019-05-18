local decayItems = {
	[26094] = 26096,[26096] = 26094, [26095] = 26097,[26097] = 26095, --protectress lamp
	[26090] = 26092,[26092] = 26090, [26091] = 26093,[26093] = 26091, --predador lamp
	[26098] = 26099,[26099] = 26098,                                  --baby dragon
	[26100] = 26101,[26101] = 26100,                                  --hamster wheel
	[26107] = 26108,[26108] = 26107,                                  --cat in a basket. 
	[26141] = 26142,[26142] = 26141,                                  --barrel. 
	[26364] = 26365,[26365] = 26364,                                 --dog house.    
	[26365] = 26353,[26353] = 26364,                                 --dog house.    
	[27100] = 27101,[27101] = 27100,                                --parrot.    
	[27102] = 27103,[27103] = 27102,                                --lit skull lamp.    
	
	
	
	
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


	item:transform(decayItems[item.itemid])
	item:decay()
	player:setStorageValue(Storage.Exaust.tempo, os.time())
	return true
end