dofile('data/modules/scripts/blessings/blessings.lua')

function onLogin(cid)
    local player = Player(cid)
    return Blessings.doAdventurerBlessing(player)
end
