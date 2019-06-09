function onDeath(creature)

	if creature:getName() == "Frenzy" then
		rageSummon = rageSummon - 1
		devourerSummon = devourerSummon - 1
	elseif creature:getName() == "Damage Resonance" then
		resonanceActive = false
	elseif creature:getName() == "Disruption" or creature:getName() == "Charged Disruption" or creature:getName() == "Overcharged Disruption" then
		destructionSummon = destructionSummon - 1
		devourerSummon = devourerSummon - 1
	elseif creature:getName() == "The Hunger" then
		devourerBossesKilled = devourerBossesKilled + 1
		theHungerKilled = true
	elseif creature:getName() == "The Destruction" then
		devourerBossesKilled = devourerBossesKilled + 1
		theDestructionKilled = true
	elseif creature:getName() == "The Rage" then
		devourerBossesKilled = devourerBossesKilled + 1
		theRageKilled = true
	end

	return true
end
