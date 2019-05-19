local acombat1 = createCombatObject() 
local acombat2 = createCombatObject() 
local combat1 = createCombatObject() 
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE) 
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 18) 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0, -0) 
local combat2 = createCombatObject() 
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE) 
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 158)
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
local area1 = createCombatArea(arr1) 
local area2 = createCombatArea(arr2) 
setCombatArea(acombat1, area1) 
setCombatArea(acombat2, area2) 
function onTargetTile(cid, pos) 
    doCombat(cid,combat1,positionToVariant(pos)) 
end 
function onTargetTile2(cid, pos) 
    doCombat(cid,combat2,positionToVariant(pos)) 
end 
setCombatCallback(acombat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile") 
setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2") 
local function onCastSpell1(parameters) 
    doCombat(parameters.cid, acombat1, parameters.var) 
end 
local function onCastSpell2(parameters) 
    doCombat(parameters.cid, acombat2, parameters.var) 
end 
function onCastSpell(cid, var) 
local parameters = { cid = cid, var = var} 
addEvent(onCastSpell1, 0, parameters) 
addEvent(onCastSpell2, 200, parameters) 
return TRUE
end