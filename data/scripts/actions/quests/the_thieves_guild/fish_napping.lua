-- needs to be revised
local theThievesNapping = Action()
function theThievesNapping.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(Storage.ThievesGuild.Mission06) == 2 then
		player:addItem(8766, 1)
		player:say('To buy some time you replace the fish with a piece of carrot.', TALKTYPE_MONSTER_SAY)
		player:setStorageValue(Storage.ThievesGuild.Mission06, 3)
	end
	return true
end

--theThievesNapping:id()
--theThievesNapping:register()