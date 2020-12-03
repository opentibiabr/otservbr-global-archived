local function scanContainer(cid, position)
    local player = Player(cid)
    if not player then
        return
    end

    local corpse = Tile(position):getTopDownItem()
    if not corpse or not corpse:isContainer() then
        return
    end

    if corpse:getType():isCorpse() and corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == cid then
        for a = corpse:getSize() - 1, 0, -1 do
            local containerItem = corpse:getItem(a)
            if containerItem then
                for b = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
                    if player:getStorageValue(b) == containerItem:getId() then
                        containerItem:moveTo(player)
                    end
                end
            end
        end
    end
end

local autoLoot = CreatureEvent("AutoLoot")
function autoLoot.onKill(player, target)
    if not target:isMonster() then
        return true
    end

    addEvent(scanContainer, 100, player:getId(), target:getPosition())
    return true
end

autoLoot:register()
