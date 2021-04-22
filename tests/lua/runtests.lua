lu = require('luaunit')

TestWithFailures = {}

-- Load mock files
dofile('mock/fake_player.lua')

-- Load testable files
dofile('../../data/lib/npc/player_validator.lua')
dofile('../../data/lib/npc/player_updater.lua')
dofile('../../data/lib/npc/player_processing_configs.lua')

-- Load test files
dofile('test_player_validator.lua')
dofile('test_player_updater.lua')
dofile('test_player_processing_configs.lua')

os.exit( lu.LuaUnit.run() )