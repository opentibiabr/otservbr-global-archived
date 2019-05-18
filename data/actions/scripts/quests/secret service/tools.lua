local config = {
	[7960] = 10515, -- TBI
	[7961] = 10513, -- CGB
	[7962] = 10511 -- AVIN
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	player:addItem(useItem)
	player:say('You\'ve found a useful little tool for secret agents in the parcel.', TALKTYPE_MONSTER_SAY)

	item:remove()
	return true
end
