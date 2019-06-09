if not warzoneConfig then
    warzoneConfig = {

        [45700] = {
            center = Position(33110, 31965, 10),
            maxRangeX = 12, minRangeX = 26, minRangeY = 15, maxRangeY = 17,
            bossResp = Position(33102, 31956, 10),
            boss = "Deathstrike",
            teleportTo = Position(33096, 31955, 10),
            locked = false,
            storage = Storage.BigfootBurden.BossWarzone1,
            interval = 20 * 60 * 60,
            exit = Position(33001, 31900, 9)
        },


        [45701] = {  -- action do movement

            center = Position(33117, 31956, 11),   -- centro da room do boss
            maxRangeX = 14, minRangeX = 14, minRangeY = 14, maxRangeY = 14,

            bossResp = Position(33116, 31956, 11),
            boss = "Gnomevil",   -- nome do boss
            teleportTo = Position(33106, 31955, 11),
            locked = false,

            storage = Storage.BigfootBurden.BossWarzone2,    -- storage
            interval = 20 * 60 * 60,

            exit = Position(33001, 31900, 9),   -- Exit padrão

            wall = 18459 -- id dos crystais atuais na warzone 2 (abrir matando parasite)
        },


        [45702] = {  -- action do movement
            center = Position(33090, 31910, 12),
            maxRangeX = 12, minRangeX = 12, minRangeY = 12, maxRangeY = 12,

            bossResp = Position(33088, 31910, 12),
            boss = "Abyssador",   -- nome do boss
            teleportTo = Position(33083, 31904, 12),  -- Local onde o player será teleportado dentro da room
            locked = false,

            storage = Storage.BigfootBurden.BossWarzone3,    -- storage
            interval = 20 * 60 * 60,

            exit = Position(33001, 31900, 9)   -- Exit padrão
        }
    }

    warzoneConfig.spawnBoss = function (name, pos)
    local boss = Game.createMonster(name, pos)
    if boss then
        local c = warzoneConfig.findByName(name)
        c.locked = true
        boss:registerEvent('WarzoneBossDeath')
        end
    end
    warzoneConfig.findByName = function(name, last)
        local i, v = next(warzoneConfig, last)
        if type(v) == 'table' and v.boss == name then
            return v
        elseif not i then
            return nil
        end
        return warzoneConfig.findByName(name, i)
    end

    warzoneConfig.resetRoom = function(roomInfo, msg, releaseRoom)
        if releaseRoom then
            roomInfo.locked = false
        end

        local spectators = Game.getSpectators(roomInfo.center, false, false, roomInfo.minRangeX, roomInfo.maxRangeX, roomInfo.minRangeY, roomInfo.maxRangeY)
        for i = 1, #spectators do
            if spectators[i]:isPlayer() then
                spectators[i]:teleportTo(roomInfo.exit)
                spectators[i]:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
            else
                spectators[i]:remove()
            end
        end
    end
end

local function filter(list, f, i)
    if i < #list then
        if f(list[i]) then
            return list[i], filter(list, f, i + 1)
        else
            return filter(list, f, i + 1)
        end
    elseif list[i] and f(list[i]) then
        return list[i]
    end
end

local function spawnBoss(inf)
    local boss = Game.createMonster(inf.boss, inf.bossResp)
    boss:registerEvent('WarzoneBossDeath')
end

function onStepIn(creature, item, pos, fromPosition)
    if not creature:isPlayer() then
        creature:teleportTo(fromPosition)
        return false
    end

    local info = warzoneConfig[item:getActionId()]
    if not info then
        return false
    end

    if  creature:getStorageValue(info.storage) > os.time() then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have already cleared this warzone in the last 20 hours.")
        creature:teleportTo(fromPosition)
        return false
    end

    if info.locked then
        creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Please, wait until the room is cleared. This happens 30 minutes after the last team entered.")
        creature:teleportTo(fromPosition)
        return true
    end

    creature:teleportTo(info.teleportTo)
    creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have half an hour to heroically defeat the " .. info.boss .. ". Otherwise you'll be teleported out by the gnomish emergency device." )

    return true
end
