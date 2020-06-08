function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('urmahlullu the weakened', getThingPos(cid))
end