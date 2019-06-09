local explodeCD = 18 --in seconds
local minionCD = {}

local function minionExplode(monster)
if not monster:isMonster() then return end
local cid = monster:getId()
local cd = minionCD[cid]

    if not cd then
        minionCD[cid] = 1
        return
    end

    if cd >= explodeCD then
        local monsterPos = monster:getPosition()
        Game.createMonster("Overcharged Disruption", monsterPos, false, true)
        monster:remove()
    else
        minionCD[cid] = cd + 1
    end
end

function onThink(monster)
	minionExplode(monster)
end
