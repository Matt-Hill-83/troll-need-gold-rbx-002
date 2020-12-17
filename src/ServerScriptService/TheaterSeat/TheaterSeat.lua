local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Buttons = require(Sss.Source.Buttons.Buttons)
local Constants = require(Sss.Source.Constants.Constants)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local freezeCameraRE = ReplicatedStorage:WaitForChild("FreezeCameraRE")
local renderDialogRE = ReplicatedStorage:WaitForChild("RenderDialogRE")

local module = {}

function module.addSeat(props)
    local seat = props.seat
    local clonedScene = props.clonedScene
    local sceneConfig = props.sceneConfig
    local addCharactersToScene = props.addCharactersToScene
    local sceneFolder = props.sceneFolder
    -- local openBridgeDoor = props.openBridgeDoor

    local Players = game:GetService("Players")
    local currentPlayer = nil
    local numPages = #sceneConfig.frames

    function renderScreenDialog(props)
        local player = props.player
        local frameConfig = props.frameConfig

        renderDialogRE:FireClient(player, frameConfig.dialogs)
    end

    function openBridgeDoor(props)
        local clonedScene2 = props.clonedScene
        local bridgeDoorRight = Utils.getFirstDescendantByName(clonedScene2,
                                                               "BridgeDoorRight")
        local bridgeDoorLeft = Utils.getFirstDescendantByName(clonedScene2,
                                                              "BridgeDoorLeft")

        if bridgeDoorRight then bridgeDoorRight:Destroy() end
        if bridgeDoorLeft then bridgeDoorLeft:Destroy() end
    end

    seat:GetPropertyChangedSignal("Occupant"):Connect(
        function()
            local cameraPath1 = Utils.getFirstDescendantByName(clonedScene,
                                                               "ScreenCameraPath1")
            local cameraPath2 = Utils.getFirstDescendantByName(clonedScene,
                                                               "ScreenCameraPath2")

            local humanoid = seat.Occupant
            if humanoid then
                local pageNum = 1

                local character = humanoid.Parent
                local player = Players:GetPlayerFromCharacter(character)
                local frameConfig = sceneConfig.frames[pageNum]

                if player then
                    currentPlayer = player

                    renderScreenDialog({
                        frameConfig = frameConfig,
                        player = player
                    })

                    local props2 = {
                        clonedScene = clonedScene,
                        numPages = numPages,
                        sceneConfig = sceneConfig,
                        sceneFolder = sceneFolder,
                        player = player,
                        addCharactersToScene = addCharactersToScene,
                        renderScreenDialog = renderScreenDialog,
                        sgui = player.PlayerGui.SceneDialogGui,
                        openBridgeDoor = openBridgeDoor
                    }
                    Buttons.configButtons(props2)

                    freezeCameraRE:FireClient(player, cameraPath1, cameraPath2,
                                              true)
                    return
                end
            end

            if currentPlayer then
                currentPlayer.Character:WaitForChild("Humanoid").WalkSpeed =
                    Constants.walkSpeed
                freezeCameraRE:FireClient(currentPlayer, cameraPath1,
                                          cameraPath2, false)
                currentPlayer = nil
            end
        end)

end

return module

