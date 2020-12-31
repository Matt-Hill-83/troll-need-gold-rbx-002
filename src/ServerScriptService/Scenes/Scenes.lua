local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Constants = require(Sss.Source.Constants.Constants)

local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local TheaterSeat = require(Sss.Source.TheaterSeat.TheaterSeat)
local Teleporters = require(Sss.Source.Teleporters.Teleporters)
local DropBox = require(Sss.Source.DropBox.DropBox)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)

local module = {}

-- TODO mount scene on scene mount plate
-- TODO mount scene on scene mount plate
-- TODO mount scene on scene mount plate
-- TODO mount scene on scene mount plate

function module.addScenes(props)
    local parent = props.parent
    -- local mountPlate = props.mountPlate
    local sceneConfigs = props.sceneConfigs
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder
    local questIndex = props.questIndex
    -- local skyBoxTeleporter = props.skyBoxTeleporter

    local sceneTemplateModel = Utils.getFirstDescendantByName(questFolder,
                                                              "SceneTemplate")
    local sceneBase = Utils.getFirstDescendantByName(questFolder, "SceneBase")

    local sceneStartCFrame = getInitialSceneCFrame(
                                 {
            gridPadding = gridPadding,
            parent = parent,
            child = sceneBase
        })

    local wordBoxTemplate = Utils.getFromTemplates("WordBoxTemplate")
    print('wordBoxTemplate' .. ' - start');
    print(wordBoxTemplate);

    local letterFallTemplate = Utils.getFromTemplates("LetterFallTemplate")
    for sceneIndex, sceneConfig in ipairs(sceneConfigs) do
        local newPosition = getNewScenePosition(
                                {
                coordinates = sceneConfig.coordinates,
                template = sceneBase
            })
        -- 
        -- 
        -- 
        local clonedScene = sceneTemplateModel:Clone()
        -- 
        local translateCFrameProps = {
            parent = parent,
            child = clonedScene.PrimaryPart,
            offsetConfig = {
                useParentNearEdge = Vector3.new(0, -1, 1),
                useChildNearEdge = Vector3.new(0, -1, 1),
                offsetAdder = Vector3.new(0, 0, 0)
            }
        }

        local newCFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                              translateCFrameProps)

        local cFrame = newCFrame * CFrame.new(newPosition)
        -- 
        -- 
        -- 
        -- 

        -- local clonedScene = Utils.cloneModel(
        --                         {
        --         model = sceneTemplateModel,
        --         cFrame = CFrame.new(newPosition) * sceneStartCFrame,
        --         suffix = "Clone" .. "-Q" .. questIndex .. "-S" .. sceneIndex
        --     })

        clonedScene.Parent = sceneTemplateModel.Parent
        clonedScene.Name = clonedScene.Name .. "Clone" .. "-Q" .. questIndex ..
                               "-S" .. sceneIndex
        clonedScene:SetPrimaryPartCFrame(cFrame)

        local defaultWords = {'CAT', 'HAT', 'MAT', 'PAT', 'RAT', 'SAT', "CHAT"}
        local words = defaultWords
        if #questConfig.words2 > 0 then words = questConfig.words2 end

        -- Add teleporters after MinGame is added, because they could be located
        --  in mini game
        -- local localTPPositioner = nil
        -- if sceneConfig.isStartScene then
        --     localTPPositioner = Utils.getFirstDescendantByName(clonedScene,
        --                                                        "MiniGameTeleporterPositioner")
        --     Teleporters.addTeleporters({
        --         parent = clonedScene,
        --         sceneIndex = sceneIndex,
        --         questIndex = questIndex,
        --         isStartScene = sceneConfig.isStartScene,
        --         isEndScene = sceneConfig.isEndScene,
        --         questTitle = questConfig.questTitle,
        --         skyBoxTeleporter = skyBoxTeleporter,
        --         localTPPositioner = localTPPositioner
        --     })
        -- end
        -- if sceneConfig.isEndScene then
        --     localTPPositioner = Utils.getFirstDescendantByName(clonedScene,
        --                                                        "LocalTeleporterPositioner")
        --     Teleporters.addTeleporters({
        --         parent = clonedScene,
        --         sceneIndex = sceneIndex,
        --         questIndex = questIndex,
        --         isStartScene = sceneConfig.isStartScene,
        --         isEndScene = sceneConfig.isEndScene,
        --         questTitle = questConfig.questTitle,
        --         skyBoxTeleporter = skyBoxTeleporter,
        --         localTPPositioner = localTPPositioner
        --     })
        -- end

        function onCorrectItemDropped()

            local manHoleCover = Utils.getFirstDescendantByName(clonedScene,
                                                                "ManHoleCover")
            if manHoleCover then manHoleCover:Destroy() end
        end

        local dropBox = Utils.getFirstDescendantByName(clonedScene,
                                                       "DropBoxModel")
        local dropBoxItem = sceneConfig.item or {name = "GemTemplate"}
        DropBox.configDropBox({
            scene = clonedScene,
            sceneIndex = sceneIndex,
            questIndex = questIndex,
            isStartScene = sceneConfig.isStartScene,
            isEndScene = sceneConfig.isEndScene,
            dropBox = dropBox,
            onCorrectItemDropped = onCorrectItemDropped,
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
end

getInitialSceneCFrame = function(props)
    local parent = props.parent
    local child = props.child
    local gridPadding = props.gridPadding

    local desiredOffsetFromParentEdge = Vector3.new(0, 0, -gridPadding / 2)

    local translateCFrameProps = {
        parent = parent,
        child = child,
        offsetConfig = {
            useParentNearEdge = Vector3.new(0, -1, 1),
            useChildNearEdge = Vector3.new(0, -1, 1),
            offsetAdder = desiredOffsetFromParentEdge
        }
    }

    local output = Utils3.setCFrameFromDesiredEdgeOffset(translateCFrameProps)
    return output
    -- local rotatedCFrame = CFrame.Angles(0, math.rad(180), 0)
    -- output = output:ToWorldSpace(rotatedCFrame)

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
