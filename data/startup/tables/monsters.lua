MonsterList = {}

local mapMonsters = 'data/world/otservbr-spawn.xml'
local cachedMonsters = 'data/modules/scripts/prey_system/preyMonsters.txt'
local monstersCountStorage = retrieveGlobalStorage(GlobalStorage.PreyMonster.Count)

function getMonstersCount()
    local file = io.open(mapMonsters, "rb")
    local fileRead = file:read("*all")
    file:close()
    local monstersCount = 0

    for monster in fileRead:gmatch('<monster name="(.-)"') do
        monstersCount = monstersCount + 1
    end

    return monstersCount
end

local monstersCount = getMonstersCount()

function loadMonstersList()
    local timeStart = os.time()
    local file = io.open(mapMonsters, "rb")
	local fileRead = file:read("*all")
    local cMonsters = io.open(cachedMonsters, "w+")
	file:close()

    for monster in fileRead:gmatch('<monster name="(.-)"') do
        if not table.contains(MonsterList, monster) then
            table.insert(MonsterList, monster)
            cMonsters:write(monster .. "\n")
        end
    end
    cMonsters:close()
    local timeEnd = os.time()
    updateGlobalStorage(GlobalStorage.PreyMonster.Count, monstersCount)

    print(">> Prey Monsters loading time: " .. os.difftime(timeEnd, timeStart) .. " seconds")
end

function fileExists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
  end

function loadCached()
    local timeStart = os.time()
    local file = io.open(cachedMonsters, "rb")
    
    for monster in file:lines() do
        table.insert(MonsterList, monster)
    end
    file:close()

    local timeEnd = os.time()
    print(">> Prey Monsters loading time: " .. os.difftime(timeEnd, timeStart) .. " seconds")
end

if (monstersCount ~= monstersCountStorage or not fileExists(cachedMonsters)) then
    loadMonstersList()
else
    loadCached()
end
