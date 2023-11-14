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
		player:sendCancelMessage("You cannot heal this player.")
		return false
	end
	
	if player:hasFlag(PlayerFlag_CannotAttackPlayer) then
		player:sendCancelMessage("You cannot heal players.")
		return false
	end

	target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	target:addHealth(target:getMaxHealth())
	return false
end
