local portais = {
	[26138] = {stg = Storage.CultsOfTibia.Humans.Decaying, max = 10, text = "You absorb the energetic remains of this decaying soul. Its power is very fragile and fleeting", id = 26138},
	[26140] = {stg = Storage.CultsOfTibia.Humans.Vaporized, max = 10, text = "You absorb the energetic remains of this whitering soul. Its power is very fragile and fleeting.", id = 26140}
}
function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()

	if not player then
		return true
	end
	if player:getStorageValue(Storage.CultsOfTibia.Questline) < 1 then
		player:setStorageValue(Storage.CultsOfTibia.Questline, 1)
	end
	if player:getStorageValue(Storage.CultsOfTibia.Humans.Mission) < 1 then
		player:setStorageValue(Storage.CultsOfTibia.Humans.Mission, 1)
	end

	for id, info in pairs(portais) do
		local portal = Tile(position):getItemById(id)
		if portal then
			local stg = (player:getStorageValue(info.stg) < 0 and 0 or player:getStorageValue(info.stg))
			local newtb = portal:getSpecialAttribute("task") or ''
			if newtb:find(player:getName()) or stg >= info.max then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The power of these souls is now within you. You cannot absorb any more souls.")
				return false
			end
			newtb = string.format("%s, %s", newtb, player:getName())
			portal:setSpecialAttribute("task", newtb)
			player:setStorageValue(info.stg, stg + 1)
			player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
			portal:remove()
			player:say(info.text, TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
