local config = {
    swampId = {20230, 18589, 18584, 18141}, -- ids dos tiles de swamp que pode ser usado a shovel
    itemGain = {{itemId = 2818, quantGain = 1}, -- itemid que ganha, e quantidade maxima do msm.
                {itemId = 2145, quantGain = 3},
                {itemId = 20138, quantGain = 1}
                }
}

local exhausth = 3600 --em quantos segundos podera usar denovo
local holes = {468, 481, 483, 7932, 23712}
local pools = {2016, 2017, 2018, 2019, 2020, 2021, 2025, 2026, 2027, 2028, 2029, 2030}
function onUse(cid, item, fromPosition, itemEx, toPosition)
if isInArray(pools, itemEx.itemid) then
        itemEx = Tile(toPosition):getGround()
    end
    if(isInArray(config.swampId, itemEx.itemid)) then
        if (getPlayerStorageValue(cid, 32901) <= os.time()) then
        if math.random(0,500) > 255 then
            local posGain = math.random(1, #config.itemGain)
            local quantGain = math.random(1,config.itemGain[posGain].quantGain)
            doPlayerAddItem(cid, config.itemGain[posGain].itemId, quantGain)
            doSendMagicEffect(toPosition, 8)
            doCreatureSay(cid,  "You dug up ".. quantGain .." ".. getItemName(config.itemGain[posGain].itemId) ..".", TALKTYPE_ORANGE_1)
            setPlayerStorageValue(cid, 32901, os.time()+exhausth)
        end
    else
            doPlayerSendCancel(cid, "You are exhausted, use again in 1 hour.")
        end
    else
        return shovelNormal(cid, item, fromPosition, itemEx, toPosition)
    end
 	-- ferumbras ascendant
	if targetActionId == 53803 then
		if player:getStorageValue(Storage.FerumbrasAscension.Ring) >= 1 then
			return false
		end
		player:addItem(24826, 1)
		player:setStorageValue(Storage.FerumbrasAscension.Ring, 1)
	elseif targetId == 23712 then
		target:transform(23713)
		addEvent(revertItem, 30 * 1000, toPosition, 23713, 23712)
	else
		return false
	end
   return true
end



function shovelNormal(cid, item, fromPosition, itemEx, toPosition)
local target = itemEx
    local player = Player(cid)
    local iEx = Item(itemEx.uid)
    if isInArray(holes, itemEx.itemid) then
        iEx:transform(itemEx.itemid + 1)
        iEx:decay()
 elseif isInArray(pools, target.itemid) then
        local hole = 0
        for i = 1, #holes do
            local tile = Tile(target:getPosition()):getItemById(holes[i])
            if tile then
                hole = tile
            end
        end
        if hole ~= 0 then
            hole:transform(hole:getId() + 1)
            hole:decay()
        else
            return false
        end
    elseif itemEx.itemid == 231 or itemEx.itemid == 9059 or itemEx.itemid == 22672 then
        local rand = math.random(1, 100)
        if(itemEx.actionid  == 100 and rand <= 20) then
        iEx:transform(489)
        iEx:decay()
        elseif rand == 1 then
            Game.createItem(2159, 1, toPosition)
        elseif rand > 95 then
            Game.createMonster("Rat", toPosition)
        end
        toPosition:sendMagicEffect(CONST_ME_POFF)
    elseif itemEx.actionid == 4654 and player:getStorageValue(9925) == 1 and player:getStorageValue(9926) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:addItem(21250, 1)
        player:setStorageValue(9926, 1)
    elseif itemEx.actionid == 4668 and player:getStorageValue(12902) == 1 and player:getStorageValue(12903) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:addItem(21250, 1)
        player:setStorageValue(12903, 1)
         -- ferumbras ascendant
	elseif itemEx.actionid == 53803 and player:getStorageValue(Storage.FerumbrasAscension.Ring) < 1 then
		player:addItem(24826, 1)
		player:setStorageValue(Storage.FerumbrasAscension.Ring, 1)
		target:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are digging out a precious looking signet ring, made of silver and adorned with a sun.')
	elseif targetId == 23712 then
		target:transform(23713)
		addEvent(revertItem, 30 * 1000, toPosition, 23713, 23712)
    else
        return false
    end
    return true
end
