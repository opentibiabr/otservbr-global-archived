function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('urmahlullu the tamed', getThingPos(cid))
end