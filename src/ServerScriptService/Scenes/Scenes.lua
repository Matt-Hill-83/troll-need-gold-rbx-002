local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local TheaterSeat = require(Sss.Source.TheaterSeat.TheaterSeat)
local Teleporters = require(Sss.Source.Teleporters.Teleporters)
local MiniGame = require(Sss.Source.MiniGame.MiniGame)
local DropBox = require(Sss.Source.DropBox.DropBox)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function module.addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder
    local questIndex = props.questIndex

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

    local letterFallTemplate = Utils.getFromTemplates("LetterFallTemplate")
    for sceneIndex, sceneConfig in ipairs(sceneConfigs) do
        local entered2 = {value = false}

        local newPosition = getNewScenePosition(
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

        local words = {
            {'C', 'A', 'T'}, {'B', 'A', 'T'}, {'H', 'A', 'T'}, {'M', 'A', 'T'},
            {'P', 'A', 'T'}, {'R', 'A', 'T'}, {'S', 'A', 'T'}
        }

        MiniGame.addMiniGame({
            clonedScene = clonedScene,
            words = words,
            sceneIndex = sceneIndex,
            questIndex = questIndex,
            letterFallTemplate = letterFallTemplate,
            isStartScene = sceneConfig.isStartScene,
            questTitle = questConfig.questTitle
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

        local sceneFolder = Utils.getOrCreateFolder(
                                {
                name = clonedScene.Name .. sceneIndex,
                parent = questFolder
            })

        clonedScene.Parent = sceneFolder

        function addCharactersToScene(charProps)
            Characters.addCharactersToScene(charProps)
        end

        local seats = Utils.getDescendantsByName(clonedScene, "CouchSeat")

        for i, seat in ipairs(seats) do
            local addSeatProps = {
                seat = seat,
                clonedScene = clonedScene,
                sceneConfig = sceneConfig,
                addCharactersToScene = addCharactersToScene,
                sceneFolder = sceneFolder
            }

            TheaterSeat.addSeat(addSeatProps)
        end

        Bridges.configBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local charProps = {
            frameConfig = sceneConfig.frames[1],
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
    letterFallTemplate:Destroy()
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

function getNewScenePosition(props)
    local coordinates = props.coordinates
    local gapX = Constants.islandLength + Constants.bridgeLength
    local newX = -(gapX + Constants.buffer) * coordinates.col
    local newZ = coordinates.row *
                     (Constants.islandLength + Constants.bridgeLength +
                         Constants.buffer)
    return Vector3.new(newX, 0, -newZ)
end
return module
