local summon = {
    [VOCATION.CLIENT_ID.SORCERER] = {name = "Sorcerer familiar"},
    [VOCATION.CLIENT_ID.DRUID] = {name = "Druid familiar"},
    [VOCATION.CLIENT_ID.PALADIN] = {name = "Paladin familiar"},
    [VOCATION.CLIENT_ID.KNIGHT] = {name = "Knight familiar"}
}

function removePet(creatureId)
    local creature = Creature(creatureId)
    if not creature then
        return true
    end

    creature:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)

local area = createCombatArea(AREA_CIRCLE1X1)
setCombatArea(combat, area)

function onCastSpell(player, variant)
    if not player or not isPremium(player) then
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You need a premium account.")
        return false
    end

    if #player:getSummons() >= 1 then
        player:sendCancelMessage("You can't have other summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local vocation = summon[player:getVocation():getClientId()]
    local summonName = nil
    if vocation then
        summonName = vocation.name
    end

    if not summonName then
        return true
    end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, false)
    if not mySummon then
        return combat:execute(player, variant)
    end

    player:addSummon(mySummon)
    mySummon:setOutfit({lookType = player:getFamiliarLooktype()})
    mySummon:reload()
    mySummon:registerEvent("SummonDeath")

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
    mySummon:changeSpeed(deltaSpeed)

    player:setStorageValue(Storage.PetSummon, os.time() + 15*60) -- 15 minutes from now
    player:say("My Power your Power", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 15*60*1000, mySummon:getId()) --I think this isn't necessary
    return combat:execute(player, variant)
end
