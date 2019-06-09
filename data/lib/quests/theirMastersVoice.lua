local config = {
    quest_duration = 60, -- how long until quest is reverted, in minutes
    slime_exhaust = 5, --  exhaust until you can remove another slime, in seconds
    slimes_needed = 25, -- slimes needed to be removed to kill mad mage and complete quest
    max_slimes = 100, -- max slimes needed to start waves
    max_waves = 25 -- max waves, last one will be mad mage
}

local mage_positions = { Position(33328, 31859, 9), Position(33367, 31873, 9), Position(33349, 31899, 9) }
local servant_positions = {
	Position(33313, 31852, 9), Position(33313, 31881, 9), Position(33328, 31860, 9), Position(33328, 31873, 9), Position(33328, 31885, 9),
	Position(33308, 31873, 9), Position(33320, 31873, 9), Position(33335, 31873, 9), Position(33360, 31873, 9), Position(33336, 31914, 9),
	Position(33343, 31914, 9), Position(33353, 31914, 9), Position(33361, 31914, 9), Position(33345, 31900, 9), Position(33352, 31900, 9),
	Position(33355, 31854, 9), Position(33355, 31885, 9), Position(33345, 31864, 9), Position(33345, 31881, 9), Position(33309, 31867, 9),
	Position(33317, 31879, 9), Position(33311, 31854, 9), Position(33334, 31889, 9), Position(33340, 31890, 9), Position(33347, 31889, 9)
}

local slime_ids = {13585, 13586, 13587, 13588, 13589}
local servants = { {10, "diamond servant"}, {40, "golden servant"}, {100, "iron servant"} }

slime_exhaust = slime_exhaust or {}
slimes_removed = slimes_removed or {}
current_servants = current_servants or {}
current_mage = current_mage or 0
current_wave = current_wave or 0
valid_participants = valid_participants or {}

function startServantWave()
    current_wave = current_wave + 1
    if current_wave == config.max_waves then
        local mage = Game.createMonster("Mad Mage", mage_positions[math.random(#mage_positions)], true, true)
        if mage then
            mage:registerEvent("Mage_Death")
        end
        return
    end

    current_servants = {}
    for pos_key = 1, #servant_positions do
        local random = math.random(100)
        for servant_key = 1, #servants do
            if random <= servants[servant_key][1] then
                local servant = Game.createMonster(servants[servant_key][2], servant_positions[pos_key], true, true)
                if servant then
                    current_servants[#current_servants + 1] = servant.uid
                    servant:registerEvent("Servant_Death")
                    break
                end
            end
        end
    end
end

function revertQuest()
    for i = 1, #current_servants do
        local servant = Creature(current_servants[i])
        if servant then
            servant:remove()
        end
    end
    current_servants = {}

    local mage = Creature(current_mage)
    if mage then
        mage:remove()
    end
    current_mage = 0

    for i = 1, #slimes_removed do
        local ground = Tile(slimes_removed[i].pos):getGround()
        if ground then
            ground:transform(slimes_removed[i].id)
        end
    end
    slimes_removed = {}
    current_wave = 0
end

function Gobbler_onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not isInArray(slime_ids, target.itemid) then
        return false
    end

	local time = os.time()
	if slime_exhaust[player.uid] and slime_exhaust[player.uid] >= os.time() then
        player:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    slime_exhaust[player.uid] = time + config.slime_exhaust
    player:say("The slime gobbler gobbles large chunks of the slime fungus with great satisfaction.", TALKTYPE_MONSTER_SAY)
    player:addExperience(20, true, true)
    slimes_removed[#slimes_removed + 1] = {cid = player.uid, id = target.itemid, pos = toPosition}
    target:transform(13590)

    if not isInArray(valid_participants, player.uid) then
        local slime_count = 0
        for i = 1, #slimes_removed do
            if slimes_removed[i].cid == player.uid then
                slime_count = slime_count + 1
                if slime_count == 25 then
                    player:say("You gobbled enough slime to get a good grip on this dungeon's slippery floor.", TALKTYPE_MONSTER_SAY)
                    valid_participants[#valid_participants + 1] = player.uid
                    break
                end
            end
        end
    end

    if #slimes_removed == 1 then
        addEvent(revertQuest, config.quest_duration * 60 * 1000)
    elseif #slimes_removed >= config.max_slimes then
        player:say("COME! My servants! RISE!", TALKTYPE_MONSTER_SAY)
        startServantWave()
    end
    return true
end

function Servant_onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    for i = 1, #current_servants do
        if current_servants[i] == creature.uid then
            table.remove(current_servants, i)
            break
        end
    end

    if #current_servants < 1 then
        startServantWave()
    end
    return true
end

function Mage_onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified)
    if killer and isInArray(valid_participants, killer.uid) then
        -- add achievements if needed
    end
    revertQuest()
    return true
end
