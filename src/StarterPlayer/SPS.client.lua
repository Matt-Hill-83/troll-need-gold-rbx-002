print("Freeze Camera - local script")
print("Freeze Camera - local script")
print("Freeze Camera - local script")
print("Freeze Camera - local script")
print("Freeze Camera - local script")
print("Freeze Camera - local script")
print("Freeze Camera - local script")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("FreezeCamera1")

local StarterPlayer = game:GetService("StarterPlayer")
local Utils = require(StarterPlayer.Source.StarterPlayerScripts.RSUtils)
print('Utils' .. ' - start');
print(Utils);
print('Utils' .. ' - end');

local Texts = require(ReplicatedStorage.Source.MyParts)
-- local Texts = require(ReplicatedStorage.Source.Texts.Texts)

local function onNotifyPlayer(cameraPath1, cameraPath2, freeze)

    local test = Texts.renderTexts
    print("test" .. "-" .. test)
    print("test" .. "-" .. test)
    print("test" .. "-" .. test)
    print("test" .. "-" .. test)

    local player = game:GetService("Players").LocalPlayer
    print('player' .. ' - start');
    print(player);
    print('player' .. ' - end');

    local playerGui = player.PlayerGui.SceneDialogGui

    print('playerGui.AbsoluteSize' .. ' - start');
    print(playerGui.AbsoluteSize);
    print('playerGui.AbsoluteSize' .. ' - end');

    local camera = workspace.CurrentCamera
    if freeze then
        local cameraOffset = Vector3.new(0, 0, 2)

        if camera.CameraType ~= Enum.CameraType.Scriptable then
            camera.CameraType = Enum.CameraType.Scriptable
        end

        camera.CFrame = CFrame.new(cameraPath1.Position + cameraOffset,
                                   cameraPath2.Position)
    else
        camera.CameraType = Enum.CameraType.Custom
    end
end

remoteEvent.OnClientEvent:Connect(onNotifyPlayer)
