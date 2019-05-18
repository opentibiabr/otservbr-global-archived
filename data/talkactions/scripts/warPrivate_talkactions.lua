local UE, RUNES = 0, 0

local function tableContains(table, value)
	for i = 1, #table do
		if (table[i] == value) then
			return true
		end
	end
	return false
end

function onSay(cid, words, param)

	local lib = warPrivate_city1
	
    local player = Player(cid)
	local guild = player:getGuild()

	local city = param
    local status = ''
    local guildcontra = ''
	local runas = ''
	local spells = ''
	local limite = 0
    local params = param:split(',')
    
	status = string.trim(params[2])
	city = string.trim(params[1])
	
	if params ~= nil  then        
		if status == 'invite' then
			city = params[1]
			status = string.trim(params[2])
			guildcontra = string.trim(params[3])
			runas = string.trim(params[4])
			spells = string.trim(params[5])
			limite = tonumber(params[6]:trim())
			-- CHECKPOINT player:sendTextMessage(MESSAGE_EVENT_ADVANCE, city ..  status ..  guildcontra ..  runas ..  spells .. " INVITE SUESSO!")
		elseif status == 'accept' then
			city = params[1]
			status = string.trim(params[2])
			guildcontra = string.trim(params[3])
			limite = tonumber(params[4]:trim())
			-- CHECKPOINT player:sendTextMessage(MESSAGE_EVENT_ADVANCE, city ..  status ..  guildcontra .. " ACEITAR SUCESSO!")
		elseif status == 'enter' then
			city = params[1]:trim()
			status = params[2]:trim()
			-- CHECKPOINT player:sendTextMessage(MESSAGE_EVENT_ADVANCE, city ..  status ..   " ENTRAR SUCESSO!")
		elseif status == 'clean' then
			city = params[1]:trim()
			status = params[2]:trim()
		elseif status == 'leave' then
			city = params[1]:trim()
			status = params[2]:trim()	
		end
	else				
		
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Not enough params.")
		return false
	end
	
	-------------------------------------------------------------------------------
	-------------------------      invite WAR       --------------------------------
	-------------------------------------------------------------------------------	
	if  status == 'invite' then  
	
	--Verifica se o player tem guild
	if guild == nil then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not in a guild.")
		return false
	end
	
	local acceptLimits = {10, 15, 20, 25, 30, 35, 40, 45, 50}
	if (limite == nil or not tableContains(acceptLimits, limite)) then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Os limites aceitáveis são: " ..table.concat(acceptLimits, ", ")..".")
		return false
	end
	
	if(isInArray({"edron", "darashia", "yalahar","liberty bay"}, city)) then
		if city == 'edron' then
			lib = warPrivate_city1
		elseif city == 'darashia' then
			lib = warPrivate_city2		
		elseif city == 'liberty bay' then
			lib = warPrivate_city3
		elseif city == 'yalahar' then
			lib = warPrivate_city4
		elseif city == 'carlin' then
			lib = warPrivate_city5
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
			return false
		end
		else
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
	end
	
	
   --Verifica a guild contra e se ja existe alguem em war
   local enemyName, enemyId = guildcontra, getGuildId(guildcontra)
   local guildName, guildId = guild:getName(), guild:getId()
   
   
   if enemyId == false then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"Enemy guild name invalid.")	
		return false
		
		elseif guildId == enemyId then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can not invite your guild.")
			return false
		elseif player:getGuildLevel() < 3 then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not the leader guild.")
			return false
		elseif getGlobalStorageValue(lib.time) > os.time() then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Others guilds are on war now, wait.")	
			return false
		elseif getGlobalStorageValue(lib.wait.invite) > 0 then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is already a guild invited, please wait 5 minutes.")
			return false
	end
	
	-- valida as opções de war
	
	if(isInArray({"default", "onlysd"}, runas)) then
		if runas == 'default'	then
			RUNES = 0	
		elseif runas == 'onlysd' then
			RUNES = 1
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only choose Onlysd or Default.")
		return false
	end
	
	if(isInArray({"default", "notue"}, spells)) then
		if spells == 'default'	then
			UE = 0	
		elseif spells == 'notue' then
			UE = 1
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only choose Notue or Default.")
		return false
	end
	
	--Starta a guerra caso de tudo certo
	setGlobalStorageValue(lib.wait.invite, guildId)
	setGlobalStorageValue(lib.wait.accept, enemyId)
	
	setGlobalStorageValue(lib.wait.ue, UE)
	setGlobalStorageValue(lib.wait.runes, RUNES)
	setGlobalStorageValue(lib.wait.limite, limite)
	
	addEvent(setGlobalStorageValue, 5 * 60000, lib.wait.invite, 0)
	addEvent(setGlobalStorageValue, 5 * 60000, lib.wait.ue, 0)
	addEvent(setGlobalStorageValue, 5 * 60000, lib.wait.runes, 0)
	

	for _, online in ipairs(Game.getPlayers()) do
		if online then
			local guildOnline = online:getGuild()
			if guildOnline ~= nil then
				if guildOnline:getId() == getGlobalStorageValue(lib.wait.accept) then
				player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "The guild ".. guildName .." invited the guild ".. enemyName .." to war private with ".. warPrivate_duration .." minutes duration, .")
				end
			end
		end
	end
   end
   
    -------------------------------------------------------------------------------
	-------------------------      ACCEPT WAR      --------------------------------
	-------------------------------------------------------------------------------
   
   if status == 'accept' then
   
		
		if(isInArray({"edron", "darashia", "yalahar", "liberty bay"}, city)) then
			if city == 'edron' then
				lib = warPrivate_city1
			elseif city == 'darashia' then
				lib = warPrivate_city2		
			elseif city == 'liberty bay' then
				lib = warPrivate_city3
			elseif city == 'yalahar' then
				lib = warPrivate_city4
			elseif city == 'carlin' then
				lib = warPrivate_city5	
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
		end

		
		
		-- CHECKPOINT player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "CHECKPOINT")
		local enemyName, enemyId = guild:getName(), guild:getId()
		
		if player:getGuildLevel() < 3 then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not the leader guild.")
			return false
		elseif getGlobalStorageValue(lib.time) > os.time() then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Others guilds are on war now, wait.")
			return false
		elseif getGlobalStorageValue(lib.wait.invite) < 1 then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is no invitation to guilds.")
			return false
		elseif getGlobalStorageValue(lib.wait.accept) ~= enemyId then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your guild not this invited for war.")
			return false
		elseif limite ~= getGlobalStorageValue(lib.wait.limite) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The limit of this war is "..getGlobalStorageValue(lib.wait.limite).." x "..getGlobalStorageValue(lib.wait.limite).."!")
			return false
		end
		
		setGlobalStorageValue(lib.war.guild, getGlobalStorageValue(lib.wait.invite))
		setGlobalStorageValue(lib.war.enemy, getGlobalStorageValue(lib.wait.accept))
		setGlobalStorageValue(lib.war.limite, getGlobalStorageValue(lib.wait.limite))
		setGlobalStorageValue(lib.war.ue, getGlobalStorageValue(lib.wait.ue))
		setGlobalStorageValue(lib.war.runes, getGlobalStorageValue(lib.wait.runes))
		setGlobalStorageValue(lib.time, (60 * 60) + os.time())
		
		local guildName = Guild(getGlobalStorageValue(lib.war.guild)):getName()
		
		broadcastMessage("The guild ".. enemyName .." accepted war private with the guild ".. guildName .." to war private with ".. warPrivate_duration .." minutes duration. To enter war use the command.", MESSAGE_STATUS_WARNING)
		
		for _, online in ipairs(Game.getPlayers()) do
			if online:isPlayer() and online:getStorageValue(warPrivate_storage) == lib.city then
				online:teleportTo(online:getTown():getTemplePosition())
				online:setStorageValue(warPrivate_storage, 0)
				online:setStorageValue(warPrivate_UE, 0)
				online:setStorageValue(44672, 0)
				online:setStorageValue(warPrivate_RUNES, 0)
				online:setStorageValue(warPrivate_Guild, 0)
				online:unregisterEvent("WarPrivateDeath")				
			end
		end
		
		setGlobalStorageValue(lib.war.count1, 0)
		setGlobalStorageValue(lib.war.count2, 0)

		addEvent(broadcastMessage, warPrivate_duration * 60000, "Finished the time of war private between the guilds ".. guildName .." and ".. enemyName ..".", MESSAGE_STATUS_DEFAULT)		
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Accepts war with success, good luck.")		
   end

   -------------------------------------------------------------------------------
	-------------------------      ENTER WAR       --------------------------------
	-------------------------------------------------------------------------------	
   
   if status == 'enter' then   
		if(isInArray({"edron", "darashia", "yalahar","liberty bay"}, city)) then
			if city == 'edron' then
				lib = warPrivate_city1
			elseif city == 'darashia' then
				lib = warPrivate_city2		
			elseif city == 'liberty bay' then
				lib = warPrivate_city3
			elseif city == 'yalahar' then
				lib = warPrivate_city4
			elseif city == 'carlin' then
				lib = warPrivate_city5	
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
		end
	
	
		local guildId = guild:getId()
	
	if (getPlayerVocation(cid) ~= 0) then
	 if (getTilePzInfo(getThingPos(cid)) == TRUE) then
		if guildId == getGlobalStorageValue(lib.war.guild) then
			
			if (getGlobalStorageValue(lib.war.count1) >= getGlobalStorageValue(lib.war.limite)) then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The limit of players its reached.")
				return false
			end
			
			if (player:getStorageValue(44672) == 1) then 
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are in Anti Entrosa.")
				return false
			end
								
			player:teleportTo(lib.pos_guild)
			player:setStorageValue(warPrivate_UE, getGlobalStorageValue(lib.war.ue))
			player:setStorageValue(warPrivate_RUNES, getGlobalStorageValue(lib.war.runes))
			player:setStorageValue(warPrivate_storage, lib.city)
			player:setStorageValue(warPrivate_Guild, 1)
			player:registerEvent("WarPrivateDeath")
			player:setStorageValue(44672, 1)
			setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) + 1)			
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are teleported. Good luck.")
		elseif guildId == getGlobalStorageValue(lib.war.enemy) then
			
			if (getGlobalStorageValue(lib.war.count2) >= getGlobalStorageValue(lib.war.limite)) then
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "The limit of players its reached.")
				return false
			end
			
			if (player:getStorageValue(44672) == 1) then 
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are in Anti Entrosa.")
				return false
			end
						
			player:teleportTo(lib.pos_enemy)
			player:setStorageValue(warPrivate_UE, getGlobalStorageValue(lib.war.ue))
			player:setStorageValue(warPrivate_RUNES, getGlobalStorageValue(lib.war.runes))
			player:setStorageValue(warPrivate_storage, lib.city)
			player:setStorageValue(warPrivate_Guild, 2)
			player:registerEvent("WarPrivateDeath")
			player:setStorageValue(44672, 1)
			setGlobalStorageValue(lib.war.count2, getGlobalStorageValue(lib.war.count2) + 1)			
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are teleported. Good luck.")
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your guild are not in war.")
			return false
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only execute this command in pz area.")
	end
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't go to war in rookgaard.")
		return false
	end
	end
	
	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------
	
	--[[ if status == 'leave' then   
		if(isInArray({"edron", "darashia", "yalahar","liberty bay"}, city)) then
			if city == 'edron' then
				lib = warPrivate_city1
			elseif city == 'darashia' then
				lib = warPrivate_city2		
			elseif city == 'liberty bay' then
				lib = warPrivate_city3
			elseif city == 'yalahar' then
				lib = warPrivate_city4
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
		end
		
		local guildId = guild:getId()
	
		if (getPlayerVocation(cid) ~= 0) then
			if (getTilePzInfo(getThingPos(cid)) == TRUE) then
				if guildId == getGlobalStorageValue(lib.war.guild) then			
					player:setStorageValue(warPrivate_UE, 0)
					player:setStorageValue(warPrivate_RUNES, 0)
					player:unregisterEvent("WarPrivateDeath")
					player:teleportTo(player:getTown():getTemplePosition())
					setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) - 1)		
				end
			elseif guildId == getGlobalStorageValue(lib.war.enemy) then
					player:setStorageValue(warPrivate_UE, 0)
					player:setStorageValue(warPrivate_RUNES, 0)
					player:unregisterEvent("WarPrivateDeath")
					player:teleportTo(player:getTown():getTemplePosition())
					setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count2) - 1)	
			else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your guild are not in war.")
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can only execute this command in pz area.")
		end
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't go to war in rookgaard.")
			return false
		end
end ]]--
	
	-------------------------------------------------------------------------------
	-------------------------     LIMPA AS STORAGES       --------------------------------
	-------------------------------------------------------------------------------
	
	
  --[[	if status == 'clean' then
		if(isInArray({"edron", "darashia", "yalahar","liberty bay"}, city)) then
			if city == 'edron' then
				lib = warPrivate_city1
			elseif city == 'darashia' then
				lib = warPrivate_city2		
			elseif city == 'liberty bay' then
				lib = warPrivate_city3
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid city.")
	end
		
		if getGlobalStorageValue(lib.time) > os.time() then			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still within one hour of war.")
			return false
		else
			player:setStorageValue(warPrivate_storage, 0)
			player:setStorageValue(warPrivate_UE, 0)
			player:setStorageValue(warPrivate_RUNES, 0)		
			player:unregisterEvent("WarPrivateDeath")
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Now you are free to use all runes and spells.")
		end
	end ]]-- 
	
end