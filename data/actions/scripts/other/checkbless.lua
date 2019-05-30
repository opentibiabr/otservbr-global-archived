local blessings = {
	{id = 1, name = 'Twist of Fate'},
	{id = 5, name = 'The Spiritual Shielding'},
	{id = 6, name = 'The Embrace of Tibia'},
	{id = 4, name = 'The Fire of the Suns'},
	{id = 3, name = 'The Spark of the Phoenix'},
	{id = 2, name = 'The Wisdom of Solitude'},
	{id = 7, name = 'Blood of the Mountain'},
	{id = 8, name = 'Heart of the Mountain'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.Time) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end

	local result, bless = 'Received blessings:'
	for i = 1, #blessings do
		bless = blessings[i]
		result = player:hasBlessing(bless.id) and result .. '\n' .. bless.name or result
	end
	
	player:setStorageValue(Storage.Exaust.Time, os.time())
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 20 > result:len() and 'No blessings received.' or result)
	return true
end
