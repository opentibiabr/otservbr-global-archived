local acombat2 = createCombatObject()
local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE) 
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 158)
setCombatParam(combat2, COMBAT_PARAM_SHOOTEFFECT, 18)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0, -0) 
addCombatCondition(combat1, condition) 
addCombatCondition(combat2, condition) 
arr1 = { 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0}, 
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
{0, 0, 1, 1, 1, 2, 1, 1, 1, 0, 0}, 
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0}, 
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
}  
arr2 = { 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}, 
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0}, 
{0, 0, 0, 1, 1, 2, 1, 1, 0, 0, 0}, 
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0}, 
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
}
local area2 = createCombatArea(arr2) 
setCombatArea(acombat2, area2) 
function onTargetTile(cid, pos) 
    doCombat(cid,combat1,positionToVariant(pos)) 
end 
function onTargetTile2(cid, pos) 
    doCombat(cid,combat2,positionToVariant(pos)) 
end 
setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2") 
local function onCastSpell2(parameters) 
    doCombat(parameters.cid, acombat2, parameters.var) 
end 
function onCastSpell(cid, var) 
local parameters = { cid = cid, var = var} 
addEvent(onCastSpell2, 200, parameters) 
return TRUE
end