--- [[ Warzone 2 feito por Yuri Lagrotta ]] ---

local kickposs = {x=33000, y=31899, z=9} 

local function deGnomevil()
if(getGlobalStorageValue(91149) < 1) then
    TOP_LEFT_CORNER = {x = 33102, y = 31942, z = 11, stackpos=253}
    BOTTOM_RIGHT_CORNER = {x = 33130, y = 31970, z = 11, stackpos=253}
	for Py = TOP_LEFT_CORNER.y, BOTTOM_RIGHT_CORNER.y do
		for Px = TOP_LEFT_CORNER.x, BOTTOM_RIGHT_CORNER.x do
			creature = getThingfromPos({x=Px, y=Py, z=11, stackpos=253})
			if isMonster(creature.uid) then
				if getCreatureName(creature.uid) == "Gnomevil" then
					doRemoveCreature(creature.uid)
					setGlobalStorageValue(91149, 1)
					addEvent(setGlobalStorageValue, 5 * 60 * 1000, 91149, 0) 
					end
				end
			end
		end
    end
    return FALSE
end    
       
function onStepIn(cid, item, position, topos, frompos)
    if not isPlayer(cid) then
        return false
    end
           
if item.actionid == 5159 then
	doTeleportThing(cid, {x = 33105, y = 31955, z = 11})
	doPlayerSendTextMessage(cid, 19, "You have half an hour to heroically defeat Gnomevil. Otherwise you'll be teleported out by the gnomish emergency device.")
	deGnomevil()
elseif item.actionid == 5160 then
        doTeleportThing(cid, kickposs)
    end
    return true
end