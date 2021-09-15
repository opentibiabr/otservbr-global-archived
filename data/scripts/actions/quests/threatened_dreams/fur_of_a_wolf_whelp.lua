local furWolf = Action()
function furWolf.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if (player:getStorageValue(Storage.ThreatenedDreams.TroubledMission01) == 9) then
        if (target.itemid == 25237)then
            target:decay()
            item:remove(1)
            toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
            player:setStorageValue(Storage.ThreatenedDreams.TroubledMission01, 10)
            return true
        end
    else
        player:sendCancelMessage("You are not on that mission.")
    end

	return true
end

furWolf:id(25238)
furWolf:register()
