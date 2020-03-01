local deathAngryPlant = CreatureEvent("Angry Plant Death")

function deathAngryPlant.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	if corpse then
		corpse:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, 24893)
	end
	return true
end

deathAngryPlant:register()
