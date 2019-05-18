function string.diff(self)
    local format = {
        {'day', self / 60 / 60 / 24},
        {'hour', self / 60 / 60 % 24},
        {'minute', self / 60 % 60},
        {'second', self % 60}
    }

    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' and ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('second') then
        local a, b = ret:find(' and ')
        ret = ret:sub(b+1)
    end
    return ret
end

local config = {
            exhaustion = 299551, -- exhaust storage
            duration = 20 -- counted in seconds for example 5*60 for 5 minutes.
        }

function onSay(player, words, param, channel, creature)

            local playerGuild = player:getGuild()
            local creature = player

            if (os.time() - player:getStorageValue(config.exhaustion)) < config.duration then
             player:sendTextMessage(MESSAGE_INFO_DESCR,"You have to wait 20 seconds before using this command again.")
                return false
            end

            if(not playerGuild or playerGuild:getId() == 0) then
                player:sendTextMessage(MESSAGE_INFO_DESCR,"Sorry, you're not in a guild.")
                return false
            end

            if player:getGuildLevel() < 2 then -- 3 = Leader, 2 = Vice-Leader, 1 = Regular Member
                player:sendTextMessage(MESSAGE_INFO_DESCR,"You have to be Leader or Vice-Leader of your guild to change outfits!")
                return false
            end

            local outfit, count = creature:getOutfit(), 0
			outfit = {lookType = outfit.lookType, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet, lookTypeEx = outfit.lookTypeEx, lookAddons = outfit.lookAddons}
	
            local message = "*Guild* Your outfit has been changed by your leader " ..player:getName() .. " "
            for _, members in ipairs(Game.getPlayers()) do
                if(members:getGuild() == playerGuild and player ~= members) then
                    local newOutfit = outfit
                    if(not members:hasOutfit(outfit.lookType, outfit.lookAddons, outfit.lookMount)) then
                        local tmpOutfit = members:getOutfit()
                        newOutfit.lookAddons = 0--tmpOutfit.lookAddons
						newOutfit.lookMount = 0
                        if(not members:hasOutfit(outfit.lookType, 0)) then
                            newOutfit.lookType = tmpOutfit.lookType
                        end
                    end
				if not Battlefield:findPlayer(members) and captureTheFlag.getPlayerState(members) == CTF_STATE_NONE then  
                    members:getPosition():sendMagicEffect(66)
                    members:setOutfit(newOutfit)
                    members:sendTextMessage(MESSAGE_INFO_DESCR, message)
                    count = count + 1
					end
                end
            end

            player:sendTextMessage(MESSAGE_INFO_DESCR,"Guild members outfit has been changed. (Total: " .. count .. ")")
            player:setStorageValue(config.exhaustion, os.time() + config.duration)
            return false
        end