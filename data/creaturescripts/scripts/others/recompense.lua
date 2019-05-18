function onAdvance(cid, skill, oldlevel, newlevel)

	       	if getPlayerLevel(cid) >= 8 and getPlayerStorageValue(cid, 99963) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 2000)
						    setPlayerStorageValue(cid, 99963, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 2000 gold in your bank for advancing to Level 8.")

		    elseif getPlayerLevel(cid) >= 40 and getPlayerStorageValue(cid, 99964) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
						    setPlayerStorageValue(cid, 99964, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 10000 gold in your bank for advancing to Level 40.")

		   elseif getPlayerLevel(cid) >= 50 and getPlayerStorageValue(cid, 99965) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 30000)
						    setPlayerStorageValue(cid, 99965, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 30000 gold in your bank for advancing to Level 50.")

		     elseif getPlayerLevel(cid) >= 75 and getPlayerStorageValue(cid, 99966) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 60000)
						    setPlayerStorageValue(cid, 99966, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 60000 gold in your bank for advancing to Level 75.")
				
							
			elseif getPlayerLevel(cid) >= 100 and getPlayerStorageValue(cid, 99969) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 100000)
						    setPlayerStorageValue(cid, 99969, 1)
						   doPlayerSendTextMessage(cid, 19, "You have received 10000 gold in your bank for advancing to Level 100.")
							
							
			
            elseif getPlayerLevel(cid) >= 150 and getPlayerStorageValue(cid, 99970) ~= 1 then
						    doPlayerAddItem(cid, 5942)
						    setPlayerStorageValue(cid, 99970, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received one blessed wooden stake because you reached level 150.")

					

 elseif getPlayerLevel(cid) >= 200 and getPlayerStorageValue(cid, 99971) ~= 1 then
						    doPlayerAddItem(cid, 2195)
						    setPlayerStorageValue(cid, 99971, 1)
						    doPlayerSendTextMessage(cid, 19, "You have been awarded with 1 boots of haste for reaching level 200.")

												
						    end
		    return TRUE
end