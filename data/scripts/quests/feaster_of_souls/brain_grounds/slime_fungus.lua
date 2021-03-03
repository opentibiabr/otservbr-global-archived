local damages = {
	[8] = 0.15,
	[9] = 0.20,
	[10] = 0.25,
}

local damage_chance = 30000

local fromPos, toPos = Position({x = 31900, y = 32281, z = 8}), Position({x = 32022, y = 32365, z = 10})

local slimeFungus = MoveEvent()

function slimeFungus.onStepIn(creature, item, position, fromPosition)
	if not isInRange(position, fromPos, toPos) then
		return true
	end
	local master = creature:getMaster()
	if creature:isPlayer() or (master and master:isPlayer()) then
		local storage = master and master:getStorageValue(Storage.Quest.FeasterOfSouls.Bosses.BrainHead.Killed) or creature:getStorageValue(Storage.Quest.FeasterOfSouls.Bosses.BrainHead.Killed)
		if storage == -1 then
			if math.random(1, 100000) <= damage_chance then
				creature:addHealth(-(creature:getMaxHealth() * damages[position.z]), COMBAT_EARTHDAMAGE)
				position:sendMagicEffect(CONST_ME_CARNIPHILA)
			end
		end
	end
	return true
end

slimeFungus:type("stepin")

for i=13607, 13619 do
	slimeFungus:id(i)
end

slimeFungus:register()
