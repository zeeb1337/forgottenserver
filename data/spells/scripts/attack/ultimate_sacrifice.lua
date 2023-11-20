local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_TELEPORT)
combat:setArea(createCombatArea(AREA_CIRCLE4X4))

function onGetFormulaValues(player, level, magicLevel)
	local health = player:getHealth()
	local mana = player:getMana()

	local min = ((((health + mana) / 4) + magicLevel) * 2) * 0.9
	local max = ((((health + mana) / 4) + magicLevel) * 2) * 1.1
	
	player:addHealth(-health)
	player:addMana(-mana)
	
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
