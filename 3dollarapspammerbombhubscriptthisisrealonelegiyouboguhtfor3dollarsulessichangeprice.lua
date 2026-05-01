--// KEY SYSTEM

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// VALID KEYS
local validKeys = {
	["J9mV2sL7xQp5nF8d"] = true,
	["V2nP8xR7qT4kL6mZ"] = true,
	["P4kT9xQ6nR1vL8mZ"] = true,
	["rT4zK8bN1vX6qP3m"] = true,
	["Qw8nV2kL9pR6xYt3"] = true,
	["Z3mP7qT1xN8bV5kL"] = true,
	["aF6xR9pK2nV8tQ4w"] = true,
	["L8qT3nX7vP1mR6zK"] = true,
	["dP2kV9xQ5nT8rZ3m"] = true,
	["V7nL4qX8pR1kT6bZ"] = true,
	["xQ9mT3vR7nK2pL8w"] = true,
	["K5zP8nV2qR9xT1mL"] = true,
	["tR6xQ3nP8vK1mZ7b"] = true,
	["N2pL7xV9qT4rK8mZ"] = true,
	["M8vQ1kT6nR3xP9bL"] = true,
	["pT4nZ7xK2vQ8mR6L"] = true,
	["R9xP2qV7nT5kL3mZ"] = true,
	["bK6nT8xQ1vR4pL9m"] = true,
	["L3qV7nP8xT2mR6kZ"] = true,
	["X1kR9pT4nV7qL8mB"] = true,
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
	loadstring(game:HttpGet("https://raw.githubusercontent.com/NuggetMAn123131/Bomb-Hub/main/NEWAPSAMMER.lua"))()

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