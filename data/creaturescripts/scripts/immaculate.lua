function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('Wildness of Urmahlullu', getThingPos(cid))
end