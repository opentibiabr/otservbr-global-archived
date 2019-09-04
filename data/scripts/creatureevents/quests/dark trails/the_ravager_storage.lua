local the_ravager = CreatureEvent("The Ravager onKill")

function the_ravager.onKill(player, target, lastHit)
config = {
monster = "The Ravager",
storage = Storage.DarkTrails.Mission11,
}

	local creature = Creature(cid)
	if isMonster(target) then
		if creature:getName(target) == config.monster and player:getStorageValue(config.storage) < 1 then	
			player:setPlayerStorageValue(config.Storage1, 1)
		end
	end
return true
end

the_ravager:register()