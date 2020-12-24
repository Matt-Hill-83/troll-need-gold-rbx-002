local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Buttons = require(Sss.Source.Buttons.Buttons)
local Constants = require(Sss.Source.Constants.Constants)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local freezeCameraRE = ReplicatedStorage:WaitForChild("FreezeCameraRE")
local renderDialogRE = ReplicatedStorage:WaitForChild("RenderDialogRE")
local nextPageButtonClickRE = ReplicatedStorage:WaitForChild(
                                  "NextPageButtonClickRE")

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

    local theaterState = {pageNumber = 1, updating = false, numUsersSeated = 0}

    function getFrameConfig(sceneConfig)
        return sceneConfig.frames[theaterState.pageNumber]
    end

    function updateFrameItems(newSceneProps, frameConfig, numPages, pageNumber)
        addCharactersToScene(newSceneProps)

        for i, player in pairs(Players:GetPlayers()) do
            print(player.Name)
            local sgui = player.PlayerGui.SceneDialogGui

            Buttons.updateButtonActiveStatus2(
                {
                    pageNum = pageNumber,
                    -- pageNum = theaterState.pageNumber,
                    numPages = numPages,
                    sgui = sgui
                })
        end
        renderDialogRE:FireAllClients(frameConfig.dialogs)
    end

    function onNextPageClick()
        function closure()
            print('onNextPageClick' .. ' - start');
            local sceneConfig = sceneConfig
            local frameConfig = sceneConfig.frames[theaterState.pageNumber]
            print('theaterState.updating' .. ' - start');
            print(theaterState.updating);
            if theaterState.updating == true then return end
            theaterState.updating = true
            print('theaterState.numUsersSeated' .. ' - start');
            print(theaterState.numUsersSeated);
            if theaterState.numUsersSeated == 0 then return end
            print("valid")
            print("valid")
            print("valid")
            print("valids")
            if theaterState.pageNumber < numPages then
                theaterState.pageNumber = theaterState.pageNumber + 1

                local frameConfig = sceneConfig.frames[theaterState.pageNumber]

                local newSceneProps = {
                    frameConfig = frameConfig,
                    clonedScene = clonedScene,
                    sceneFolder = sceneFolder
                }
                updateFrameItems(newSceneProps, frameConfig, numPages,
                                 theaterState.pageNumber)
            end
            theaterState.updating = false
        end
        return closure
    end

    nextPageButtonClickRE.OnServerEvent:Connect(onNextPageClick())

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

            local thisSeatState = {}

            if humanoid then
                local pageNum = 1

                local character = humanoid.Parent
                local player = Players:GetPlayerFromCharacter(character)

                if player then
                    theaterState.pageNumber = 1
                    theaterState.numUsersSeated =
                        theaterState.numUsersSeated + 1
                    theaterState.updating = false

                    currentPlayer = player

                    local frameConfig =
                        sceneConfig.frames[theaterState.pageNumber]

                    local newSceneProps =
                        {
                            frameConfig = frameConfig,
                            clonedScene = clonedScene,
                            sceneFolder = sceneFolder
                        }
                    updateFrameItems(newSceneProps, frameConfig, numPages,
                                     theaterState.pageNumber)

                    freezeCameraRE:FireAllClients(cameraPath1, cameraPath2, true)
                    return
                end
            end

            if currentPlayer then
                theaterState.numUsersSeated = theaterState.numUsersSeated - 1
                currentPlayer.Character:WaitForChild("Humanoid").WalkSpeed =
                    Constants.walkSpeed
                freezeCameraRE:FireClient(currentPlayer, cameraPath1,
                                          cameraPath2, false)
                currentPlayer = nil
            end
        end)

end

return module

