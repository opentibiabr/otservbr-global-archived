--- [[ Warzone 3 feito por Yuri Lagrotta ]] ---

local kickposs = {x=33000, y=31899, z=9}

local function deAbyssador()
if(getGlobalStorageValue(91159) < 1) then
    TOP_LEFT_CORNER = {x = 33074, y = 31896, z = 12, stackpos=253}
    BOTTOM_RIGHT_CORNER = {x = 33103, y = 31925, z = 12, stackpos=253}
	for Py = TOP_LEFT_CORNER.y, BOTTOM_RIGHT_CORNER.y do
		for Px = TOP_LEFT_CORNER.x, BOTTOM_RIGHT_CORNER.x do
			creature = getThingfromPos({x=Px, y=Py, z=12, stackpos=253})
			if isMonster(creature.uid) then
				if getCreatureName(creature.uid) == "Abyssador" then
					--doRemoveCreature(creature.uid)
					setGlobalStorageValue(91159, 1)
					addEvent(setGlobalStorageValue, 5 * 60 * 1000, 91159, 0)
					end
				end
			end
		end
    end
    return false
end

local function deSummonAbyssador()
	if(getGlobalStorageValue(99159) < 1) then
		--addEvent(doSummonCreature, 45*1000, "abyssador", {x=33089, y=31909, z=12})
		--setGlobalStorageValue(99159, 1)
		addEvent(setGlobalStorageValue, 10 * 60 * 1000, 99159, 0)
	end
end

function onStepIn(cid, item, position, topos, frompos)
    if not isPlayer(cid) then
        return false
    end

if item.actionid == 5161 then
	doPlayerSendTextMessage(cid, 19, "You have half an hour to heroically defeat Abyssador. Otherwise you'll be teleported out by the gnomish emergency device.")
	doTeleportThing(cid, {x=33082, y=31905, z=12})
	deAbyssador()
	deSummonAbyssador()
elseif item.actionid == 5162 then
        doTeleportThing(cid, kickposs)
    end
    return true
end
