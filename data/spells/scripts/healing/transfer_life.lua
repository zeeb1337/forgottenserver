local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

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
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return combat:execute(creature, variant)
end
