local module = {}
local Sss = game:GetService("ServerScriptService")

local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)
local Dialog = require(Sss.Source.AddDialog.Dialog)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Utils = require(Sss.Source.Utils.Utils)
local Constants = require(Sss.Source.Constants.Constants)

renderCharacters = function(props)
    local characterTemplate = props.template
    local itemConfigs = props.itemConfigs

    local xGap = 1
    for i, itemConfig in ipairs(itemConfigs) do
        local newItem = characterTemplate:Clone()
        local x = (i - 1) * -(characterTemplate.Size.X + xGap)

        Utils.mergeTables(newItem, {
            Transparency = 1,
            CFrame = newItem.CFrame * CFrame.new(Vector3.new(x, 0, 0)),
            Parent = characterTemplate
        })

        local decalFront = Utils.getDescendantByName(newItem, "DecalFront")
        local decalBack = Utils.getDescendantByName(newItem, "DecalBack")
        local decalId = Utils.getDecalIdFromName({name = itemConfig.name})

        decalFront.Texture = 'rbxassetid://' .. decalId
        decalBack.Texture = 'rbxassetid://' .. decalId
    end
    characterTemplate.Transparency = 1

    characterTemplate.Position = characterTemplate.Position +
                                     Vector3.new(0, -100, 0)
end

getStartPosition = function(parent, child)
    local childSize = child.Size
    local desiredOffsetFromParentEdge = Vector3.new(-4, 0, -4)

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

function addItemsToScene(props)
    local frameConfig = props.frameConfig
    local clonedScene = props.clonedScene
    local characterConfigs01 = frameConfig.characters01
    local characterConfigs02 = frameConfig.characters02

    renderCharacters({
        template = Utils.getDescendantByName(clonedScene, "CharacterTemplate01"),
        itemConfigs = characterConfigs01
    })
    renderCharacters({
        template = Utils.getDescendantByName(clonedScene, "CharacterTemplate02"),
        itemConfigs = characterConfigs02
    })

    local dialogTemplate = Utils.getDescendantByName(clonedScene,
                                                     "DialogTemplate")
    Dialog.renderDialog({
        dialogConfigs = frameConfig.dialogs,
        dialogTemplate = dialogTemplate
    })
end

function destroyBridges(props)
    -- all bridges are created in clone.
    -- remove bridges that do not go anywhere
    local sceneConfig = props.sceneConfig
    local clonedScene = props.clonedScene

    local showBottomPath = sceneConfig.showBottomPath
    local showRightPath = sceneConfig.showRightPath
    local showTopPath = sceneConfig.showTopPath
    local showLeftPath = sceneConfig.showLeftPath

    local bridgeRightModel = Utils.getDescendantByName(clonedScene,
                                                       "BridgeRightModel")
    if (showRightPath) then
        local bridgeWallRight = Utils.getDescendantByName(clonedScene,
                                                          "BridgeWallRight")
        bridgeWallRight.Parent = nil
        bridgeWallRight:Destroy()
    else
        bridgeRightModel.Parent = nil
        bridgeRightModel:Destroy()
    end

    if (showLeftPath) then
        local bridgeWallLeft = Utils.getDescendantByName(clonedScene,
                                                         "BridgeWallLeft")

        bridgeWallLeft.Parent = nil
        bridgeWallLeft:Destroy()
    else
        Utils.deleteChildrenByName({
            parent = clonedScene,
            childName = "WallLeftOld"
        })
    end

    local bridgeBottomModel = Utils.getDescendantByName(clonedScene,
                                                        "BridgeBottomModel")
    if (showBottomPath) then
        local bridgeWallFront = Utils.getDescendantByName(clonedScene,
                                                          "BridgeWallFront")
        bridgeWallFront.Parent = nil
        bridgeWallFront:Destroy()
    else
        bridgeBottomModel.Parent = nil
        bridgeBottomModel:Destroy()
    end

    if (showTopPath) then
        local bridgeWallBack = Utils.getDescendantByName(clonedScene,
                                                         "BridgeWallBack")
        bridgeWallBack.Parent = nil
        bridgeWallBack:Destroy()
    else
        Utils.deleteChildrenByName({
            parent = clonedScene,
            childName = "WallBackOld"
        })
    end
end

function addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs

    local sceneTemplateModel = Utils.getFromTemplates("SceneTemplate")
    local wallTemplate = Utils.getFromTemplates("WallTemplate")

    local startPosition = getStartPosition(parent, wallTemplate)

    for i, sceneConfig in ipairs(sceneConfigs) do
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
                position = newPosition + startPosition,
                suffix = "-clone--" .. i
            })

        destroyBridges({sceneConfig = sceneConfig, clonedScene = clonedScene})

        local newWall = clonedScene.PrimaryPart

        local frameConfig = sceneConfig.frames[pageNum]
        local sceneProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene
        }

        -- Image
        -- Image
        local locationModelImage = Utils.getFromTemplates("LocationModelImage")
        local imageLabelFront = Utils.getDescendantByName(locationModelImage,
                                                          'ImageLabel')
        local imageId = Utils.getDecalIdFromName({name = sceneConfig.name})
        imageLabelFront.Image = 'rbxassetid://' .. imageId

        -- Label
        -- Label
        local locationModelLabel = Utils.getFromTemplates("LocationModelLabel")
        local textLabel = Utils.getDescendantByName(locationModelLabel,
                                                    'TextLabel')
        textLabel.Text = Utils.getDisplayNameFromName({name = sceneConfig.name})

        addItemsToScene(sceneProps)

        function incrementPage()
            local newPageNum = pageNum + 1
            if newPageNum <= numPages then
                pageNum = newPageNum

                local children = newWall:GetChildren()
                for _, item in pairs(children) do
                    local match1 = string.match(item.Name, "Items-")
                    local match2 = string.match(item.Name, "Characters-")
                    local match3 = string.match(item.Name, "Dialog-")
                    if item:IsA('Part') and (match1 or match2 or match3) then
                        item:Destroy()
                    end
                end

                local newFrameConfig = sceneConfig.frames[pageNum]
                local newSceneProps = {
                    frameConfig = newFrameConfig,
                    clonedScene = clonedScene
                }
                addItemsToScene(newSceneProps)
            end
        end

        local nextPageButtonTemplate = Utils.getDescendantByName(clonedScene,
                                                                 "NextPageButton")

        local nextButton = Utils.getDescendantByName(nextPageButtonTemplate,
                                                     "TextButton")

        nextButton.MouseButton1Click:Connect(incrementPage)
    end
end

function addRemoteObjects()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0

    local questConfigs = SceneConfig.getScenesConfig()
    local myStuff = workspace:FindFirstChild("MyStuff")
    local sceneLocations = myStuff:FindFirstChild("SceneLocations")

    local sceneOrigins = {}
    local children = sceneLocations:GetChildren()
    for i, item in pairs(children) do
        if item:IsA('Part') then
            sceneOrigins[i] = item
            --
        end
    end

    local gameOrigin = sceneOrigins[1]
    local sibling = gameOrigin

    for i, questConfig in pairs(questConfigs) do
        local gridSize = questConfig.gridSize
        local gridPadding = 0

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        local questBlockProps = {
            parent = gameOrigin,
            size = Vector3.new(x, 2, z),
            sibling = sibling,
            isFirst = i == 1
        }

        local questBlock = QuestBlock.renderQuestBlock(questBlockProps)
        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs
        }
        addScenes(addScenesProps)
        sibling = questBlock

    end

end

module.addRemoteObjects = addRemoteObjects
return module

