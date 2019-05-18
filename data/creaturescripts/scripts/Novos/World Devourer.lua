local posdotpzzzzz = {x = 32280, y = 31348, z = 14}

function MoveStonezzzzz() --creates wall back
local criistal1zzzzz = getTileItemById(posdotpzzzzz, 1304)
   if not criistal1zzzzz then 
    Game.createItem(1304,1,posdotpzzzzz)-- Stone pos
	else 
	Game.createItem(1304,1,posdotpzzzzz)
   end 
   return true
end

function ReMoveStonezzzzz()
    local cristalzzzzz = getTileItemById(posdotpzzzzz, 1304) -- Id do cristalzzzzz azul que some para dar lugar ao tp
    if cristalzzzzz then
        doRemoveItem(cristalzzzzz.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "world devourer") then
		    addEvent(ReMoveStonezzzzz, 5 * 1000)
     	    addEvent(MoveStonezzzzz, 300 * 1000)
		end
	end
	return true
end


