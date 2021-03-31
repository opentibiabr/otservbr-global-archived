local aol = TalkAction("!aol")

function aol.onSay(cid, words, param)
local aol = 2173
  if doPlayerRemoveMoney(cid, 50000) == true then
    doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, "You have bought an aol for 50K!")
    doPlayerAddItem(cid, aol, 1)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
  else
    doPlayerSendCancel(cid, "Sorry, You need 50K to buy an aol!")
  end
return true
end

aol:register()