local cleanMapAtSave = false
local function serverSave(interval)
    if cleanMapAtSave then
        cleanMap()
    end

    saveServer()
end

function onThink(interval)
    addEvent(serverSave, 60000, interval)
    return true
end