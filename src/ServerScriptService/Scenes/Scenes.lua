local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local Buttons = require(Sss.Source.Buttons.Buttons)
local Teleporters = require(Sss.Source.Teleporters.Teleporters)
local DropBox = require(Sss.Source.DropBox.DropBox)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local freezeCameraRE = ReplicatedStorage:WaitForChild("FreezeCameraRE")
local renderDialogRE = ReplicatedStorage:WaitForChild("RenderDialogRE")

local module = {}

function module.addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder
    local questIndex = props.questIndex

    local thisPlayer = nil
    local sceneTemplateModel = Utils.getFirstDescendantByName(questFolder,
                                                              "SceneTemplate")

    local sceneBase = Utils.getFirstDescendantByName(questFolder, "SceneBase")

    local sceneStartPosition = getStartPosition(
                                   {
            gridPadding = gridPadding,
            parent = parent,
            child = sceneBase
        })

    local thisTeleporter = Utils.getFirstDescendantByName(sceneTemplateModel,
                                                          "QuestTeleporterModel")
    local skyBoxTeleporter = thisTeleporter:Clone()
    skyBoxTeleporter.Parent = questFolder
    skyBoxTeleporter.Name = thisTeleporter.Name .. "-home"

    for sceneIndex, sceneConfig in ipairs(sceneConfigs) do
        local entered2 = {value = false}
        local numPages = #sceneConfig.frames
        local pageNum = 1

        local newPosition = getNewPosition(
                                {
                coordinates = sceneConfig.coordinates,
                template = sceneBase
            })

        local clonedScene = Utils.cloneModel(
                                {
                model = sceneTemplateModel,
                position = CFrame.new(newPosition + sceneStartPosition),
                suffix = "Clone" .. "-Q" .. questIndex .. "-S" .. sceneIndex
            })

        clonedScene.Name = clonedScene.Name .. sceneIndex

        Teleporters.addTeleporters({
            parent = clonedScene,
            sceneIndex = sceneIndex,
            questIndex = questIndex,
            isStartScene = sceneConfig.isStartScene,
            isEndScene = sceneConfig.isEndScene,
            questTitle = questConfig.questTitle,
            skyBoxTeleporter = skyBoxTeleporter
        })

        local dropBox = Utils.getFirstDescendantByName(clonedScene,
                                                       "DropBoxModel")
        local dropBoxItem = sceneConfig.item or {name = "letter-C"}
        DropBox.configDropBox({
            scene = clonedScene,
            sceneIndex = sceneIndex,
            questIndex = questIndex,
            isStartScene = sceneConfig.isStartScene,
            isEndScene = sceneConfig.isEndScene,
            dropBox = dropBox,
            entered2 = entered2,
            item = dropBoxItem

        })

        local seat = Utils.getFirstDescendantByName(clonedScene, "CouchSeat")
        local Players = game:GetService("Players")
        local currentPlayer = nil

        local sceneFolder = Utils.getOrCreateFolder(
                                {
                name = clonedScene.Name .. sceneIndex,
                parent = questFolder
            })

        clonedScene.Parent = sceneFolder

        seat:GetPropertyChangedSignal("Occupant"):Connect(
            function()

                local cameraPath1 = Utils.getFirstDescendantByName(clonedScene,
                                                                   "ScreenCameraPath1")
                local cameraPath2 = Utils.getFirstDescendantByName(clonedScene,
                                                                   "ScreenCameraPath2")

                local humanoid = seat.Occupant
                if humanoid then
                    local character = humanoid.Parent
                    local player = Players:GetPlayerFromCharacter(character)
                    local frameConfig = sceneConfig.frames[pageNum]

                    freezeCameraRE:FireClient(player, cameraPath1, cameraPath2,
                                              true, frameConfig.dialogs)

                    if player then
                        thisPlayer = player
                        currentPlayer = player

                        pageNum = 1
                        renderScreenDialog({frameConfig = frameConfig})

                        local props2 = {
                            clonedScene = clonedScene,
                            numPages = numPages,
                            sceneConfig = sceneConfig,
                            sceneFolder = sceneFolder,
                            addCharactersToScene = addCharactersToScene,
                            renderScreenDialog = renderScreenDialog,
                            sgui = player.PlayerGui.SceneDialogGui,
                            openBridgeDoor = openBridgeDoor
                        }
                        Buttons.doFrameStuff(props2)
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

        Bridges.configBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        function renderScreenDialog(charProps)
            renderDialogRE:FireClient(thisPlayer, charProps.frameConfig.dialogs)

        end

        function addCharactersToScene(charProps)
            Characters.addCharactersToScene(charProps)
        end

        function openBridgeDoor(props)
            local clonedScene2 = props.clonedScene
            local bridgeDoorRight = Utils.getFirstDescendantByName(clonedScene2,
                                                                   "BridgeDoorRight")
            local bridgeDoorLeft = Utils.getFirstDescendantByName(clonedScene2,
                                                                  "BridgeDoorLeft")

            bridgeDoorRight:Destroy()
            bridgeDoorLeft:Destroy()
        end

        local frameConfig = sceneConfig.frames[pageNum]
        local charProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene,
            sceneFolder = sceneFolder
        }

        addCharactersToScene(charProps)

        Location.addLocation({scene = clonedScene, sceneConfig = sceneConfig})

        local gameTitleLabel = Utils.getFirstDescendantByName(clonedScene,
                                                              "GameTitleLabel")
        gameTitleLabel.Text = "Quest:   " ..
                                  (questConfig.questTitle or 'Game Title')

    end
    sceneTemplateModel:Destroy()
end

getStartPosition = function(props)
    local parent = props.parent
    local child = props.child
    local gridPadding = props.gridPadding

    local childSize = child.Size
    local desiredOffsetFromParentEdge = Vector3.new(-gridPadding / 2, 0,
                                                    -gridPadding / 2)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, 1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, 1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    return RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

function getNewPosition(props)
    local coordinates = props.coordinates
    local gapX = Constants.islandLength + Constants.bridgeLength
    local newX = -(gapX + Constants.buffer) * coordinates.col
    local newZ = coordinates.row *
                     (Constants.islandLength + Constants.bridgeLength +
                         Constants.buffer)
    return Vector3.new(newX, 0, -newZ)
end
return module

-- local function regionEnter(plr, clonedScene, entered)
--     local buttonPressed = false
--     if not buttonPressed then
--         buttonPressed = true
--         if not entered.value then
--             unHideWall(clonedScene)
--             entered.value = true
--         end
--         buttonPressed = false
--     end
-- end

-- local function regionExit(plr, clonedScene, entered)
--     local buttonPressed = false
--     if not buttonPressed then
--         buttonPressed = true
--         if entered.value then
--             hideWall(clonedScene)
--             entered.value = false
--         end
--         buttonPressed = false
--     end
-- end

-- local part = Utils.getFirstDescendantByName(clonedScene,
--                                             "UserDetectionRegion")

-- local function onPartTouched(otherPart)
--     -- Get the other part's parent
--     local partParent = otherPart.Parent
--     -- Look for a humanoid in the parent
--     local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
--     if humanoid then
--         regionEnter(humanoid, clonedScene, entered)
--     end
-- end

-- part.Touched:Connect(onPartTouched)

-- local function onPartTouchEnded(otherPart)
--     local partParent = otherPart.Parent
--     if partParent then
--         local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
--         if humanoid then
--             regionExit(humanoid, clonedScene, entered)
--         end
--     end
-- end

-- part.TouchEnded:Connect(onPartTouchEnded)
