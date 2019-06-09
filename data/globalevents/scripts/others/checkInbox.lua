-- <globalevent name="checkInbox" interval="30000" script="others/checkInbox.lua"/>

function onThink(interval, lastExecution)

        local registros = db.storeQuery('SELECT `player_id`, COUNT(`player_id`) FROM `player_inboxitems` GROUP BY `player_id` HAVING COUNT(`player_id`) > 10000')
        if registros ~= false then
                local count = 0
                repeat
                        local player_id = result.getNumber(registros, 'player_id')

                        db.asyncQuery('DELETE FROM `player_inboxitems` WHERE `player_id` = ' .. player_id)
                        db.asyncQuery('DELETE FROM `player` WHERE `id` = ' .. player_id)

                until not result.next(registros)
                result.free(registros)
        end

        return true
end
