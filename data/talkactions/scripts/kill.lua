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
		player:sendCancelMessage("You cannot kill this player.")
		return false
	end

	target:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	target:addHealth(-target:getHealth())
	return false
end
