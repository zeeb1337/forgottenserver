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
	
	-- Auto level on login
	local level = configManager.getNumber(configKeys.MIN_WAR_LEVEL)
	if configManager.getBoolean(configKeys.WAR_MODE) then
		if player:getLevel() < level and not player:getGroup():getAccess() then
			player:addExperience(math.floor((Game.getExperienceForLevel(level) - player:getExperience()) + 0.5))
		end
		
		if vocation == 1 or vocation == 2 or vocation == 5 or vocation == 6 then -- Mage
			player:addSkill(SKILL_MAGLEVEL, 60)
			player:addSkill(SKILL_CLUB, 30)
		end
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	return true
end
