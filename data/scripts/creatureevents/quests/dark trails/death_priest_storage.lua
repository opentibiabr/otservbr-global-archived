local death_priest = CreatureEvent("Death Priest onKill")

function death_priest.onKill(player, target, lastHit)
config = {
monster = "Death Priest Shargon",
storage = Storage.DarkTrails.Mission18,
}

	local creature = Creature(cid)
	if isMonster(target) then
		if creature:getName(target) == config.monster and player:getStorageValue(config.storage) < 1 then	
			player:setPlayerStorageValue(config.Storage, 1)
		end
	end
return true
end

death_priest:register()