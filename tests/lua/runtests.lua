lu = require('luaunit')

TestWithFailures = {}

-- Load mock files
dofile('mock/fake_player.lua')

-- Load testable files
dofile('../../data/lib/npc/player_processor_interface.lua')
dofile('../../data/lib/npc/player_validator.lua')

-- Load test files
dofile('test_player_processor_interface.lua')
dofile('test_player_validator.lua')

os.exit( lu.LuaUnit.run() )