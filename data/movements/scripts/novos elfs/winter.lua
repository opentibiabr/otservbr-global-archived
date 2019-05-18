-->Config
--->Lugar que o player será teleportado
local NewPos = {x=33675, y=32148, z=7}
--->Efeito
local Effect = CONST_ME_MAGIC_BLUE

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