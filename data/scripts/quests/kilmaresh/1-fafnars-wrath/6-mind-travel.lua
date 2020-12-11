local brainPositions = {
	{x = 33913, y = 31653, z = 9}, -- left
	{x = 33921, y = 31650, z = 9}  -- right
}

local mirrorTeleportPositions = {
    {x = 33899, y = 31644, z = 9}, -- left
	{x = 33936, y = 31648, z = 9}  -- right
}

local templeCenter = { x = 33865, y = 31533, z = 7 }
local templeRadiusX = 8
local templeRadiusY = 7

local chargedRingOfSecretThoughtsItemId = 36141

-- Hallucinogen's potion

local potion = Action()

function potion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getSlotItem(CONST_SLOT_RING) and player:getSlotItem(CONST_SLOT_RING):getId() == chargedRingOfSecretThoughtsItemId then
		local spectators = Game.getSpectators(templeCenter, false, true, templeRadiusX, templeRadiusX, templeRadiusY, templeRadiusY)

		for i = 1, #spectators do
			if spectators[i].uid == player.uid then
				player:teleportTo(brainPositions[math.random(#brainPositions)])
				item:remove(1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You feel shaky and dizzy, the world turns dark around you. Then your sight clears again - and you are somewhere else.")
				return true
			end
		end
	end

	return false
end

potion:id(36185)
potion:register()


-- Mirror neuron

local leftMirror = MoveEvent()

function leftMirror.onStepIn(creature)
    if creature:isPlayer() then
        creature:teleportTo(mirrorTeleportPositions[2])
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were moved to the right brain side")
        return true
    end

    return false
end

leftMirror:uid(57505)
leftMirror:register()


local rightMirror = MoveEvent()

function rightMirror.onStepIn(creature)
	if creature:isPlayer() then
		creature:teleportTo(mirrorTeleportPositions[1])
        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE,  "You were moved to the left brain side")
        return true
	end

    return false
end

rightMirror:uid(57506)
rightMirror:register()


-- Memories

local memoriesWords = {
    "The Ambassador tells another dignitary: Rathleton must never be surpassed! I will procure that the Empire falters!",
    "Through a dimensional gate you can see the Ambassador of Rathleton wearing a cloak with a black sphinx on it.",
    "Through a dimensional gate you can see how the Ambassador of Rathleton is talking to Fafnar cultists in a quite familiar way. The proof is absolutely substantive. The Ambassador is a betrayer!"
}

local memoryShardsItemIdsBitmasks = {
    [36189] = 1,
    [36190] = 2,
    [36191] = 4
}

local memoryShards = Action()

function memoryShards.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local memoryStorage = player:getStorageValue(Storage.Kilmaresh.Fifth.Memories)
    local memoriesShardsStorage = player:getStorageValue(Storage.Kilmaresh.Fifth.MemoriesShards)
    local hasUsedShard = testFlag(memoriesShardsStorage, memoryShardsItemIdsBitmasks[item:getId()])

    if memoryStorage >= 1 and -- following the quest
        not hasUsedShard and -- making sure we don't use the same shard twice
        target.uid == 57507 -- is it the shrine?
    then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, memoriesWords[memoryStorage])
        player:setStorageValue(Storage.Kilmaresh.Fifth.Memories, memoryStorage + 1)
        player:setStorageValue(Storage.Kilmaresh.Fifth.MemoriesShards, setFlag(memoriesShardsStorage, memoryShardsItemIdsBitmasks[item:getId()]))
        return true
    end
    return false
end

memoryShards:id(36189, 36190, 36191) -- Green, blue and purple memory shards
memoryShards:register()