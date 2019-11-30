local function removeTeleport(position)
    local teleportItem = Tile(Position(33496,32070,8)):getItemById(1387)
    if teleportItem then
        teleportItem:remove()
        position:sendMagicEffect(CONST_ME_POFF)
    end
end

local kill_ravager = CreatureEvent("ravager_kill")
function kill_ravager.onKill(creature, target)
    if target:isPlayer() or target:getMaster() or target:getName():lower() ~= "the ravager" then
        return true
    end

    local position = target:getPosition()
    position:sendMagicEffect(CONST_ME_TELEPORT)
    local item = Game.createItem(1387, 1, Position(33496,32070,8))
    if item:isTeleport() then
        item:setDestination(Position(33459,32083,8))
    end
	if creature:getStorageValue(Storage.DarkTrails.Mission11) < 1 then	
		creature:setStorageValue(Storage.DarkTrails.Mission11, 1)
	end
    addEvent(removeTeleport, 5 * 60 * 1000, position)
    return true
end

kill_ravager:register()