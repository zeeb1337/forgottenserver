function onSay(player, words, param)
	if player:getAccountType() <= ACCOUNT_TYPE_TESTER then
		return true
	end

	local target = Player(param)
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	if target:getAccountType() ~= (ACCOUNT_TYPE_NORMAL or ACCOUNT_TYPE_HARDCORE) then
		player:sendCancelMessage("You can only promote a normal or hardcore player to a tester.")
		return false
	end

	target:setAccountType(ACCOUNT_TYPE_TESTER)
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been promoted to a tester by " .. player:getName() .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have promoted " .. target:getName() .. " to a tester.")
	return false
end
