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

function onCastSpell(cid, var)
	local player = Player(cid)
	if not player then return false end

    if #player:getSummons() >= 1 then
        player:sendCancelMessage("You can't have other summons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    	return false
    end

    local vocationId = player:getVocation():getId()
    local summonName = nil
    if vocationId == 5 then
        summonName = "thundergiant"
    elseif vocationId == 6 then
        summonName = "grovebeast"
    elseif vocationId == 7 then
        summonName = "emberwing"
    elseif vocationId == 8 then
        summonName = "skullfrost"
    end

    if not summonName then return false end

    local mySummon = Game.createMonster(summonName, player:getPosition(), true, false)
    if not mySummon then
        return combat:execute(player, var)
    end

    player:addSummon(mySummon)
    mySummon:registerEvent('petdeath')

    local deltaSpeed = math.max(player:getBaseSpeed() - mySummon:getBaseSpeed(), 0)
    mySummon:changeSpeed(deltaSpeed)

    player:setStorageValue(Storage.PetSummon, os.time() + 15*60) -- 15 minutes from now
    player:say("My Power your Power", TALKTYPE_MONSTER_SAY)
    addEvent(removePet, 15*60*1000, mySummon:getId()) --I think this isn't necessary
    return combat:execute(player, var)
end
