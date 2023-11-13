local config = {
	blessings = 6,
	basePrice = 0,
	pricePerLevel = 1000,
	freeBlessMaxLevel = 10
}

function onSay(player, words, param)
	if player:getGroup():getAccess() then
		return true
	end

	if player:isPremium() then
		if player:hasBlessing(config.blessings) then
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already blessed.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		else
			if player:hasFlag(PlayerFlag_IsHardcore) then
				player:sendTextMessage(MESSAGE_STATUS_WARNING, "Hardcore players can not be blessed!")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
			else
				if player:getLevel() <= config.freeBlessMaxLevel then
					player:addBlessing(config.blessings)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed for free since you are level " .. math.floor(player:getLevel() + 0.5) .. ".")
				elseif player:removeTotalMoney(config.basePrice + (player:getLevel() * config.pricePerLevel)) then
					player:addBlessing(config.blessings)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed for " .. math.floor((config.basePrice + (player:getLevel() * config.pricePerLevel)) + 0.5) .." gold coins.")
				else
					player:sendCancelMessage("You do not have enough money to be blessed, it costs " .. math.floor((config.basePrice + (player:getLevel() * config.pricePerLevel)) + 0.5) .." gold coins.")
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
				end
			end
		end
	else
		player:sendCancelMessage("Only premium accounts may purchase blessings this way.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return false
end
