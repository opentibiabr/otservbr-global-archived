local posdotpzzz = {x = 32317, y = 31284, z = 14}

function MoveStonezzz() --creates wall back
local criistal1zzz = getTileItemById(posdotpzzz, 1304)
   if not criistal1zzz then 
    Game.createItem(1304,1,posdotpzzz)-- Stone pos
	else 
	Game.createItem(1304,1,posdotpzzz)
   end 
   return true
end

function ReMoveStonezzz()
    local cristalzzz = getTileItemById(posdotpzzz, 1304) -- Id do cristalzzz azul que some para dar lugar ao tp
    if cristalzzz then
        doRemoveItem(cristalzzz.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "eradicatorr") then
		    addEvent(ReMoveStonezzz, 5 * 1000)
     	    addEvent(MoveStonezzz, 300 * 1000)
		end
	end
	return true
end


