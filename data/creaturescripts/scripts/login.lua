function onLogin(player)
	local serverName = configManager.getString(configKeys.SERVER_NAME)
	local loginStr = "Welcome to " .. serverName .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit in %s: %s.", serverName, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(PlayerStorageKeys.promotion)
		if value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Check blessings
	if not player:getGroup():getAccess() then
		if not player:hasFlag(PlayerFlag_IsHardcore) then
			for i = 1, 5 do
				if not player:hasBlessing(i) then
					player:sendTextMessage(MESSAGE_STATUS_WARNING, "You are not blessed!")
					player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "Use !bless to purchase all blessings.")
					return true
				end
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You are either partially or fully blessed!")
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "Use !checkbless to see which blessing(s) you have.")
			return true
		end
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	return true
end
