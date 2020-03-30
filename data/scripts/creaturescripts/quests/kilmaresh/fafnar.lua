local monsterList = {
    ['burning gladiator'] = Storage.KilmareshQuest.Thirteen.Fafnar,
    ['priestess of the wild sun'] = Storage.KilmareshQuest.Thirteen.Fafnar
}

local event = CreatureEvent("CultoFafnar")

function event.onKill(creature, target)
    local storage = monsterList[target:getName():lower()]
    if target:isPlayer() or target:getMaster()  or not storage then
        return false
    end
	
    local kills = creature:getStorageValue(storage)
    if kills == 300 and creature:getStorageValue(storage) == 1 then
        creature:say('You slayed ' .. target:getName() .. '.', TALKTYPE_MONSTER_SAY)
    else
        kills = kills + 1
        creature:say('You have slayed ' .. target:getName() .. ' '.. kills ..' times!', TALKTYPE_MONSTER_SAY)
		creature:setStorageValue(storage, kills)
    end

    return true
end

event:register()