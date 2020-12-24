print("LetterFallFreezeCamera - local script")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("LetterFallFreezeCameraRE")

local function onClientEvent(cameraPath1, cameraPath2, freeze)
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui.SceneDialogGui

    local camera = workspace.CurrentCamera
    if freeze then
        local cameraOffset = Vector3.new(0, 0, 0)
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = CFrame.new(cameraPath1.Position + cameraOffset,
                                   cameraPath2.Position)
    else
        camera.CameraType = Enum.CameraType.Custom
    end
end

remoteEvent.OnClientEvent:Connect(onClientEvent)
