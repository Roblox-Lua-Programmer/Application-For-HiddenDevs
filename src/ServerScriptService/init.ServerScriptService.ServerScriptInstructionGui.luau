game.Players.PlayerAdded:Connect(function(player)
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "InstructionScreen"
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame")
	frame.Name = "InstructionFrame"
	frame.Parent = screenGui
	frame.BackgroundColor3 = Color3.new(0,0,0)
	frame.Size = UDim2.new(.5, 0, .95, 0)
	frame.Position = UDim2.new(.25, 0, 0, 0)

	local title = Instance.new("TextLabel")
	title.Name = "InstructionsWelcome"
	title.Parent = frame
	title.Size = UDim2.new(1, 0, 0.2, 0)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.BackgroundColor3 = frame.BackgroundColor3
	title.TextColor3 = Color3.new(0,1,0)
	title.Text = "Welcome, Hacker " .. player.Name .. ","
	title.TextScaled = true

	local Instructions = Instance.new("TextLabel")
	Instructions.Name = "Instructions"
	Instructions.Parent = frame
	Instructions.Size = UDim2.new(1, 0, 0.2, 0)
	Instructions.Position = UDim2.new(0,0,0.2,0)
	Instructions.BackgroundColor3 = frame.BackgroundColor3
	Instructions.TextColor3 = title.TextColor3
	Instructions.Text = "You're objective is to hack the bank's system and retrieve its riches. Good luck!"
	Instructions.TextScaled = true

	local exit = Instance.new("TextButton")
	exit.Name = "InstructionExit"
	exit.Parent = frame
	exit.Size = UDim2.new(1, 0, 0.6, 0)
	exit.Position = UDim2.new(0,0,0.4,0)
	exit.BackgroundColor3 = Color3.new(1,1,1)
	exit.TextColor3 = frame.BackgroundColor3
	exit.Text = "Press here to exit!"
	exit.TextScaled = true
	local function onHover()
		exit.BackgroundColor3 = Color3.new(1,0,0)
	end
	local function onClick()
		screenGui:Destroy()
	end
	local function onHoverEnd()
		exit.BackgroundColor3 = Color3.new(1,1,1)
	end
	exit.MouseEnter:Connect(onHover)
	exit.MouseButton1Click:Connect(onClick)
	exit.MouseLeave:Connect(onHoverEnd)
end)
