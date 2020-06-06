local setting = {
	[VOCATION.ID.MASTER_SORCERER] = {name = "thundergiant"},
	[VOCATION.ID.ELDER_DRUID] = {name = "grovebeast"},
	[VOCATION.ID.ROYAL_PALADIN] = {name = "emberwing"},
	[VOCATION.ID.ELITE_KNIGHT] = {name = "skullfrost"}
}

function removePet(creatureId)
    local c = Creature(creatureId)
    if not c then return false end

    c:remove()
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)

local area = createCombatArea(AREA_CIRCLE1X1)
setCombatArea(combat, area)

function onCastSpell(player, variant)
	if not player then return false end

    if #player:getSummons() >= 1 then
        player:sendCancelMessage("You can't have other summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return false
    end

    local vocationId = setting[player:getVocation():getId()]
    local summonName = nil
    if vocationId then
        summonName = vocationId.name
    end

    if not summonName then return false end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, false, player)
    if not mySummon then
        return combat:execute(player, variant)
    end

    player:addSummon(mySummon)
    mySummon:registerEvent("SummonDeath")

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
    mySummon:changeSpeed(deltaSpeed)

    player:setStorageValue(Storage.PetSummon, os.time() + 15*60) -- 15 minutes from now
    player:say("My Power your Power", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 15*60*1000, mySummon:getId()) --I think this isn't necessary
    return combat:execute(player, variant)
end
