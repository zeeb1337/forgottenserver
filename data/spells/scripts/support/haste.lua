local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 60 * 1000)
condition:setFormula(0.5, 0, 0.5, 0)
combat:addCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
