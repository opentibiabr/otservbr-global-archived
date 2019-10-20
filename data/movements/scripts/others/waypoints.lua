local WINDOW_ID = 4203
local BUTTON_ACCEPT = 0
local BUTTON_CLOSE = 1

local WAYPOINTS_QUESTLINE = Storage.Waypoints.QuestLine
local WAYPOINTS_COMPLETION = Storage.Waypoints.Completion
local WAYPOINTS_SECRET = Storage.Waypoints.Secret
local TELEPORTS = Storage.Waypoints.Teleporters

local WAYPOINTS = {
    [1] = { name = "Venore", position = Position(32957, 32076, 7) }, -- 41876
    [2] = { name = "Thais", position = Position(32369, 32234, 7) }, -- 41877
    [3] = { name = "Kazordoon", position = Position(32644, 31925, 11) }, -- 41878
    [4] = { name = "Carlin", position = Position(32360, 31782, 7) }, -- 41879
    [5] = { name = "Ab\'Dendriel", position = Position(32732, 31630, 7) }, -- 41880
    [6] = { name = "Liberty Bay", position = Position(32317, 32828, 7) }, -- 41881
    [7] = { name = "Port Hope", position = Position(32595, 32742, 7) }, -- 41882
    [8] = { name = "Ankrahmun", position = Position(33195, 32851, 4) }, -- 41883
    [9] = { name = "Darashia", position = Position(33213, 32454, 1) }, -- 41884
    [10] = { name = "Edron", position = Position(33217, 31814, 8) }, -- 41885
    [11] = { name = "Svargrond", position = Position(32212, 31133, 7) }, -- 41886
    [12] = { name = "Yalahar", position = Position(32792, 31272, 7) }, -- 41887
    [13] = { name = "Farmine", position = Position(33028, 31523, 11) }, -- 41888
    [14] = { name = "Gray Beach", position = Position(33447, 31321, 9) }, -- 41889
    [15] = { name = "Roshamuul", position = Position(33513, 32363, 6) }, -- 41890
    [16] = { name = "Rathleton", position = Position(33594, 31899, 4) }, -- 41891
    [17] = { name = "Training Arena", position = Position(32527, 32337, 7) }, -- 41892
}

local NUMBER_OF_WAYPOINTS = table.getn(WAYPOINTS);

local SECRET_WAYPOINT_CHOICE_ID = 100
local SECRET_WAYPOINT = { name = "???", position = Position(32542, 32295, 7) }

function startWaypointQuest(player)
    if player:getStorageValue(WAYPOINTS_QUESTLINE) ~= 1 then
        player:setStorageValue(WAYPOINTS_QUESTLINE, 1)
    end
end

function updateWaypointQuestCompletion(player)
    if player:getStorageValue(WAYPOINTS_COMPLETION) <= 0 then
        player:setStorageValue(WAYPOINTS_COMPLETION, 1);
    else
        player:setStorageValue(WAYPOINTS_COMPLETION, player:getStorageValue(WAYPOINTS_COMPLETION) + 1)
    end

    if player:getStorageValue(WAYPOINTS_COMPLETION) >= NUMBER_OF_WAYPOINTS and player:getStorageValue(WAYPOINTS_SECRET) < 1 then -- Player completed quest
        player:setStorageValue(WAYPOINTS_SECRET, 1)
    end
end

function onStepIn(player, item, position, fromPosition)
    if not player:isPlayer() or fromPosition:getDistance(position) ~= 1 then
        return true
    end

    for i = 1, #WAYPOINTS do
        local waypoint = WAYPOINTS[i]
        if position == waypoint.position and player:getStorageValue(TELEPORTS + i) ~= 1 then
            player:setStorageValue(TELEPORTS + i, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, waypoint.name .. " waypoint unlocked!")

            startWaypointQuest(player)
            updateWaypointQuestCompletion(player)

            return true
        end
    end

    local empty = true
    for i = 1, #WAYPOINTS do
        local waypoint = WAYPOINTS[i]
        if position == waypoint.position and player:getStorageValue(TELEPORTS + i) == 1 then
            empty = false
            break
        end

        if position == SECRET_WAYPOINT.position then
            empty = false
        end
    end

    if not empty then
        player:registerEvent("WaypointsModal")

        local title = "Waypoints"
        local message = "Choose your destination."

        local window = ModalWindow(WINDOW_ID, title, message)

        window:addButton(BUTTON_ACCEPT, "Teleport")
        window:addButton(BUTTON_CLOSE, "Close")

        for i = 1, #WAYPOINTS do
            local waypoint = WAYPOINTS[i]
            if player:getStorageValue(TELEPORTS + i) == 1 then
                window:addChoice(i, waypoint.name)
            end
        end

        if player:getStorageValue(WAYPOINTS_SECRET) == 1 then -- Player just completed quest
            window:addChoice(SECRET_WAYPOINT_CHOICE_ID, "???")
        end

        window:setDefaultEnterButton(BUTTON_ACCEPT)
        window:setDefaultEscapeButton(BUTTON_CLOSE)

        window:sendToPlayer(player)
    end
end

function onWaypointsModal(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("WaypointsModal")

    if modalWindowId == WINDOW_ID then
        if buttonId == BUTTON_ACCEPT then
            if player:getStorageValue(TELEPORTS + choiceId) == 1 then
                player:teleportTo(WAYPOINTS[choiceId].position)
                WAYPOINTS[choiceId].position:sendMagicEffect(CONST_ME_TELEPORT)
            end

            if choiceId == SECRET_WAYPOINT_CHOICE_ID and player:getStorageValue(WAYPOINTS_SECRET) == 1 then
                player:teleportTo(SECRET_WAYPOINT.position)
                SECRET_WAYPOINT.position:sendMagicEffect(CONST_ME_TELEPORT)

                player:setStorageValue(WAYPOINTS_SECRET, 2)
            end
        end
    end
end
