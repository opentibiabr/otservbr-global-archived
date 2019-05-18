local config = {
    position = {fromPosition = Position(33330, 31670, 7), toPosition = Position(33350, 31690, 7)}
}
local monsters = {'wereboar', 'werebadger'} -- monstros que vão nascer em tal dia...
local spawnDay = 13
local currentDay = os.date("%d")

function Game.createRandom(position)
    local tile = Tile(position)
    if not tile or Tile(position):getItemById(3139) then
        return false
    end

    local ground = tile:getGround()
    if not ground or ground:hasProperty(CONST_PROP_BLOCKSOLID) or tile:getTopCreature() then
        return false
    end
	local monsterName = monsters[math.random(#monsters)]
	local monster = Game.createMonster(monsterName, position)
	if monster then
		monster:setSpawnPosition()
		monster:remove() -- tem que remover senão nascem 2... mas como o respawn é rápido ninguém percebe
	end
    return true
end
function onStartup()
	local contador = 1
	if spawnDay == tonumber(currentDay) then
	for x = config.position.fromPosition.x, config.position.toPosition.x do
		for y = config.position.fromPosition.y, config.position.toPosition.y do
				if math.random(1000) >= 983 then
					if Game.createRandom(Position(x, y, 7)) then
						--
					end
				end
			end
		end
	else
	local	monsters = {'bandit', 'badger', 'blue butterfly', 'yellow butterfly'}
	for x = config.position.fromPosition.x, config.position.toPosition.x do
		for y = config.position.fromPosition.y, config.position.toPosition.y do
				if math.random(1000) >= 983 then
					if Game.createRandom(Position(x, y, 7)) then
						 --
					end
				end
			end
		end
	end
	return true
end