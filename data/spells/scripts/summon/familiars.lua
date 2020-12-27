local familiar = {
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

    local vocation = familiar[player:getVocation():getClientId()]
    local familiarName
    if vocation then
        familiarName = vocation.name
    end

    if not familiarName then
        return true
    end

    local myFamiliar = Game.createMonster(familiarName, player:getPosition(), true, false)
    if not myFamiliar then
        return combat:execute(player, variant)
    end

    player:addSummon(myFamiliar)
    myFamiliar:setOutfit({lookType = player:getFamiliarLooktype()})
    myFamiliar:reload()
    myFamiliar:registerEvent("FamiliarDeath")

    local deltaSpeed = math.max(player:getBaseSpeed() - myFamiliar:getBaseSpeed(), 0)
    myFamiliar:changeSpeed(deltaSpeed)

    player:setStorageValue(Storage.PetSummon, os.time() + 15*60) -- 15 minutes from now
    player:say("My Power your Power", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 15*60*1000, myFamiliar:getId()) --I think this isn't necessary
    return combat:execute(player, variant)
end
