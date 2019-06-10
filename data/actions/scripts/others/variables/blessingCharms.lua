local config = {
	[11260] = {blessId = 5, text = 'The Spiritual Shielding'},
	[11259] = {blessId = 6, text = 'The Embrace of Tibia'},
	[11261] = {blessId = 4, text = 'The Fire of the Suns'},
	[11258] = {blessId = 3, text = 'The Spark of the Phoenix'},
	[11262] = {blessId = 2, text = 'The Wisdom of Solitude'},
	[28036] = {blessId = 7, text = 'Heart of the Mountain'},
	[28037] = {blessId = 8, text = 'Blood of the Mountain'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	if player:hasBlessing(useItem.blessId) then
		player:say('You already possess this blessing.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:addBlessing(useItem.blessId,1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, useItem.text .. ' protects you.')
	player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
	item:remove(1)
	return true
end
