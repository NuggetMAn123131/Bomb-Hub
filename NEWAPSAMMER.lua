local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AdminPanel"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Toggle button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0, 10, 0.5, -25)
toggle.Text = "AP"
toggle.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggle.BackgroundTransparency = 0.3
toggle.TextColor3 = Color3.new(1,1,1)
toggle.TextScaled = true
toggle.Parent = gui
toggle.BorderSizePixel = 0

Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,12)

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 480, 0, 400)
frame.Position = UDim2.new(0, 70, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.25
frame.Parent = gui
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

-- Dragging
local dragging, dragStart, startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Admin Panel"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Parent = frame

-- Player list
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -10, 1, -50)
list.Position = UDim2.new(0, 5, 0, 45)
list.CanvasSize = UDim2.new(0,0,0,0)
list.ScrollBarThickness = 4
list.BackgroundTransparency = 1
list.Parent = frame

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0,6)

-- Send command
local function run(cmd, target)
	channel:SendAsync(cmd .. " " .. target.Name)
end

-- 💥 ALL COMMAND BURST (UPDATED)
local function runAll(target)
	local cmds = {
		";rocket",
		";ragdoll",
		";balloon",
		";inverse",
		";jail",
		";tiny",
		";jumpscare",
		";morph"
	}

	for _, cmd in ipairs(cmds) do
		channel:SendAsync(cmd .. " " .. target.Name)
		task.wait(0.12)
	end
end

-- Button helper
local function makeButton(parent, text, color, callback)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 34, 0, 34)
	b.Text = text
	b.BackgroundColor3 = color
	b.TextScaled = true
	b.Parent = parent
	b.BorderSizePixel = 0

	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)

	b.MouseButton1Click:Connect(callback)
end

-- Player row
local function addPlayer(plr)
	if plr == player then return end

	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -5, 0, 42)
	row.BackgroundColor3 = Color3.fromRGB(15,15,15)
	row.BackgroundTransparency = 0.2
	row.Parent = list
	row.BorderSizePixel = 0

	Instance.new("UICorner", row).CornerRadius = UDim.new(0,12)

	local name = Instance.new("TextLabel")
	name.Size = UDim2.new(0.3, 0, 1, 0)
	name.Text = plr.Name
	name.TextColor3 = Color3.new(1,1,1)
	name.BackgroundTransparency = 1
	name.TextScaled = true
	name.Parent = row

	local actions = Instance.new("Frame")
	actions.Size = UDim2.new(0.7, 0, 1, 0)
	actions.Position = UDim2.new(0.3, 0, 0, 0)
	actions.BackgroundTransparency = 1
	actions.Parent = row

	local layout2 = Instance.new("UIListLayout", actions)
	layout2.FillDirection = Enum.FillDirection.Horizontal
	layout2.Padding = UDim.new(0,6)

	makeButton(actions, "⚔️", Color3.fromRGB(200,60,60), function()
		run(";ragdoll", plr)
	end)

	makeButton(actions, "🔒", Color3.fromRGB(200,160,60), function()
		run(";jail", plr)
	end)

	makeButton(actions, "🚀", Color3.fromRGB(80,150,255), function()
		run(";rocket", plr)
	end)

	makeButton(actions, "🎈", Color3.fromRGB(255,120,200), function()
		run(";balloon", plr)
	end)

	makeButton(actions, "💥", Color3.fromRGB(255,80,80), function()
		runAll(plr)
	end)
end

-- Refresh
local function refresh()
	for _, v in pairs(list:GetChildren()) do
		if v:IsA("Frame") then v:Destroy() end
	end

	for _, plr in ipairs(Players:GetPlayers()) do
		addPlayer(plr)
	end

	task.wait()
	list.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
end

Players.PlayerAdded:Connect(refresh)
Players.PlayerRemoving:Connect(refresh)

refresh()

-- Toggle GUI
toggle.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)