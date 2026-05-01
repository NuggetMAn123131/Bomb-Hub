--// KEY SYSTEM

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// KEY SYSTEM

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// VALID KEYS (UPDATED)
local validKeys = {
	["Q9mV2sL7xQp5nF8dZ3kT6rB1wY8uH4jC9aP0xN7vL2sD5eF"] = true,
	["V2nP8xR7qT4kL6mZ9hJ1cS5dF0gA8wE3bY6uI9oP2xC7vN"] = true,
	["P4kL9zX6cV1bN8mQ2wE7rT5yU0iO3pA8sD6fG9hJ1kL4x"] = true,
	["Z8xC3vB6nM9qW1eR4tY7uI0oP2aS5dF8gH1jK6lZ9xC3v"] = true,
	["H7jK2lP9oI4uY6tR1eW8qA3sD5fG0hJ9kL2zX6cV8bN1mQ"] = true,
}

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.35
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "ENTER KEY"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(0.85, 0, 0, 40)
box.Position = UDim2.new(0.075, 0, 0.45, 0)
box.PlaceholderText = "Enter key here..."
box.Text = ""
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
box.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.85, 0, 0, 35)
button.Position = UDim2.new(0.075, 0, 0.75, 0)
button.Text = "UNLOCK"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -20)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.Parent = frame

--// unlock system
local unlocked = false

local function unlock()
	unlocked = true
	status.Text = "ACCESS GRANTED"
	status.TextColor3 = Color3.fromRGB(80, 255, 80)

	task.wait(0.5)
	gui:Destroy()

	-- 🔓 PUT YOUR SCRIPT HERE
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NuggetMAn123131/Bomb-Hub/main/FOVSLIDERPAID.lua"))
	print("Script unlocked!")

	-- example:
	-- loadstring(game:HttpGet("YOUR SCRIPT HERE"))()
end

button.MouseButton1Click:Connect(function()
	local input = box.Text

	if validKeys[input] then
		unlock()
	else
		status.Text = "INVALID KEY"
		status.TextColor3 = Color3.fromRGB(255, 80, 80)
	end
end)