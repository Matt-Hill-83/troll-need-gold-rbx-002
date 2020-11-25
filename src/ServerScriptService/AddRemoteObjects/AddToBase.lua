local module = {}
local Sss = game:GetService("ServerScriptService")

local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)
local Dialog = require(Sss.Source.AddDialog.Dialog)
local ButtonBlock = require(Sss.Source.AddDialog.ButtonBlock)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Utils = require(Sss.Source.Utils.Utils)
local Constants = require(Sss.Source.Constants.Constants)

renderCharacters = function(parent, itemConfigs, templateName)
    local characterTemplate = Utils.getDescendantByName(parent, templateName)

    local xGap = 1
    for i, itemConfig in ipairs(itemConfigs) do
        local newItem = characterTemplate:Clone()
        local x = (i - 1) * -(characterTemplate.Size.X + xGap)

        Utils.mergeTables(newItem, {
            Transparency = 1,
            CFrame = newItem.CFrame * CFrame.new(Vector3.new(x, 0, 0)),
            Parent = parent
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
    local newWall = props.newWall
    local pageNum = props.pageNum
    local sceneConfig = props.sceneConfig
    local clonedScene = props.clonedScene

    local characterConfigs01 = sceneConfig.frames[pageNum].characters01
    local itemConfigs = sceneConfig.frames[pageNum].characters02
    local dialogConfigs = sceneConfig.frames[pageNum].dialogs

    renderCharacters(clonedScene, characterConfigs01, "CharacterTemplate01")
    renderCharacters(clonedScene, itemConfigs, "CharacterTemplate02")

    Dialog.renderDialog({
        parent = newWall,
        dialogConfigs = dialogConfigs,
        clonedScene = clonedScene
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

        local sceneProps = {
            newWall = newWall,
            clonedScene = clonedScene,
            pageNum = pageNum,
            sceneConfig = sceneConfig
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
        local dialogTemplate = Utils.getFromTemplates("DialogTemplate")

        addItemsToScene(sceneProps)

        function incrementPage()
            local newPageNum = pageNum + 1
            print('newPageNum' .. ' - start');
            print(newPageNum);
            print('newPageNum' .. ' - end');
            if newPageNum <= numPages then
                pageNum = newPageNum

                local children = newWall:GetChildren()
                for _, item in pairs(children) do
                    print('item.Name' .. ' - start');
                    print(item.Name);
                    print('item.Name' .. ' - end');
                    local match1 = string.match(item.Name, "Items-")
                    local match2 = string.match(item.Name, "Characters-")
                    local match3 = string.match(item.Name, "Dialog-")
                    if item:IsA('Part') and (match1 or match2 or match3) then
                        item:Destroy()
                    end
                end

                local newSceneProps = {
                    newWall = newWall,
                    pageNum = pageNum,
                    sceneConfig = sceneConfig
                }
                addItemsToScene(newSceneProps)
            end
        end

        local renderButtonBlockProps = {
            parent = newWall,
            sibling = dialogTemplate,
            incrementPage = incrementPage,
            pageNum = pageNum
        }

        local function onActivated() incrementPage() end

        local nextPageButtonTemplate = Utils.getDescendantByName(clonedScene,
                                                                 "NextPageButtonTemplate")

        local nextButton = Utils.getDescendantByName(nextPageButtonTemplate,
                                                     "TextButton")

        print('nextButton' .. ' - start');
        print(nextButton);
        print('nextButton' .. ' - end');

        nextButton.MouseButton1Click:Connect(onActivated)

        ButtonBlock.renderButtonBlock(renderButtonBlockProps)
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

