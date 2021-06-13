Spectators = {}
setmetatable(Spectators, {
	__call = function(self)
		local spectators_data = {
            player_capture = true,
            monster_capture = true,
            remove_monsters = true,
            check_pos_func = function() return true end,
            creature_detect = {}
		}
		return setmetatable(spectators_data, {__index = Spectators})
	end
})


function Spectators.getPlayerCapture(self)
    return self.player_capture
end

function Spectators.getMonsterCapture(self)
    return self.monster_capture
end

function Spectators.getRemovePlayers(self)
    return self.remove_players
end

function Spectators.getRemoveMonsters(self)
    return self.remove_monsters
end

function Spectators.getCreatureDetect(self)
    return self.creature_detect
end

function Spectators.setPlayerCapture(self, boolean)
    self.player_capture = boolean
end

function Spectators.setMonsterCapture(self, boolean)
    self.monster_capture = boolean
end

function Spectators.setRemovePlayers(self, boolean)
    self.remove_players = boolean
end

function Spectators.setRemoveMonsters(self, boolean)
    self.remove_monsters = boolean
end

function Spectators.addCreatureDetect(self, creature)
    table.insert(self.creature_detect, creature)
end

function Spectators.removeCreatureDetect(self)
    self.creature_detect = {}
end

function Spectators.setRemoveDestination(self, destination)
    self.remove_destination = destination
end

function Spectators.getRemoveDestination(self)
    return self.remove_destination
end

function Spectators.setCheckPosFunc(self, func)
    self.check_pos_func = func
end

function Spectators.getCheckPosFunc(self, ...)
    return self.check_pos_func(...)
end

function Spectators.setCheckPosition(self, position)
    if position.from ~= nil and position.to ~= nil then
        self.check_position = position
    else
        error('Dont have "from" or "to" position.')
    end
end

function Spectators.getCheckPosition(self)
    return self.check_position
end

function Spectators.checkCreaturesPos(self, creatures)
    local boolean = false
    for i, v in pairs(creatures) do
        if self:getPlayerCapture() then
            if v:isPlayer() then
                self:addCreatureDetect(v)
                boolean = true
            end
        end
        if self:getMonsterCapture() then
            if v:isMonster() then
                self:addCreatureDetect(v)
                boolean = true
            end
        end
    end
    return boolean
end

function Spectators.removeMonsters(self)
    if self:getRemoveMonsters() then
        if self:getCreatureDetect() then
            for i, v in pairs(self:getCreatureDetect()) do
                if v:isMonster() then
                    v:remove()
                end
            end
        end
    else
        return error("RemoveMonsters is set false.")
    end
end

function Spectators.removePlayers(self, players)
    if self:getRemovePlayers() then
        local creature_remove
        if players ~= nil then
            creature_remove = players
        else
            creature_remove = self:getCreatureDetect()
        end
        if creature_remove then
            for i, v in pairs(creature_remove) do
                if v:isPlayer() then
                    local destination = self:getRemoveDestination()
                    if destination then
                        v:teleportTo(destination)
                    else
                        v:teleportTo(v:getTown():getTemplePosition())
                        v:remove()
                    end
                end
            end
        end
    else
        return error("RemovePlayers is set false.")
    end
end

function Spectators.checkFromToPos(self, from, to)
    if from ~= nil and to ~= nil then
        local position = {
            from = from,
            to = to
        }
        self:setCheckPosition(position)
    else
        if self:getCheckPosition() ~= nil then
            from = self:getCheckPosition().from
            to = self:getCheckPosition().to
        else
            error('Dont have "from" or "to" position.')
        end
    end
    local boolean = false
    for x = from.x, to.x do
        for y = from.y, to.y do
            for z = from.z, to.z do
                local tile = Tile(Position(x, y, z))
                local creatures = tile:getCreatures()
                if not self:getRemoveDestination() then
                    if tile:getTopTopItem() then
                        if tile:getTopTopItem():isTeleport() then
                            self:setRemoveDestination(Teleport(tile:getTopTopItem():getUniqueId()):getDestination())
                        end
                    end
                end
                if creatures then
                    if self:checkCreaturesPos(creatures) then
                        boolean = true
                    end
                end
                self:getCheckPosFunc(tile)
            end
        end
    end
    return boolean
end

function Spectators.getPlayers(self)
    local count = 0
    if not self:getCreatureDetect() then
        error('Not creature detect')
        return nil
    end
    for i, v in pairs(self:getCreatureDetect()) do
        if self:getPlayerCapture() then
            if v:isPlayer() then
                count = count + 1
            end
        end
    end
    return count
end

function Spectators.clearCreaturesCache(self)
    self:removeCreatureDetect()
end