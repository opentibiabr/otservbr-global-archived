function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('Urmahlullu the Tamed', getThingPos(cid))
end