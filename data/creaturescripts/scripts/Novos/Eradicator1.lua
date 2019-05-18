function onKill(cid, target, damage, flags)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "eradicator") then
		local monster = Game.createMonster("Eradicatorr", getThingPos(cid))  -- 33389" y="31539" z="11"
      
		end
	end
	return true
end
