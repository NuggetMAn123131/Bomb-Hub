--========================
-- CONFIG
--========================
local VALID_KEY = "BH-KEY-0"

--========================
-- SERVICES
--========================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- prevent duplicates
if playerGui:FindFirstChild("KeySystemUI") then
	return
end

--========================
-- KEY GUI
--========================
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.4
bg.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 190)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "BOMB HUB ACCESS"
title.TextColor3 = Color3.fromRGB(255,140,0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(0.8,0,0,40)
box.Position = UDim2.new(0.1,0,0.45,0)
box.PlaceholderText = "Enter Key..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.Parent = frame
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.8,0,0,40)
submit.Position = UDim2.new(0.1,0,0.72,0)
submit.Text = "UNLOCK"
submit.BackgroundColor3 = Color3.fromRGB(40,40,40)
submit.TextColor3 = Color3.fromRGB(255,140,0)
submit.Font = Enum.Font.GothamBold
submit.TextSize = 14
submit.Parent = frame
Instance.new("UICorner", submit).CornerRadius = UDim.new(0,8)

--========================
-- STEP 2: YOUR HUB GOES HERE
--========================
local function loadMainScript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NuggetMAn123131/Bomb-Hub/main/BOMhub%202.7.lua"))()

	print("BOMB HUB LOADED")

	local hub = Instance.new("ScreenGui")
	hub.Name = "MainHub"
	hub.ResetOnSpawn = false
	hub.Parent = playerGui

	local main = Instance.new("Frame")
	main.Size = UDim2.new(0, 260, 0, 120)
	main.Position = UDim2.new(0.5,0,0.5,0)
	main.AnchorPoint = Vector2.new(0.5,0.5)
	main.BackgroundColor3 = Color3.fromRGB(25,25,25)
	main.Parent = hub

	Instance.new("UICorner", main)

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1,0,1,0)
	text.BackgroundTransparency = 1
	text.Text = "BOMB HUB LOADED"
	text.TextColor3 = Color3.fromRGB(255,120,0)
	text.Font = Enum.Font.GothamBold
	text.TextSize = 18
	text.Parent = main

	-- auto remove "loading box"
	task.delay(2, function()
		if hub then hub:Destroy() end
	end)
end

--========================
-- KEY CHECK
--========================
submit.MouseButton1Click:Connect(function()

	if box.Text == VALID_KEY then

		submit.Text = "ACCESS GRANTED"
		submit.TextColor3 = Color3.fromRGB(0,255,120)

		task.wait(0.8)

		gui:Destroy()
		loadMainScript()

	else
		submit.Text = "WRONG KEY"
		submit.TextColor3 = Color3.fromRGB(255,0,0)

		task.wait(0.8)

		submit.Text = "UNLOCK"
		submit.TextColor3 = Color3.fromRGB(255,140,0)
	end
end)