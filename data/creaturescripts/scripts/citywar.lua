function onLogout(player)
    local city, registry = CityWars.getPlayerWar(player)
    if city then
        city:onLogout(player)
    end
    return true
end

function onPrepareDeath(player, killer)
    local city, registry = CityWars.getPlayerWar(player)
    city:onDeath(player, registry, killer)
    return false
end

local function newSetting(func, format, id)
    return {
        format = format,
        func = func,
        current = 0,
        id = id
    }
end

local function getSetting(settings, id)
    for _, setting in ipairs(settings) do
        if setting.id == id then
            return (setting.func(setting.current))
        end
    end
end

local function filter(list, predicate)
    local ret = {}
    for k, v in ipairs(list) do
        if predicate(v) then
            table.insert(ret, v)
        end
    end
    return ret
end

local function getGuildLeaders(guild)
    return filter(guild:getMembersOnline(), function(p) return p:getGuildLevel() >= CityWars.minGuildRank end)
end

local SETTING_CITY = 0
local SETTING_BUYIN = 1
local SETTING_FRAGLIMIT = 2
local SETTING_UE = 3
local SETTING_SD = 4
local SETTING_TEAMSIZE = 5

local function sendWarSettings(player, info)
    local enemyGuild = Guild(info.invitedGuildId)
    if enemyGuild then
        local window = ModalWindow {
            title = 'War against ' .. enemyGuild:getName(),
            message = 'Settings:'
        }

        info.settings = info.settings or {
            newSetting(function(n)
                if n < CITY_WAR_FIRST then
                    n = CITY_WAR_FIRST
                elseif n > CITY_WAR_LAST then
                    n = CITY_WAR_LAST
                end

                return CityWars[n].name, n
            end, 'City: %s', SETTING_CITY),

            newSetting(function(n)
                n = math.max(0, n)
                return n * CityWars.buyInMultiplier, n
            end, 'Buy in: %d gold coins', SETTING_BUYIN),

            newSetting(function(n)
                n = math.max(1, n)
                return n * CityWars.fragLimitMultiplier, n
            end, 'Frag limit: %d kills', SETTING_FRAGLIMIT),

            newSetting(function(n)
                return n % 2 == 0, n
            end, 'U.E enabled: %s', SETTING_UE),

            newSetting(function(n)
                return n % 2 ~= 0, n
            end, 'S.D only: %s', SETTING_SD),

            newSetting(function(n)
                n = math.max(1, n)
                return n * CityWars.teamSizeMultiplier, n
            end, 'Team size: %d', SETTING_TEAMSIZE)
        }

        for _, setting in ipairs(info.settings) do
            local s, n = setting.func(setting.current)
            local choice = window:addChoice(setting.format:format(s))
            choice.setting = setting
            setting.current = n
        end

        window:addButton('<', function(button, choice)
            choice.setting.current = choice.setting.current - 1
            sendWarSettings(player, info)
        end)

        window:addButton('Ok', function(button, choice)
            local guild = player:getGuild()
            if not guild then
                return player:sendCancelMessage('You do not belong to a guild.')
            end

            local enemyGuild = Guild(info.invitedGuildId)
            if not enemyGuild then
                return player:sendCancelMessage('Enemy guild not found.')
            else
                local ret = CityWars.isValidGuild(enemyGuild)
                if ret == CW_RETURNVALUE_TOOFEWPLAYERS then
                    return player:sendCancelMessage('The enemy guild has too few online players to be able to participate in a city war.')
                elseif ret == CW_RETURNVALUE_TOOFEWUNIQUEIPS then
                    return player:sendCancelMessage('The enemy guild has too few unique ip addresses to be able to participate in a city war.')
                end
            end

            local enemyLeaders = getGuildLeaders(enemyGuild)
            if #enemyLeaders == 0 then
                return player:sendCancelMessage('There is no one online in the enemy guild able to accept a city war request.')
            end

            local city = CityWars.getCityByName(getSetting(info.settings, SETTING_CITY))
            if not city then
                return player:sendCancelMessage('City not found.')
            elseif not city:isFree() then
                return player:sendCancelMessage(city:getName() .. ' is being used at the moment.')
            end

            local options = {
                city = city,
                ultimateExplosion = getSetting(info.settings, SETTING_UE),
                fragLimit = getSetting(info.settings, SETTING_FRAGLIMIT),
                suddenDeathOnly = getSetting(info.settings, SETTING_SD),
                teamSize = getSetting(info.settings, SETTING_TEAMSIZE),
                buyIn = getSetting(info.settings, SETTING_BUYIN)
            }

            if guild:getBankBalance() < options.buyIn then
                return player:sendCancelMessage('Your guild does not have enough funds in the bank to pay the buy in.')
            end

            local ret = CityWars.onInvite(city, player, enemyGuild, enemyLeaders, options)
            if ret == CW_RETURNVALUE_LIVEINVITE then
                return player:sendCancelMessage('The last invite you sent to this guild is still active.')
            elseif ret == CW_RETURNVALUE_INVITERINWAR then
                return player:sendCancelMessage('You can only invite another guild for war after your current one ends.')
            elseif ret == CW_RETURNVALUE_INVITEDINWAR then
                return player:sendCancelMessage('The guild you invited is currently in war.')
            elseif ret == CW_RETURNVALUE_NOERROR then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'The invite was sent. The enemy guild\'s leader has two minutes to accept it.')
                local guildName = player:getGuild():getName()
                for _, leader in ipairs(enemyLeaders) do
                    leader:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, '"' .. player:getName() .. '" from guild "' .. guildName .. '" has invited your guild for a city war. If you wish to accept, head to a temple and read the guild book.')
                    leader:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, CityWars.getOptionsString(options))
                end
            end
        end)
        window:setDefaultEnterButton('Ok')

        window:addButton('>', function(button, choice)
            choice.setting.current = choice.setting.current + 1
            sendWarSettings(player, info)
        end)

        window:addButton('Cancel')

        window:sendToPlayer(player)
    end

    return false
end

function onTextEdit(player, item, text)
    player:unregisterEvent('CityWarInvite')
    if item:getId() == CityWars.inviteItemId then
        local enemy = {}
        for k, v in ipairs(Game.getPlayers()) do
            local tmp = v:getGuild()
            if tmp and tmp:getName():lower() == text:lower() then
                enemy.guild = tmp
                enemy.leaders = getGuildLeaders(enemy.guild)
                break
            end
        end

        if not enemy.guild then
            return player:sendCancelMessage('Enemy guild not found.')
        else
            local guild = player:getGuild()
            if not guild then
                return player:sendCancelMessage('You do not belong to a guild.')
            end

            if guild:getId() == enemy.guild:getId() then
                return player:sendCancelMessage('You can not start a war against your own guild.')
            end

            local ret = CityWars.isValidGuild(enemy.guild)
            if ret == CW_RETURNVALUE_TOOFEWPLAYERS then
                return player:sendCancelMessage('The enemy guild has too few online players to be able to participate in a city war.')
            elseif ret == CW_RETURNVALUE_TOOFEWUNIQUEIPS then
                return player:sendCancelMessage('The enemy guild has too few unique ip addresses to be able to participate in a city war.')
            end
        end

        if #enemy.leaders == 0 then
            return player:sendCancelMessage('There are no online leaders on the enemy guild.')
        end

        return sendWarSettings(player, {
            invitedGuildId = enemy.guild:getId()
        })
    end
end
