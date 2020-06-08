function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('wisdom of urmahlullu', getThingPos(cid))
end