lionrock = {
    items = {
        nflower = 23759,
        flower = 23760,
        holywater = 23835,

        tongue = 10551,

        scroll = 25521,

        ruby = 2147,
        sapphire = 2146,
        amethyst = 2150,
        topaz = 9970,

        rewardfountain = 6390,

        redflame = 1488,
        yellowflame = 1500,
        blueflame = 8058,
        violetflame = 7473
    },

    -- For information only..
    actionIds = {
        getFlower = 41354,
        getWater = 41355,
        getScroll = 41356
    },

    storages = {
        skeleton = 50880,
        getFlower = 50881,
        usedFlower = 50882,

        getHolyWater = 50883,
        usedHolyWater = 50884,

        usedTongue = 50885,

        getScroll = 50886,

        firstMysticEnter = 50887,

        translation1 = 50888,
        translation2 = 50889,
        translation3 = 50890,
        translation4 = 50891,

        playerCanDoTasks = 50892

    },

    positions = {
        ruby = { x = 33069, y = 32298, z = 9 },
        sapphire = { x = 33069, y = 32302, z = 9 },
        amethyst = { x = 33077, y = 32302, z = 9 },
        topaz = { x = 33077, y = 32298, z = 9 }
    },

    -- Global Variaables used in all situations;
    taskactive = {
        ruby = false,
        sapphire = false,
        amethyst = false,
        topaz = false
    },

    rewards = {
        { id = 23810}, -- Lion's heart
        { id = 9971}, -- Gold ingot
        { id = 2154}, -- Yellow gem
        { id = 2156}, -- Red gem
        { id = 2127}, -- Emerlad bangle
        { id = 7633} -- Giant shimmering pearl
    },

    checkPlayerCanEnterMysticFlame = function(player)
        if player:getStorageValue(lionrock.storages.usedFlower) < 1
            or player:getStorageValue(lionrock.storages.usedHolyWater) < 1
            or player:getStorageValue(lionrock.storages.usedTongue) < 1 then

            return false
        end

        return true
    end,

    checkPlayerDoneQuest = function(player)
        if lionrock.checkPlayerCanEnterMysticFlame(player) ~= true then
            return false
        end

        if player:getStorageValue(lionrock.storages.translation1) < 1
            or player:getStorageValue(lionrock.storages.translation2) < 1
            or player:getStorageValue(lionrock.storages.translation3) < 1
            or player:getStorageValue(lionrock.storages.translation4) < 1 then

            return false
        end

        return true
    end
}
