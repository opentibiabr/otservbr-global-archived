local posdotpzz = {x = 32290, y = 31372, z = 14}

function MoveStonezz() --creates wall back
local criistal1zz = getTileItemById(posdotpzz, 1304)
   if not criistal1zz then 
    Game.createItem(1304,1,posdotpzz)-- Stone pos
	else 
	Game.createItem(1304,1,posdotpzz)
   end 
   return true
end

function ReMoveStonezz()
    local cristalzz = getTileItemById(posdotpzz, 1304) -- Id do cristalzz azul que some para dar lugar ao tp
    if cristalzz then
        doRemoveItem(cristalzz.uid, 1)
    end
    return true
end

function onKill(cid, target, damage, flags, corpse)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "the rage") then
		    addEvent(ReMoveStonezz, 5 * 1000)
     	    addEvent(MoveStonezz, 300 * 1000)
		end
	end
	return true
end


