lu = require('luaunit')

TestWithFailures = {}

-- Load lib files
dofile('lib/asserts.lua')
dofile('lib/utils.lua')

-- Load mock files
dofile('mock/fake_player.lua')

-- Load testable files
dofile('../../data/lib/npc/npc_interaction_2.lua')
dofile('../../data/lib/npc/player_validator.lua')
dofile('../../data/lib/npc/player_updater.lua')
dofile('../../data/lib/npc/player_processing_configs.lua')

-- Load test files
dofile('test_npc_interaction.lua')
dofile('test_npc_messages.lua')
dofile('test_npc_topic.lua')
dofile('test_player_processing_configs.lua')
dofile('test_player_updater.lua')
dofile('test_player_validator.lua')

os.exit( lu.LuaUnit.run() )