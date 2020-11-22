local module = {}
local Sss = game:GetService("ServerScriptService")

local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)
local Dialog = require(Sss.Source.AddDialog.Dialog)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local ButtonBlock = require(Sss.Source.AddDialog.ButtonBlock)
local Utils = require(Sss.Source.Utils.Utils)
local Constants = require(Sss.Source.Constants.Constants)

renderCharacters02 = function(parent, itemConfigs)
    local itemProps = {size = Vector3.new(4, 6, 1), partName = "Items"}

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(-1, -1, -1),
        moveTowardZero = Vector3.new(1, 1, -1),
        alignToChildFarEdge = Vector3.new(1, -1, -1)
    }

    local rowProps = {
        parent = parent,
        gapBetweenRowItems = Vector3.new(1, 0, 0),
        itemDuplicationConfig = itemDuplicationConfig,
        offset = Vector3.new(3, 2, 0)
    }

    local props = {
        rowProps = rowProps,
        itemConfigs = itemConfigs,
        itemProps = itemProps
    }

    return RowOfParts.createRowOfParts(props)
end

renderCharacters = function(parent, itemConfigs)
    for i, itemConfig in ipairs(itemConfigs) do
        local dataFileName = itemConfig.name
        if (not itemConfig.decalId) then
            if (Constants.characters[dataFileName]) then
                itemConfig.decalId =
                    Constants.characters[dataFileName]['decalId']
            else
                itemConfig.decalId = "5897424121"
            end
        end

    end

    local characterScale = 0.6
    local itemProps = {
        size = Vector3.new(6 * characterScale, 8 * characterScale, 0.5),
        partName = "Characters"
    }

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, -1, -1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, -1, -1)
    }

    local rowProps = {
        parent = parent,
        itemDuplicationConfig = itemDuplicationConfig,
        gapBetweenRowItems = Vector3.new(1, 0, 0),
        offset = Vector3.new(-1, 0.5, 0)
    }

    local props = {
        rowProps = rowProps,
        itemConfigs = itemConfigs,
        itemProps = itemProps
    }

    return RowOfParts.createRowOfParts(props)
end

getScenePosition = function(parent, child)
    local desiredOffsetFromParentEdge = Vector3.new(0, 0, 0)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, -1, -1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, 1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = child.Size,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    return RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

getStartPosition = function(parent, child)
    local childSize = child.Size
    local desiredOffsetFromParentEdge = Vector3.new(0, 0, 0)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, -1, -1),
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
    local template = props.template
    local coordinates = props.coordinates
    local gapZ = props.gapZ

    local gapX = 8

    local newX = -(template.Size.X + gapX) * coordinates.col
    local newZ = gapZ + coordinates.row * 50

    return Vector3.new(newX, 0, newZ)
end

function addItemsToScene(props)
    local newScene = props.newScene
    local pageNum = props.pageNum
    local sceneConfig = props.sceneConfig

    local characterConfigs01 = sceneConfig.frames[pageNum].characters01
    local itemConfigs = sceneConfig.frames[pageNum].characters02
    local dialogConfigs = sceneConfig.frames[pageNum].dialogs

    renderCharacters(newScene, characterConfigs01)
    renderCharacters02(newScene, itemConfigs)

    return Dialog.renderDialog({
        parent = newScene,
        dialogConfigs = dialogConfigs,
        pageNum = pageNum
    })
end

function addScenes(props)
    local parent = props.parent
    local templatesFolder = props.templatesFolder
    local sceneConfigs = props.sceneConfigs
    local sceneTemplateModel = props.sceneTemplateModel
    -- local sceneTemplate = props.sceneTemplate
    local gapZ = props.gapZ

    local modelName = "SceneTemplate"

    local sceneTemplate = Utils.getModelRoot(
                              {
            modelName = modelName .. "Model",
            parent = templatesFolder
        })

    local sceneTemplateRootPart = sceneTemplate.modelRootPart

    for i, sceneConfig in ipairs(sceneConfigs) do
        local numPages = #sceneConfig.frames
        local pageNum = 1
        local buttonParent = nil

        local newPosition = getNewPosition(
                                {
                coordinates = sceneConfig.coordinates,
                gapZ = gapZ,
                template = sceneTemplateRootPart
            })

        local clonedScene = Utils.cloneModel(
                                {
                modelName = modelName,
                parent = templatesFolder,
                position = newPosition + parent.Position
            })
        local newScene = clonedScene.PrimaryPart

        local sceneProps = {
            newScene = newScene,
            pageNum = pageNum,
            sceneConfig = sceneConfig
        }

        buttonParent = addItemsToScene(sceneProps)

        function incrementPage()
            local newPageNum = pageNum + 1

            if newPageNum <= numPages then
                pageNum = newPageNum

                local children = newScene:GetChildren()
                for _, item in pairs(children) do
                    local match1 = string.match(item.Name, "Items-")
                    local match2 = string.match(item.Name, "Characters-")
                    local match3 = string.match(item.Name, "Dialog-")
                    if item:IsA('Part') and (match1 or match2 or match3) then
                        item:Destroy()
                    end
                end

                local newSceneProps = {
                    newScene = newScene,
                    pageNum = pageNum,
                    sceneConfig = sceneConfig
                }
                buttonParent = addItemsToScene(newSceneProps)
            end
        end

        local renderButtonBlockProps = {
            parent = newScene,
            sibling = buttonParent,
            incrementPage = incrementPage,
            pageNum = pageNum
        }

        ButtonBlock.renderButtonBlock(renderButtonBlockProps)
    end
end

function addRemoteObjects()
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

    local templatesFolder = myStuff:FindFirstChild("Templates")
    local sceneTemplateModel = templatesFolder:FindFirstChild(
                                   "SceneTemplateModel")

    local modelName = "SceneTemplate"

    local sceneBase = Utils.getModelRoot(
                          {
            modelName = modelName .. "Model",
            parent = templatesFolder
        })
    local sceneBaseRootPart = sceneBase.modelRootPart
    print('sceneBaseRootPart' .. ' - start');
    print(sceneBaseRootPart);
    print('sceneBaseRootPart' .. ' - end');

    for i, quest in pairs(questConfigs) do
        local addScenesProps = {
            gapZ = 50 * i - 1,
            sceneTemplateModel = sceneTemplateModel,
            templatesFolder = templatesFolder,
            sceneTemplate = sceneBaseRootPart,
            -- sceneBaseTemplate = sceneBaseRootPart,
            sceneConfigs = quest,
            parent = sceneOrigins[1]
        }
        addScenes(addScenesProps)

    end

end

module.addRemoteObjects = addRemoteObjects
return module

