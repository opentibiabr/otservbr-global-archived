local npcType = Game.createNpcType("A Beggar")
local npc = {}

npc.name = "A Beggar"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 153,
    lookHead = 39,
    lookBody = 39,
    lookLegs = 39,
    lookFeet = 76,
    lookAddons = 0
}

npc.flags = {
    attackable = false,
    hostile = false,
    floorchange = false
}

npcType.onThink = function(npc, interval)
end

npcType.onAppear = function(npc, creature)
end

npcType.onDisappear = function(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    local player = creature:getPlayer()
    if player then
        if npc:greet(message, player, "Hi! What is it, what d'ye {want}?") then
            return true
        elseif npc:unGreet(message, player) then
            return true
        end

        if npc:isInteractingWithPlayer(player) then
            if msgContains(message, "want") then
                if player:getStorageValue(Storage.DarkTrails.Mission01) == 1 then
                    npc:talk(player, "The guys from the magistrate sent you here, didn't they?", cid)
                    -- Add topic of the "yes" message
                    npc:addTopicMessage(player, 1)
                end
            elseif msgContains(message, "yes")  then
                -- Get topic of the "want" message
                if npc:isTopicMessage(player, 1) then
                    npc:talk(player, {
                        "Thought so. You'll have to talk to the king though. The beggar king that is. The king does not grant an audience to just everyone. You know how those kings are, don't you? ... ",
                        "However, to get an audience with the king, you'll have to help his subjects a bit. ... ",
                        "His subjects that would be us, the poor, you know? ... ",
                        "So why don't you show your dedication to the poor? Go and help Chavis at the poor house. He's collecting food for people like us. ... ",
                        "If you brought enough of the stuff you'll see that the king will grant you entrance in his {palace}."
                    })
                    player:setStorageValue(Storage.DarkTrails.Mission01, 2) -- Mission 1 end
                    player:setStorageValue(Storage.DarkTrails.Mission02, 1) -- Mission 2 start
                    -- Remove topic of "want" message
                    npc:removeTopicMessage(player)
                end
            end
        end
    end
end

npcType:register(npc)
