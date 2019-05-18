local table = {
	[24763] = {mountId = 87, mountName = "Rift Runner"},
	[26194] = {mountId = 94, mountName = "Sparkion"},
	[26340] = {mountId = 98, mountName = "Neon Sparkid"},
	[26341] = {mountId = 99, mountName = "Vortexion"},
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useId = table[item.itemid]
	if not useId then
		return false
	end

	if not player:hasMount(useId.mountId) then
		player:addMount(useId.mountId)
		player:say("You receive the permission to ride a ".. useId.mountName ..".", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		item:remove(1)
	else
		player:sendCancelMessage("You already have this mount.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
