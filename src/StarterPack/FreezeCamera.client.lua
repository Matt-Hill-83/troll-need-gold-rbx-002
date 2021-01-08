print("Freeze Camera - local script")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("FreezeCameraRE")

local function freezeCamera(cameraPath1, cameraPath2, freeze)
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui.SceneDialogGui

    local camera = workspace.CurrentCamera
    if freeze then
        -- playerGui.Enabled = true
        local cameraOffset = Vector3.new(0, 0, -1)

        if camera.CameraType ~= Enum.CameraType.Scriptable then
            camera.CameraType = Enum.CameraType.Scriptable
        end

        camera.CFrame = CFrame.new(cameraPath1.Position + cameraOffset,
                                   cameraPath2.Position)
    else
        playerGui.Enabled = false
        camera.CameraType = Enum.CameraType.Custom

    end
end

remoteEvent.OnClientEvent:Connect(freezeCamera)
