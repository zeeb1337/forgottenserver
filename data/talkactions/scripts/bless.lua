local config = {
	basePrice = 0,
	pricePerLevel = 1000,
	freeBlessMaxLevel = 20
}

function onSay(player, words, param)
	if player:getGroup():getAccess() then
		return true
	end

	if not player:isPremium() then
		player:sendCancelMessage("Only premium accounts may purchase blessings.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if player:hasFlag(PlayerFlag_IsHardcore) then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "Hardcore players can not be blessed!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	for i = 1, 5 do
		if player:hasBlessing(i) then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already blessed.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	end

	if player:getLevel() <= config.freeBlessMaxLevel then
		for i = 1, 5 do
			player:addBlessing(i)
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed for free since you are level " .. math.floor(player:getLevel() + 0.5) .. ".")
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		return false
	end
	
	if player:removeTotalMoney(config.basePrice + (player:getLevel() * config.pricePerLevel)) then
		for i = 1, 5 do
			player:addBlessing(i)
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed for " .. math.floor((config.basePrice + (player:getLevel() * config.pricePerLevel)) + 0.5) .." gold coins.")
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		return false
	end

	player:sendCancelMessage("You do not have enough money to be blessed, it costs " .. math.floor((config.basePrice + (player:getLevel() * config.pricePerLevel)) + 0.5) .." gold coins.")
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end