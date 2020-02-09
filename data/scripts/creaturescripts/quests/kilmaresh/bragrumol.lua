local kill_bragrumol = CreatureEvent("bragrumol_kill")


function kill_bragrumol.onKill(cid, target, damage, flags, corpse)
    if(isMonster(target)) then
        if(string.lower(getCreatureName(target)) == "bragrumol") then
            for attackerUid, damage in pairs(target:getDamageMap()) do
                local player = Player(attackerUid)
                if player and player:getStorageValue(Storage.KilmareshQuest.Doze.Bragrumol) == 1 then
                    player:setStorageValue(Storage.KilmareshQuest.Doze.Bragrumol, 2)
                end
            end
        end
    end
    return true
end


kill_bragrumol:register()