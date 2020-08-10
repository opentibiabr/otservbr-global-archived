-- Base script by Nekiro & oualid6496
-- Updated by Marcosvf132
if not BoostedCreature then
	BoostedCreature = {name = ""}
end

-- Using bestiary races/monsters.
dofile("data/modules/scripts/bestiary/bestiary.lua")

function BoostedCreature:startup()
    	local bodate = db.storeQuery("SELECT `boostname`, `date` FROM `boosted_creature`")
        local booldnamestamp = result.getStream(bodate, "boostname")
        local bodatestamp = result.getStream(bodate, "date")
        result.free(bodate)
	if bodatestamp == os.date("%d") then -- Same day, after restarted server.
        self.name = booldnamestamp
	else -- New day, roll new creature.
		local cloneTable = {}
		for name, raceId in pairs(Bestiary.MonstersName) do
			cloneTable[#cloneTable + 1] = {name, raceId}
		end
		local randMonster = nil
		repeat
			randMonster = cloneTable[math.random(#cloneTable)]
		until randMonster[1] ~= booldnamestamp
		db.query("UPDATE `boosted_creature` SET `boostname` = '".. randMonster[1] .."', `date` = '".. os.date("%d") .."', `raceid` = '".. randMonster[2] .."'")
		self.name = randMonster[1]
	end
		return print(">> Boosted creature: " .. self.name)
end
BoostedCreature:startup() -- Force startup before cpp load map.
