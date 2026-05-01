local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FOVSliderGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 80)
frame.Position = UDim2.new(0.5, -125, 0.8, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0

local bar = Instance.new("Frame", frame)
bar.Size = UDim2.new(1, -20, 0, 10)
bar.Position = UDim2.new(0, 10, 0.5, -5)
bar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
bar.BorderSizePixel = 0

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0.3, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fill.BorderSizePixel = 0

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 20)
label.Position = UDim2.new(0, 0, 0, 5)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1,1,1)
label.Text = "FOV: 70"
label.Font = Enum.Font.SourceSansBold
label.TextSize = 18

local minFOV = 40
local maxFOV = 120
local currentFOV = 70
local dragging = false

-- APPLY FOV ALWAYS
local function applyFOV()
	camera.FieldOfView = currentFOV
end

-- keep enforcing (fixes reset issue)
game:GetService("RunService").RenderStepped:Connect(applyFOV)

-- update slider
local function update(inputX)
	local pos = bar.AbsolutePosition.X
	local size = bar.AbsoluteSize.X

	local alpha = math.clamp((inputX - pos) / size, 0, 1)

	fill.Size = UDim2.new(alpha, 0, 1, 0)

	currentFOV = math.floor(minFOV + (maxFOV - minFOV) * alpha)
	label.Text = "FOV: " .. currentFOV

	applyFOV()
end

bar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		update(input.Position.X)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		update(input.Position.X)
	end
end)

-- reset fix on respawn
player.CharacterAdded:Connect(function()
	task.wait(0.5)
	camera.FieldOfView = currentFOV
end)

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FOVSliderGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 80)
frame.Position = UDim2.new(0.5, -125, 0.8, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0

local bar = Instance.new("Frame", frame)
bar.Size = UDim2.new(1, -20, 0, 10)
bar.Position = UDim2.new(0, 10, 0.5, -5)
bar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
bar.BorderSizePixel = 0

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0.3, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
fill.BorderSizePixel = 0

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 20)
label.Position = UDim2.new(0, 0, 0, 5)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1,1,1)
label.Text = "FOV: 70"
label.Font = Enum.Font.SourceSansBold
label.TextSize = 18

local minFOV = 40
local maxFOV = 120
local currentFOV = 70
local dragging = false

-- APPLY FOV ALWAYS
local function applyFOV()
	camera.FieldOfView = currentFOV
end

-- keep enforcing (fixes reset issue)
game:GetService("RunService").RenderStepped:Connect(applyFOV)

-- update slider
local function update(inputX)
	local pos = bar.AbsolutePosition.X
	local size = bar.AbsoluteSize.X

	local alpha = math.clamp((inputX - pos) / size, 0, 1)

	fill.Size = UDim2.new(alpha, 0, 1, 0)

	currentFOV = math.floor(minFOV + (maxFOV - minFOV) * alpha)
	label.Text = "FOV: " .. currentFOV

	applyFOV()
end

bar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		update(input.Position.X)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		update(input.Position.X)
	end
end)

-- reset fix on respawn
player.CharacterAdded:Connect(function()
	task.wait(0.5)
	camera.FieldOfView = currentFOV
end)

