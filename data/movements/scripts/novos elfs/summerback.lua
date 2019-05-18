-->Config
--->Lugar que o player será teleportado
local NewPos = {x=33584, y=32208, z=7}
--->Efeito
local Effect = CONST_ME_MAGIC_GREEN

function onStepIn(cid, frompos)
if isPremium(cid) == true then
	doTeleportThing(cid, NewPos)
	doSendMagicEffect(NewPos, Effect)
else
	doTeleportThing(cid, frompos)
	doPlayerSendCancel(cid, "Only premium accounts can pass.")
end
return true
end