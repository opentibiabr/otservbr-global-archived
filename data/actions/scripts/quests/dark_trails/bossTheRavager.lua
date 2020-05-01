local config = {
        requiredLevel = 100,
        daily = false,
        centerBossRoomPosition = Position(33487, 32079, 8),
        playerPositions = {
                Position(33417, 32102, 10),
                Position(33418, 32102, 10),
                Position(33419, 32102, 10),
                Position(33420, 32102, 10)
        },
        newPositions = {
                Position(33487, 32088, 8),
                Position(33487, 32088, 8),
                Position(33487, 32088, 8),
                Position(33487, 32088, 8)
        },
        CanopicJarPositions = {
                Position(33486, 32081, 8),
                Position(33488, 32081, 8),
                Position(33486, 32083, 8),
                Position(33488, 32083, 8)
        }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
        if item.itemid == 1946 then
                local storePlayers, playerTile = {}

                for i = 1, #config.playerPositions do
                        playerTile = Tile(config.playerPositions[i]):getTopCreature()
                        if not playerTile or not playerTile:isPlayer() then
                                player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 4 players.")
                              return true
                        end

                        if playerTile:getLevel() < config.requiredLevel then
                             player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level ".. config.requiredLevel .." or higher.")
                                return true
                        end

                        storePlayers[#storePlayers + 1] = playerTile
                end

                local specs, spec = Game.getSpectators(config.centerBossRoomPosition, false, false, 9, 9, 10, 10)
                for i = 1, #specs do
                        spec = specs[i]
                        if spec:isPlayer() then
                                player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
                                return true
                        end

                        if spec:isPlayer() then
                                spec:teleportTo(Position(33420, 32105, 10))
                        elseif spec:isMonster() then
                                spec:remove()
                        end
                end

                for i = 1, #config.CanopicJarPositions do
                        Game.createMonster("Greater Canopic Jar", config.CanopicJarPositions[i])

                end
        Game.createMonster("The Ravager", Position(33487, 32082, 8))

                local players
                for i = 1, #storePlayers do
                        players = storePlayers[i]
                        config.playerPositions[i]:sendMagicEffect(CONST_ME_POFF)
                        players:teleportTo(config.newPositions[i])
                        config.newPositions[i]:sendMagicEffect(CONST_ME_ENERGYAREA)
                end
        elseif item.itemid == 1945 then
                if config.daily then
                        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
                        return true
                end
        end

        if not config.daily then 
            item:transform(item.itemid == 1946 and 1945 or 1946)
        end
        return true
end