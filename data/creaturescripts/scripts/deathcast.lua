function onKill(cid, target, lastHit)
if isPlayer(target) == TRUE then
Game.broadcastMessage("[".. getCreatureName(cid) .."] acabou de matar o [" .. getCreatureName(target) .. "]", MESSAGE_EVENT_ADVANCE) 

end
return TRUE
end