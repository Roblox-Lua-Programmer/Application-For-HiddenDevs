local Functions = {}

Functions.generateRandomCombination = function(to)
	local firewallthingy = "1234567890"
	local combination = ""
	math.randomseed(tick() + math.random(1, 1000000))

	for i = 1, to do
		local randomIndex = math.random(1, #firewallthingy)
		combination = combination .. firewallthingy:sub(randomIndex, randomIndex)
	end
	return combination
end


return Functions
