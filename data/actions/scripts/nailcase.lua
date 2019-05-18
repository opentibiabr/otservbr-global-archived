---- string of mending id "22542"-----
local posdotp = {x= 33073, y=32300, z=9}
local ITEMS = {
    [21385] = { -----Broken Ring Id "13877" Ring of ending "22516"
        {"nail case", 10.10} ----- 1.97 es la probabilidad de crear el item
    }
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cadena = ITEMS[itemEx.itemid]
    if cadena == nil then
        return false
    end
 
    local iEx = Item(itemEx.uid)
    local random, chance = math.random() * 100, 0
 
    for i = 1, #cadena do
        chance = chance + cadena[i][2]
        if random <= chance then
            --iEx:transform(cadena[i][1])
			doPlayerAddItem(cid,21452,1)
            iEx:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            Item(item.uid):remove(1)
			--addEvent(Game.createItem, 1+1*5*1000, 21385, posdotp)
            return true
        end
    end
 
    iEx:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
    Item(item.uid):remove(1)
	--iEx:remove()
	doCreatureSay(cid, "The item was broken.", TALKTYPE_ORANGE_1)
	--addEvent(Game.createItem, 1+1*5*1000, 21385, posdotp)
    return true
end