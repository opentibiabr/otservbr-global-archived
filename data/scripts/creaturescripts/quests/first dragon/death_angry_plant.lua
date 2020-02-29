local angryPlant = CreatureEvent("Angry Plant Death")

function angryPlant.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	if corpse then
		corpse:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, 24893)
	end
	return true
end

angryPlant:register()
