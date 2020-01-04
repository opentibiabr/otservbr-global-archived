local hammer = Action()

function hammer.onUse(player, item, fromPosition, target, toPosition, isHotkey)

local timeout = 2 * 60 * 1000
local targetID = target.itemid
local brokenWalls = {
    [42501] = { position = {x = 3384, y = 3523, z = 7}, fromId = 12183, toId = 6474 }, -- Position: 3384, 3523, 7
    [42502] = { position = {x = 3385, y = 3523, z = 7}, fromId = 12183, toId = 6474 }, -- Position: 3385, 3523, 7
    [42503] = { position = {x = 3386, y = 3523, z = 7}, fromId = 12185, toId = 6473 }, -- Position: 3386, 3523, 7
    [42504] = { position = {x = 3386, y = 3522, z = 7}, fromId = 12184, toId = 6473 }, -- Position: 3386, 3522, 7
    [42505] = { position = {x = 3386, y = 3521, z = 7}, fromId = 12185, toId = 6473 }, -- Position: 3386, 3521, 7
}

        -- check if has broken wall is invalid
        if brokenWalls[item.aid] then 
            return true
        end

        -- transform item if necessary
        local brokenWall = brokenWalls[item.aid]
        if item.aid == 42501 then
            target:transformTo(brokenWall.toId)
		end
    return true
end

hammer:id(3460)
hammer:register()