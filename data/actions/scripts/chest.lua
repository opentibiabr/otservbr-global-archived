function onUse(cid, item, itemEx)
if(getPlayerStorageValue(cid, 932119) < 1) then

doPlayerAddItem(cid, 2160, 1)
setPlayerStorageValue(cid, 932119, 1)
doSendMagicEffect(tilepos1,45)
	doCreatureSay(cid, "You succesfully took a beginner reward.", TALKTYPE_ORANGE_1) 
	else 

	doSendMagicEffect(p,10)	
	doCreatureSay(cid, "You already took a beginner reward.", TALKTYPE_ORANGE_1)
return true
end

end
