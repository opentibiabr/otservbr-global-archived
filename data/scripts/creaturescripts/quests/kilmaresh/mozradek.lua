local kill_mozradek = CreatureEvent("mozradek_kill")

function kill_mozradek.onKill(cid, target, damage, flags, corpse)
    if(isMonster(target)) then
        if(string.lower(getCreatureName(target)) == "mozradek") then
            for attackerUid, damage in pairs(target:getDamageMap()) do
                local player = Player(attackerUid)
                if player and player:getStorageValue(Storage.KilmareshQuest.Doze.Mozradek) == 1 then
                    player:setStorageValue(Storage.KilmareshQuest.Doze.Mozradek, 2)
                end
            end
        end
    end
    return true
end

kill_mozradek:register()