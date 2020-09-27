local mType = Game.createMonsterType("Energized Raging Mage")
local monster = {}
monster.description = "an energized raging mage"
monster.experience = 0
monster.outfit = {
	lookType = 423
}

monster.health = 3500
monster.maxHealth = monster.health
monster.race = "blood"
monster.corpse = 0
monster.speed = 320

monster.changeTarget = {
	interval = 4*1000,
	chance = 10
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	respawnType = RESPAWN_IN_ALL
}

monster.attacks = {
	{name = "energized raging mage skill reducer", chance = 20, interval = 6*1000},
	{name = "energyfield", type = COMBAT_PARAM_CREATEITEM, interval = 2*1000, chance = 13, range = 4, target = true, radius = 2,  shootEffect = CONST_ANI_ENERGY},
	{name = "combat", type = COMBAT_FIREDAMAGE, interval = 2*1000, chance = 10, range = 4, target = true, radius = 3, minDamage = -70, maxDamage = -200, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2*1000, chance = 10, length = 6, spread = 0, minDamage = -60, maxDamage = -250, effect = CONST_ME_BIGCLOUDS},
	{name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2*1000, chance = 15, range = 4, target = true, radius = 1, minDamage = -100, maxDamage = -200, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_ENERGYHIT},
	{name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2*1000, chance = 17, range = 4, target = true, radius = 1, minDamage = -100, maxDamage = -200, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT},
	{name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2*1000, chance = 10, range = 4, target = true, radius = 4, minDamage = -100, maxDamage = -200, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY},
	{name = "combat", type = COMBAT_MANADRAIN, interval = 2*1000, chance = 17, range = 4, target = true, radius = 1, minDamage = -100, maxDamage = -210, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA},

}

monster.defenses = {
	defense = 30,
	armor = 30,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -50},
	{type = COMBAT_HOLYDAMAGE, percent = 10},
}

monster.voices = {
	interval = 2000,
	chance = 10,
	{text = "Behold the all permeating powers I draw from this gate!!", yell = false},
	{text = "ENERGY!!", yell = false},
	{text = " FEEL, I FEEEEEL... OMNIPOTENCE!!", yell = false},
	{text = "MWAAAHAHAAA!! NO ONE!! NO ONE CAN DEFEAT MEEE!!!", yell = false}
}

monster.immunities = {
	{type = "invisible", condition = true},
	{type = "fire", combat = true, condition = true},
	{type = "energy", combat = true, condition = true},
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
