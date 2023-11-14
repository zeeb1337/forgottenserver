local blessings = {
	"Spiritual Shielding",
	"Embrace of Tibia",
	"Fire of the Suns",
	"Spark of the Phoenix",
	"Wisdom of Solitude",
	"Twist of Fate"
}

function onSay(player, words, param)
	if player:getGroup():getAccess() then
		return true
	end
	
	local message = {"Current blessings:"}
	for i, blessing in pairs(blessings) do
		if player:hasBlessing(i) then
			message[#message + 1] = blessing
		end
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, #message == 1 and "You have no blessings." or table.concat(message, '\n'))
	return false
end