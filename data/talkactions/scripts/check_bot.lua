function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target = Player(param)
	if not target then
		player:sendCancelMessage("Player not found.")
		return false
	end

	if target:getGroup():getAccess() then
		player:sendCancelMessage("You cannot damage this player.")
		return false
	end
	
	if player:hasFlag(PlayerFlag_CannotAttackPlayer) then
		player:sendCancelMessage("You cannot damage players.")
		return false
	end

	target:removeCondition(CONDITION_FIRE)
	target:removeCondition(CONDITION_ENERGY)
	target:removeCondition(CONDITION_BLEEDING)
	target:removeCondition(CONDITION_DROWN)
	target:removeCondition(CONDITION_POISON)
	target:removeCondition(CONDITION_FREEZING)
	target:removeCondition(CONDITION_DAZZLED)
	target:removeCondition(CONDITION_CURSED)
	target:addHealth(-target:getHealth() + 1)
	return false
end
