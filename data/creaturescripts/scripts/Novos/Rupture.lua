local posdotpzzzz = {x = 32327, y = 31250, z = 14}

function MoveStonezzzz() --creates wall back
local criistal1zzzz = getTileItemById(posdotpzzzz, 1304)
   if not criistal1zzzz then 
    Game.createItem(1304,1,posdotpzzzz)-- Stone pos
	else 
	Game.createItem(1304,1,posdotpzzzz)
   end 
   return true
end

function ReMoveStonezzzz()
    local cristalzzzz = getTileItemById(posdotpzzzz, 1304) -- Id do cristalzzzz azul que some para dar lugar ao tp
    if cristalzzzz then
        doRemoveItem(cristalzzzz.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "rupture") then
		    addEvent(ReMoveStonezzzz, 5 * 1000)
     	    addEvent(MoveStonezzzz, 300 * 1000)
		end
	end
	return true
end


