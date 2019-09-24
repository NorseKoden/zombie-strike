local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local EnglishNumbers = require(ReplicatedStorage.Core.EnglishNumbers)
local UserThumbnail = require(ReplicatedStorage.Core.UI.UserThumbnail)

local HubWorld = ReplicatedStorage.HubWorld.Value
local LocalPlayer = Players.LocalPlayer
local SquadMembers = script.Parent.Main.SquadMembers

local function squadMemberFrame(frame, player)
	local function setHealth()
		local character = player.Character

		if character then
			local humanoid = player.Character:WaitForChild("Humanoid")
			local healthFrame = frame.Health
			healthFrame.Fill.Size = UDim2.new(humanoid.Health / humanoid.MaxHealth, 0, 1, 0)

			if player == LocalPlayer then
				healthFrame.Label.Text = ("%d / %d"):format(EnglishNumbers(humanoid.Health), EnglishNumbers(humanoid.MaxHealth))
			else
				healthFrame.Percent.Text = ("%d%%"):format((humanoid.Health / humanoid.MaxHealth) * 100)
			end
		end
	end

	UserThumbnail(player):andThen(function(thumbnail)
		frame.Avatar.Image.Image = thumbnail
	end)

	player.AncestryChanged:connect(function()
		if not player:IsDescendantOf(game) then
			frame:Destroy()
		end
	end)

	local function characterAdded(character)
		setHealth()
		character.Humanoid.Changed:connect(setHealth)
	end

	if player.Character then
		characterAdded(player.Character)
	end

	player.CharacterAdded:connect(characterAdded)

	frame.Visible = true
end

squadMemberFrame(SquadMembers.You, LocalPlayer)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

if not HubWorld then
	local function playerAdded(player)
		if player == LocalPlayer then return end
		local frame = SquadMembers.Template:Clone()
		frame.Parent = SquadMembers
		squadMemberFrame(frame, player)
	end

	for _, player in pairs(Players:GetPlayers()) do
		playerAdded(player)
	end

	Players.PlayerAdded:connect(playerAdded)
end
