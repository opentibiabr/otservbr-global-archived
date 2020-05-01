local config = {
        requiredLevel = 100,
        centerBossRoomPosition = Position(33487, 32111, 9),
        playerPositions = {
                Position(33583, 31844, 10),
                Position(33584, 31844, 10),
                Position(33585, 31844, 10),
                Position(33586, 31844, 10),
                Position(33587, 31844, 10)
        },
        newPositions = {
                Position(33486,32120,9),
                Position(33486,32120,9),
                Position(33486,32120,9),
                Position(33486,32120,9),
                Position(33486,32120,9)
        },
        GreaterDeathMinionPositions = {
                Position(33482, 32105, 9),
                Position(33484, 32105, 9),
                Position(33484, 32107, 9),
                Position(33481, 32109, 9),
                Position(33482, 32111, 9),
                Position(33488, 32106, 9),
                Position(33490, 32106, 9),
                Position(33492, 32109, 9),
                Position(33492, 32112, 9),
                Position(33490, 32112, 9)
        }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
        if item.itemid == 1946 then
                local storePlayers, playerTile = {}

                for i = 1, #config.playerPositions do
                        playerTile = Tile(config.playerPositions[i]):getTopCreature()
                        if not playerTile or not playerTile:isPlayer() then
                                player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need 5 players.")
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
                                spec:teleportTo(Position(33585, 31847, 10))
                        elseif spec:isMonster() then
                                spec:remove()
                        end
                end

                for i = 1, #config.GreaterDeathMinionPositions do
                        Game.createMonster("Greater Death Minion", config.GreaterDeathMinionPositions[i])

                end
                        Game.createMonster("Death Priest Shargon", Position(33487, 32108, 9))

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

        item:transform(item.itemid == 1946 and 1945 or 1946)
        return true
end