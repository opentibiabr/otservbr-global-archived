local skills = {
    [28552] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [28553] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [28554] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [28555] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [28556] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [28557] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
    [28540] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [28541] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [28542] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [28543] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [28544] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [28545] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
    [35279] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [35280] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [35281] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [35282] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [35283] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [35284] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
    [35285] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [35286] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [35287] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [35288] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [35289] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [35290] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE} -- SORCERER
}

local houseDummies = {28559, 28560, 28561, 28562, 28563, 28564}
local freeDummies = {28558, 28565}
local skillRateDefault = configManager.getNumber(configKeys.RATE_SKILL)
local magicRateDefault = configManager.getNumber(configKeys.RATE_MAGIC)

local function removeExerciseWeapon(player, exercise)
    exercise:remove(1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training weapon vanished.")
    stopEvent(training)
    player:setStorageValue(Storage.isTraining,0)
    player:setTraining(false)
end

local function startTraining(playerId, startPosition, itemid, tilePosition, bonusDummy, dummyId)
    local player = Player(playerId)
    if player ~= nil then
        if Tile(tilePosition):getItemById(dummyId) then
            local playerPosition = player:getPosition()
            if startPosition:getDistance(playerPosition) == 0 and getTilePzInfo(playerPosition) then
                if player:getItemCount(itemid) >= 1 then
                    local exercise = player:getItemById(itemid,true)
                    if exercise:isItem() then
                        if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                            local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)
                            if charges_n >= 1 then
                                exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))

                                local voc = player:getVocation()

                                if skills[itemid].id == SKILL_MAGLEVEL then
                                    local magicRate = getRateFromTable(magicLevelStages, player:getBaseMagicLevel(), magicRateDefault)
                                    if not bonusDummy then
                                        player:addManaSpent(math.ceil(500*magicRate))
                                    else
                                        player:addManaSpent(math.ceil(500*magicRate)*1.1) -- 10%
                                    end
                                else
                                    local skillRate = getRateFromTable(skillsStages, player:getSkillLevel(skills[itemid].id), skillRateDefault)
                                    if not bonusDummy then
                                        player:addSkillTries(skills[itemid].id, 7*skillRate)
                                    else
                                        player:addSkillTries(skills[itemid].id, (7*skillRate)*1.1) -- 10%
                                    end
                                end
                                    tilePosition:sendMagicEffect(CONST_ME_HITAREA)
                                if skills[itemid].range then
                                    playerPosition:sendDistanceEffect(tilePosition, skills[itemid].range)
                                end
                                if exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES) == 0 then
                                    removeExerciseWeapon(player, exercise)
                                else
                                    local training = addEvent(startTraining, voc:getBaseAttackSpeed() / configManager.getFloat(configKeys.RATE_EXERCISE_TRAINING_SPEED), playerId,startPosition,itemid,tilePosition,bonusDummy,dummyId)
                                    player:setStorageValue(Storage.isTraining,1)
                                    player:setTraining(true)
                                end
                            else
                                removeExerciseWeapon(player, exercise)
                            end
                        end
                    end
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
                stopEvent(training)
                player:setStorageValue(Storage.isTraining,0)
                player:setTraining(false)
            end
        else
            stopEvent(training)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining, 0)
            player:setTraining(false)
        end
    else
        stopEvent(training)
        if player then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining,0)
            player:setTraining(false)
        end
    end
    return true
end

local exerciseTraining = Action()

function exerciseTraining.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local startPos = player:getPosition()
    if player:getStorageValue(Storage.isTraining) == 1 then
        player:sendTextMessage(MESSAGE_FAILURE, "You are already training.")
        return false
    end
    if target:isItem() then
        if isInArray(houseDummies,target:getId()) then
            if not skills[item.itemid].range and (startPos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You started training.")
            startTraining(player:getId(),startPos,item.itemid,target:getPosition(), true, target:getId())
        elseif isInArray(freeDummies, target:getId()) then
            if not skills[item.itemid].range and (startPos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_FAILURE, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You started training.")
            startTraining(player:getId(),startPos,item.itemid,target:getPosition(), false, target:getId())
        end
    end
    return true
end

for id = 28540, 28542 do
    exerciseTraining:id(id)
end

for id = 28543, 28545 do
    exerciseTraining:id(id)
    exerciseTraining:allowFarUse(true)
end

for id = 28552, 28554 do
    exerciseTraining:id(id)
end

for id = 28555, 28557 do
    exerciseTraining:id(id)
    exerciseTraining:allowFarUse(true)
end

for id = 35279, 35281 do
    exerciseTraining:id(id)
end

for id = 35282, 35284 do
    exerciseTraining:id(id)
    exerciseTraining:allowFarUse(true)
end

for id = 35285, 35287 do
    exerciseTraining:id(id)
end

for id = 35288, 35290 do
    exerciseTraining:id(id)
    exerciseTraining:allowFarUse(true)
end

exerciseTraining:register()
