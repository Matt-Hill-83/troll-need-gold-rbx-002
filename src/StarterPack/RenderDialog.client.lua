print("RenderDialog2 - local script")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("RenderDialogRE")
local StarterPlayer = game:GetService("StarterPlayer")
local Texts = require(StarterPlayer.Source.Texts)

local function onNotifyPlayer(dialogs)
    print("RenderDialog - local event")

    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui.SceneDialogGui

    Texts.renderTexts({dialogConfigs = dialogs, sgui = playerGui})
end

remoteEvent.OnClientEvent:Connect(onNotifyPlayer)