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
local Theater = require(Sss.Source.Theater.Theater)

local module = {}
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

function module.addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder
    local questIndex = props.questIndex

    local sceneTemplateModel = Utils.getFirstDescendantByName(questFolder,
                                                              "SceneTemplate")

    local wallTemplate =
        Utils.getFirstDescendantByName(questFolder, "SceneBase")

    local startPosition = getStartPosition(
                              {
            gridPadding = gridPadding,
            parent = parent,
            child = wallTemplate
        })

    local thisTeleporter = Utils.getFirstDescendantByName(sceneTemplateModel,
                                                          "QuestTeleporterModel")
    local skyBoxTeleporter = thisTeleporter:Clone()
    skyBoxTeleporter.Parent = questFolder
    skyBoxTeleporter.Name = thisTeleporter.Name .. "-home"

    for sceneIndex, sceneConfig in ipairs(sceneConfigs) do
        local entered = {value = false}
        local entered2 = {value = false}
        local numPages = #sceneConfig.frames
        local pageNum = 1

        local newPosition = getNewPosition(
                                {
                coordinates = sceneConfig.coordinates,
                template = wallTemplate
            })

        local clonedScene = Utils.cloneModel(
                                {
                model = sceneTemplateModel,
                position = CFrame.new(newPosition + startPosition),
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

        local function hideWall(clonedScene)
            local dialog = Utils.getFirstDescendantByName(clonedScene,
                                                          "WallTemplate")

            local items = dialog:GetDescendants()
            for i, item in ipairs(items) do
                Utils.hideItemAndChildren({item = item, hide = true})
                if item:IsA("BasePart") then
                    item.CanCollide = false
                end
            end

        end

        local function unHideWall(clonedScene)
            local dialog = Utils.getFirstDescendantByName(clonedScene,
                                                          "WallTemplate")
            local items = dialog:GetDescendants()
            for i, item in ipairs(items) do
                Utils.hideItemAndChildren({item = item, hide = false})
            end
        end

        local function regionEnter(plr, clonedScene, entered)
            local buttonPressed = false
            if not buttonPressed then
                buttonPressed = true
                if not entered.value then
                    unHideWall(clonedScene)
                    entered.value = true
                end
                buttonPressed = false
            end
        end

        local function regionExit(plr, clonedScene, entered)
            local buttonPressed = false
            if not buttonPressed then
                buttonPressed = true
                if entered.value then
                    hideWall(clonedScene)
                    entered.value = false
                end
                buttonPressed = false
            end
        end

        local part = Utils.getFirstDescendantByName(clonedScene,
                                                    "UserDetectionRegion")

        local function onPartTouched(otherPart)
            -- Get the other part's parent
            local partParent = otherPart.Parent
            -- Look for a humanoid in the parent
            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                regionEnter(humanoid, clonedScene, entered)
            end
        end

        part.Touched:Connect(onPartTouched)

        local function onPartTouchEnded(otherPart)
            local partParent = otherPart.Parent
            if partParent then
                local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    regionExit(humanoid, clonedScene, entered)
                end
            end
        end

        part.TouchEnded:Connect(onPartTouchEnded)

        local seat = Utils.getFirstDescendantByName(clonedScene, "CouchSeat")
        local Players = game:GetService("Players")
        local currentPlayer = nil

        seat:GetPropertyChangedSignal("Occupant"):Connect(
            function()

                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local remoteEvent = ReplicatedStorage:WaitForChild(
                                        "RemoteEventTest")

                local humanoid = seat.Occupant
                if humanoid then
                    local character = humanoid.Parent
                    -- character:WaitForChild("Humanoid").WalkSpeed = 0 

                    -- local humanoid = character:WaitForChild("Humanoid")
                    local rootPart = character:WaitForChild("HumanoidRootPart")

                    local nextButton = Utils.getFirstDescendantByName(
                                           clonedScene, "WallTemplate")

                    local player = Players:GetPlayerFromCharacter(character)
                    remoteEvent:FireClient(player, nextButton)

                    if player then
                        unHideWall(clonedScene)
                        currentPlayer = player
                        return
                    end
                end

                if currentPlayer then
                    hideWall(clonedScene)
                    currentPlayer = nil
                end
            end)

        local sceneFolder = Utils.getOrCreateFolder(
                                {
                name = clonedScene.Name .. sceneIndex,
                parent = questFolder
            })

        clonedScene.Parent = sceneFolder

        Bridges.configBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local frameConfig = sceneConfig.frames[pageNum]
        local charProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene,
            sceneFolder = sceneFolder
        }

        Characters.addCharactersToScene(charProps)
        Location.addLocation({scene = clonedScene, sceneConfig = sceneConfig})

        local gameTitleLabel = Utils.getFirstDescendantByName(clonedScene,
                                                              "GameTitleLabel")
        gameTitleLabel.Text = "Quest:   " ..
                                  (questConfig.questTitle or 'Game Title')

        function updateButtonActiveStatus(props)
            local clonedScene2 = props.clonedScene
            local pageNum2 = props.pageNum
            local numPages2 = props.numPages

            local nextButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "NextPageButton")
            nextButton.Active = pageNum2 < numPages2
            nextButton.Text = nextButton.Active and
                                  Constants.buttonLabels.NextPage or "---"

            local prevButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "PrevPageButton")
            prevButton.Active = pageNum2 > 1
            prevButton.Text = prevButton.Active and
                                  Constants.buttonLabels.PrevPage or "---"

            local pageNumLabel = Utils.getFirstDescendantByName(clonedScene2,
                                                                "PageNumLabel")
            pageNumLabel.Text = "<b>" .. "Page: " .. "</b>" .. pageNum2 ..
                                    " of " .. numPages2

        end

        updateButtonActiveStatus({
            pageNum = pageNum,
            clonedScene = clonedScene,
            numPages = numPages
        })

        local props2 = {
            updateButtonActiveStatus = updateButtonActiveStatus,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig,
            sceneFolder = sceneFolder
        }
        Buttons.doFrameStuff(props2)

        hideWall(clonedScene)

        local theaterProps = {
            sceneFolder = sceneFolder,
            sceneIndex = sceneIndex,
            questIndex = questIndex,
            hideWall = hideWall,
            unHideWall = unHideWall
        }
        -- set up Theater
        -- Theater.configTheater(theaterProps)

    end
    sceneTemplateModel:Destroy()
end

return module
