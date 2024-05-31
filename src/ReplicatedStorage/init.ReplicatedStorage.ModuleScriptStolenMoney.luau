local stolen = {}

stolen.generatingmoney = function (sm)
	local numbers = "1234567890"
	local combination = ""
	for i = 1, sm do
		local randomIndex = math.random(1, #numbers)
		combination = combination .. numbers:sub(randomIndex, randomIndex)
	end
	return combination
end

return stolen
