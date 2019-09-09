local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end
		
-- Storage IDs -- 
local goldenOutfit = Storage.goldenOutfit
local goldenFirstAddon = Storage.goldenFirstAddon
local goldenSecondAddon = Storage.goldenSecondAddon 
		
local valoroutfit = 500000000
local valorprimeiroaddon = 250000000
local valorsedundoaddon = 250000000

newaddon    = 'Here you are, enjoy your brand new addon!' 
newoutfit    = 'Take this armor as a token of great gratitude. Let us forever remember this day, my friend!' 
noitems        = 'You do not have all the required items.' 
noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.' 
already        = 'It seems you already have this addon, don\'t you try to mock me son!' 
newaddonprimeiro        = 'Take this boots as a token of great gratitude. Let us forever remember this day, my friend!' 
newaddonsegundo        = 'Take this helmet as a token of great gratitude. Let us forever remember this day, my friend!' 
      
function goldenoutfit(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then  
		local player = Player(cid)
		if not player:hasOutfit(1211) and not player:hasOutfit(1210) then 
			if  player:removeMoneyNpc(valoroutfit) then  
				selfSay(newoutfit, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211)  --- female
				doPlayerAddOutfit(cid, 1210)  --- male
				setPlayerStorageValue(cid,goldenOutfit,1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
    end 
end
function primeiroaddon(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 
	
    if isPremium(cid) then
		local player = Player(cid)
		if not player:hasOutfit(1211, 1) and not player:hasOutfit(1210, 1) then 
			if  player:removeMoneyNpc(valorprimeiroaddon) then  
				selfSay(newaddonprimeiro, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211,1)  --- female
				doPlayerAddOutfit(cid, 1210,1)  --- male
				setPlayerStorageValue(cid,goldenFirstAddon,1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
	end
end

function segundoaddon(cid, message, keywords, parameters, node) 

    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
     
    local player_gold     = getPlayerItemCount(cid,2148) 
    local player_plat     = getPlayerItemCount(cid,2152)*100 
    local player_crys     = getPlayerItemCount(cid,2160)*10000 
    local player_money     = player_gold + player_plat + player_crys 

    if isPremium(cid) then  
		local player = Player(cid)
		if not player:hasOutfit(1211, 2) and not player:hasOutfit(1210, 2) then 
			if  player:removeMoneyNpc(valorsedundoaddon) then  
				selfSay(newaddonsegundo, cid)  
				doSendMagicEffect(getCreaturePosition(cid), 13) 
				doPlayerAddOutfit(cid, 1211, 2)  --- female
				doPlayerAddOutfit(cid, 1210, 2)  --- male
				setPlayerStorageValue(cid,goldenSecondAddon, 1) 
			else 
				selfSay(noitems, cid) 
			end 
		else 
			selfSay(already, cid) 
		end 
    end
end
 
local node2 = 
keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'In exchange for a truly generous donation I will offer a special outfit. Do you want to make a donation?\nExcellent! Now, let me explain.\n If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit...\nYou will be entitled to wear the {armor} for 500.000.000 gold pieces, {boots} for an additional 250.000.000 and the {helmet} for another 250.000.000 gold pieces. ...\nWhat will it be?'})
node2:addChildKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?', reset = false})
node2:addChildKeyword({'yes'}, goldenoutfit, {}) 
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node3 = 
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique helmet?'})
node3:addChildKeyword({'yes'}, segundoaddon, {})   
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
 
	 
local node4 = 
keywordHandler:addKeyword({'boots'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you wold like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique boots?'})
node4:addChildKeyword({'yes'}, primeiroaddon, {}) 
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, premium = true, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})
-- The New Frontier

-- Incorrect
local bribeKeyword = keywordHandler:addKeyword({'farmine'}, StdModule.say, {npcHandler = npcHandler, text = 'Ah, I vaguely remember that our little allies were eager to build some base. So speak up, what do you want?'}, function(player) return player:getStorageValue(Storage.TheNewFrontier.Questline) <= 15 end)
	bribeKeyword:addChildKeyword({'impress'}, StdModule.say, {npcHandler = npcHandler, text = 'Indeed, indeed. Without the help of Thais, our allies stand no chance! Well, I\'ll send some money to support their cause.', reset = true},
		function(player) return player:getStorageValue(Storage.TheNewFrontier.BribeKing) ~= 1 end,
		function(player) player:setStorageValue(Storage.TheNewFrontier.BribeKing, 1) player:setStorageValue(Storage.TheNewFrontier.Mission05, player:getStorageValue(Storage.TheNewFrontier.Mission05) + 1) end
	)

-- Basic
keywordHandler:addKeyword({'eremo'}, StdModule.say, {npcHandler = npcHandler, text = 'It is said that he lives on a small island near Edron. Maybe the people there know more about him.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am your sovereign, King Tibianus III, and it\'s my duty to uphold {justice} and provide guidance for my subjects.'})
keywordHandler:addKeyword({'justice'}, StdModule.say, {npcHandler = npcHandler, text = 'I try my best to be just and fair to our citizens. The army and the {TBI} are a great help in fulfilling this duty.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'Preposterous! You must know the name of your own King!'})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, text = 'The latest news is usually brought to our magnificent town by brave adventurers. They recount tales of their journeys at Frodo\'s tavern.'})
keywordHandler:addKeyword({'how', 'are', 'you'}, StdModule.say, {npcHandler = npcHandler, text = 'Thank you, I\'m fine.'})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, text = 'Rain Castle is my home.'})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, text = 'Sell? Sell what? My kingdom isn\'t for sale!'})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, text = 'Honour the Gods and above all pay your {taxes}.'})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, text = 'Please ask a priest about the gods.'})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, text = 'The citizens of Tibia are my subjects. Ask the old monk Quentin if you want to learn more about them.'})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, text = 'He is a skilled blacksmith and a loyal subject.'})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, text = 'He is the owner of Frodo\'s Hut and a faithful tax-payer.'})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, text = 'He was once one of Tibia\'s greatest fighters. Now he sells equipment.'})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, text = 'He was once my greatest general. Now he is very old and senile so we assigned him to work for the Royal Tibia Mail.'})
keywordHandler:addKeyword({'noodles'}, StdModule.say, {npcHandler = npcHandler, text = 'The royal poodle Noodles is my greatest {treasure}!'})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = 'He is a follower of the evil God Zathroth and responsible for many attacks on us. Kill him on sight!'})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, text = 'He is my royal jester and cheers me up now and then.'})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, text = 'The royal poodle Noodles is my greatest treasure!'})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, text = 'Go and hunt them! For king and country!'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, text = 'Visit Quentin the monk for help.'})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, text = 'What a disgusting topic!'})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, text = 'Dungeons are no places for kings.'})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, text = 'Feel free to buy it in our town\'s fine shops.'})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask the royal cook for some food.'})
keywordHandler:addKeyword({'tax collector'}, StdModule.say, {npcHandler = npcHandler, text = 'That tax collector is the bane of my life. He is so lazy. I bet you haven\'t payed any taxes at all.'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the king, so watch what you say!'})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask the soldiers about that.'})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, text = 'Visit the shops of our merchants and craftsmen.'})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, text = 'The four major guilds are the knights, the paladins, the druids, and the sorcerers.'})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, text = 'Vile monsters, but I must admit they are strong and sometimes even cunning ... in their own bestial way.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, text = 'The forces of good are hard pressed in these dark times.'})
keywordHandler:addKeyword({'evil'}, StdModule.say, {npcHandler = npcHandler, text = 'We need all strength we can muster to smite evil!'})
keywordHandler:addKeyword({'order'}, StdModule.say, {npcHandler = npcHandler, text = 'We need order to survive!'})
keywordHandler:addKeyword({'chaos'}, StdModule.say, {npcHandler = npcHandler, text = 'Chaos arises from selfishness.'})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s the sword of the Kings. If you return this weapon to me I will {reward} you beyond your wildest dreams.'})
keywordHandler:addKeyword({'reward'}, StdModule.say, {npcHandler = npcHandler, text = 'Well, if you want a reward, go on a quest to bring me Excalibug!'})
keywordHandler:addKeyword({'chester'}, StdModule.say, {npcHandler = npcHandler, text = 'A very competent person. A little nervous but very competent.'})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, text = 'This organisation is an essential tool for holding our enemies in check. Its headquarter is located in the bastion in the northwall.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = 'Soon the whole land will be ruled by me once again!'})
keywordHandler:addAliasKeyword({'land'})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, text = 'Harkath Bloodblade is the general of our glorious {army}.'})
keywordHandler:addAliasKeyword({'bloodblade'})
keywordHandler:addAliasKeyword({'general'})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, text = 'I will call for heroes as soon as the need arises again and then reward them appropriately.'})
keywordHandler:addAliasKeyword({'mission'})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, text = 'To pay your taxes, visit the royal tax collector.'})
keywordHandler:addAliasKeyword({'money'})
keywordHandler:addAliasKeyword({'tax'})
keywordHandler:addAliasKeyword({'collector'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s a time for heroes!'})
keywordHandler:addAliasKeyword({'hero'})
keywordHandler:addAliasKeyword({'adventurer'})
keywordHandler:addKeyword({'enemy'}, StdModule.say, {npcHandler = npcHandler, text = 'Our enemies are numerous. The evil minotaurs, Ferumbras, and the renegade city of Carlin to the north are just some of them.'})
keywordHandler:addAliasKeyword({'enemies'})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = 'They dare to reject my reign over the whole continent!'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'Our beloved city has some fine shops, guildhouses and a modern sewerage system.'})
keywordHandler:addAliasKeyword({'city'})
keywordHandler:addKeyword({'merchant'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask around about them.'})
keywordHandler:addAliasKeyword({'craftsmen'})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, text = 'The paladins are great protectors for Thais.'})
keywordHandler:addAliasKeyword({'elane'})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, text = 'The brave knights are necessary for human survival in Thais.'})
keywordHandler:addAliasKeyword({'gregor'})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, text = 'The magic of the sorcerers is a powerful tool to smite our enemies.'})
keywordHandler:addAliasKeyword({'muriel'})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, text = 'We need the druidic healing powers to fight evil.'})
keywordHandler:addAliasKeyword({'marvik'})

npcHandler:setMessage(MESSAGE_GREET, 'I greet thee, my loyal subject |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'How rude!')

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hail king')
focusModule:addGreetMessage('salutations king')
npcHandler:addModule(focusModule)