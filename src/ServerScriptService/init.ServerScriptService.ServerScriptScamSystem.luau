local function createPlayerGUI(player)
	local moneyStats = player:WaitForChild("leaderstats"):WaitForChild("Money:")
	local function managePlayerScreenGuis(player)
		local playerGui = player:FindFirstChild("PlayerGui")
		if playerGui then
			local count = 0
			for _, gui in ipairs(playerGui:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Name == "PlayerScreenGui" then
					count = count + 1
					if count > 1 then
						gui:Destroy()
					end
				end
			end
		end
	end
	local function continuousCheck(player)
		while true do
			managePlayerScreenGuis(player)
			task.wait()
		end
	end
	
	coroutine.wrap(function()
		continuousCheck(player)
	end)()
	local function onTouch(hit)
		local character = hit.Parent
		if character and character:FindFirstChild("Humanoid") then
			local playerTouching = game.Players:GetPlayerFromCharacter(character)
			if playerTouching == player then

				local screenGui = Instance.new("ScreenGui")
				screenGui.Name = "PlayerScreenGui"
				screenGui.Parent = player:WaitForChild("PlayerGui")

				local frame = Instance.new("Frame")
				frame.Size = UDim2.new(.5, 0, .5, 0)
				frame.Position = UDim2.new(0.25, 0, 0.25, 0)
				frame.BackgroundColor3 = Color3.new(0, 0, 0)
				frame.Parent = screenGui
				local exitButton = Instance.new("ImageButton")
				exitButton.Size = UDim2.new(0.03, 0, 0.1, 0)
				exitButton.Position = UDim2.new(.968, 0, 0, 0)
				exitButton.BackgroundColor3 = Color3.new(1, 1, 1)
				exitButton.Name = "ExitButton"
				exitButton.Parent = frame
				exitButton.Image = "http://www.roblox.com/asset/?id=14255553547"
				local function onHover()
					exitButton.BackgroundColor3 = Color3.new(1, 0, 0)
				end
				local function onClickA()
					screenGui:Destroy()
				end
				local function onHoverEnd()
					exitButton.BackgroundColor3 = Color3.new(1, 1, 1)
				end
				exitButton.MouseEnter:Connect(onHover)
				exitButton.MouseButton1Click:Connect(onClickA)
				exitButton.MouseLeave:Connect(onHoverEnd)
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(1, 0, 0.2, 0)
				textLabel.Position = UDim2.new(0, 0, 0, 0)
				textLabel.Text = "Welcome to the Bank!"
				textLabel.TextScaled = true
				textLabel.TextColor3 = Color3.new(1, 1, 1)
				textLabel.BackgroundTransparency = 1
				textLabel.Name = "Title"
				textLabel.Parent = frame

				local scamButton = Instance.new("TextButton")
				scamButton.Size = UDim2.new(0.5, 0, 0.2, 0)
				scamButton.Position = UDim2.new(0.25, 0, 0.5, 0)
				scamButton.Text = "Press here to start!"
				scamButton.TextScaled = true
				scamButton.TextColor3 = Color3.new(0, 255, 0)
				scamButton.Name = "ScamButton"
				scamButton.Parent = frame

				local function onClick()
					scamButton:Destroy()
					textLabel:Destroy()

					local scamTitle = Instance.new("TextLabel")
					scamTitle.Size = UDim2.new(1, 0, 0.2, 0)
					scamTitle.Position = UDim2.new(0, 0, 0, 0)
					scamTitle.Text = "Welcome To The Security System >:)"
					scamTitle.TextScaled = true
					scamTitle.TextColor3 = Color3.new(1, 0, 0)
					scamTitle.BackgroundTransparency = 1
					scamTitle.Name = "ScamTitle"
					scamTitle.Parent = frame

					local Functions = require(game:GetService("ReplicatedStorage").RNGScamSystem)
					local stolen = require(game:GetService("ReplicatedStorage").StolenMoney)

					-- Generate different random combinations
					local e = Functions.generateRandomCombination(1)
					local f = Functions.generateRandomCombination(1)
					local g = Functions.generateRandomCombination(1)
					local stolenm = stolen.generatingmoney(3)

					-- Convert to numbers
					e = tonumber(e)
					f = tonumber(f)
					g = tonumber(g)

					local values = {e, f, g}
					table.sort(values)

					local buttons = {}
					local buttonOrder = {e, f, g}

					for i, value in ipairs(buttonOrder) do
						local button = Instance.new("TextButton")
						button.Size = UDim2.new(0.25, 0, 0.2, 0)
						button.Position = UDim2.new(0.375 * (i - 1), 0, 0.5, 0)
						button.Text = tostring(value)
						button.TextScaled = true
						button.TextColor3 = Color3.new(0, 1, 0)
						button.BackgroundColor3 = Color3.new(1, 0, 0)
						button.Name = "RNG" .. i
						button.Parent = frame

						table.insert(buttons, button)
					end
					local currentOrder = 1

					local function handleClick(button, order)
						if tonumber(button.Text) == values[currentOrder] then
							button.BackgroundColor3 = Color3.new(0,1,0)
							currentOrder = currentOrder + 1
							if currentOrder > #values then
								for _, button in pairs(buttons) do
									if button.BackgroundColor3 == Color3.new(0,1,0) then
										button:Destroy()
										scamTitle.TextColor3 = Color3.new(0,1,0)
										scamTitle.Text = "CORRECT!"
										scamTitle.Position = UDim2.new(0,0,0.45,0)
									end
								end
								if scamTitle.Text == "CORRECT!" then
									wait(1)
									scamTitle.Text = "Amount Stolen: £".. stolenm
									moneyStats.Value += stolenm
									wait(1)
									screenGui:Destroy()
								end
								print("CORRECT!")
							end
						else
							print("Incorrect order!")
							for _, button in ipairs(buttons) do
								button:Destroy()
							end
							scamTitle.Position = UDim2.new(0,0,0.45,0)
							scamTitle.Text = "INCORRECT!!!"
							moneyStats.Value /= 2
							if moneyStats.Value == 1 then
								moneyStats.Value = 0
							end
							wait(1)
							frame:Destroy()
							scamTitle:Destroy()
							screenGui:Destroy()
						end
					end

					for i, button in ipairs(buttons) do
						button.MouseButton1Click:Connect(function()
							handleClick(button, i)
						end)
					end
				end

				scamButton.MouseButton1Click:Connect(onClick)
			end
		end
	end

	game.Workspace.Computer.Touched:Connect(onTouch)
end

game.Players.PlayerAdded:Connect(createPlayerGUI)

for _, player in ipairs(game.Players:GetPlayers()) do
	createPlayerGUI(player)
end
