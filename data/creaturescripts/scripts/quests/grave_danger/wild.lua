function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('wildness of urmahlullu', getThingPos(cid))
end 