function onDeath(cid)
doSendMagicEffect(getThingPos(cid), 2)
return Game.createMonster('Urmahlullu the Weakened', getThingPos(cid))
end