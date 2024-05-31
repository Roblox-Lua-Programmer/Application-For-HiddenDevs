local function onPlayerAdded(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local money = Instance.new("IntValue")
	money.Name = "Money:"
	money.Parent = leaderstats
	money.Value = 0
end
game.Players.PlayerAdded:Connect(onPlayerAdded)
